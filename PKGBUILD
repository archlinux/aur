# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=gsas2-svn
_pkgname=gsas2
pkgver=2692
pkgrel=1
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xor.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python2 python2-scipy python2-matplotlib wxpython python2-opengl python2-numpy)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion)
source=("${_pkgname}::svn+https://subversion.xor.aps.anl.gov/pyGSAS/trunk/"
	"GSASII.desktop"
	"rungsas2")

md5sums=('SKIP'
	'e9d06aed1866e65ce8259cfd5a31e1ce'
	'c114904d9eb6130abfb83e3d23adf005')

pkgver() {
	  cd "${SRCDEST}/${_pkgname}"
	  svnversion | tr -d [A-z]
}

build() 
{
	msg "Nothing to do in build()"
}

package()
{
	mkdir -p "$pkgdir/opt/${_pkgname}"
	mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}/"
	mkdir -p "$pkgdir/usr/share/applications/"

	#remove unecessary libraries for other platforms
	( cd $srcdir/${_pkgname}

	[ "${CARCH}" == "i686" ] && rm -rf binlinux64-2.7
	[ "${CARCH}" == "x86_64" ] && rm -rf binlinux2.7

	for _dir in {binmac,binwin}{,64-}2.7-bak; do
		rm -rf ${_dir}
	done

	#already in depends
	rm -rf PyOpenGL-3.0.2a5.zip 
	)
	
	#Install gsas-2 files:
	cp -a $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}
	
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
