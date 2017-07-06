# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=gsas2-svn
_pkgname=gsas2
pkgver=2912
pkgrel=2
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xray.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python2 python2-scipy python2-matplotlib wxpython python2-opengl python2-numpy gcc-fortran)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion scons)
optdepends=(python2-h5py)

source=("${_pkgname}::svn+https://subversion.xray.aps.anl.gov/pyGSAS/trunk/"
	"GSASII.desktop"
	"rungsas2"
	"SConstruct.patch")

md5sums=('SKIP'
	'e9d06aed1866e65ce8259cfd5a31e1ce'
	'62855c475e29b88b23a446ba4ffd91be'
	'3d4b6dd46d76b39b216e1fac0e72f916')

pkgver() {
	  cd "${SRCDEST}/${_pkgname}"
	  svnversion | tr -d [A-z]
}

prepare() {
	cd $srcdir/${_pkgname}/fsource
	patch -p0 < $srcdir/SConstruct.patch
}

build() 
{
	cd $srcdir/${_pkgname}/fsource
	scons
}


package()
{
	mkdir -p "$pkgdir/opt/${_pkgname}"
	mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}/"
	mkdir -p "$pkgdir/usr/share/applications/"

	#Install gsas-2 files:
	cp -a $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}

	#remove unecessary libraries for other platforms
	( cd $pkgdir/opt/${_pkgname}

	fortran_libs="fellipse.so  histogram2d.so  histosigma2d.so  pack_f.so  polymask.so  pydiffax.so  pypowder.so  pyspg.so  pytexture.so  unpack_cbf.so"
	mkdir _fsource
	for lib in ${fortran_libs}; do
		cp fsource/${lib} _fsource/lib
	done
	rm -r fsource
	mv _fsource fsource

#	[ "${CARCH}" == "i686" ] && rm -rf binlinux64-2.7
#	[ "${CARCH}" == "x86_64" ] && rm -rf binlinux2.7

	for _dir in bin{mac,win,linux}{,64-}2.7; do
		rm -rf ${_dir}
	done

	#already in depends
	rm -rf PyOpenGL-3.0.2a5.zip 
	)
	
	
	#Install Desktop files:
	install -m 644 -D "$srcdir/GSASII.desktop" "$pkgdir/usr/share/applications/GSASII.desktop"
	
	#Install and link executables:
	cp "$srcdir/rungsas2" "$pkgdir/opt/gsas2/${_pkgname}"
	chmod +x "$pkgdir/opt/${_pkgname}/gsas2"

	mkdir -p "$pkgdir/usr/bin"
	
	#Linking executable
	( cd "$pkgdir/usr/bin"
	ln -s ../../opt/${_pkgname}/gsas2 gsas2 )
}
