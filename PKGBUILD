# Maintainer: b00rt00s <b00rt00s.aur@gmail.com>
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=gsas2-svn
_pkgname=gsas2
pkgver=4063
pkgrel=1
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xray.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python2 python2-scipy python2-matplotlib python2-opengl python2-numpy python2-backports.functools_lru_cache python2-pillow python2-h5py wxpython gcc-fortran)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion scons python2-numpy)
optdepends=(python2-h5py)

source=(#"${_pkgname}::svn+https://subversion.xray.aps.anl.gov/pyGSAS/trunk/#revision=${pkgver}"
	"${_pkgname}::svn+https://subversion.xray.aps.anl.gov/pyGSAS/trunk"
	"GSASII.desktop"
	"rungsas2")

md5sums=('SKIP'
	'06d168ec9ef40e2eaee88845a2626aed'
	'a31e17c7037361bf0ba1fe9a336086db')

pkgver() {
	  cd "${SRCDEST}/${_pkgname}"
	  svnversion | tr -d [A-z]
}

prepare()
{	
	cd $srcdir/${_pkgname}/fsource
	sed -i 's/f2py/f2py2/g' SConstruct
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
	rm -r fsource
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
