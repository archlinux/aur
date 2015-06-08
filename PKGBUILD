# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Committer: Zachary A. Jones <jazzplayerl9@gmail.com>

pkgname=gsas2-svn
_pkgname=gsas2
pkgver=1296
pkgrel=1
pkgdesc="General Structure Analysis System II - refinement for powder diffraction patterns"
arch=(i686 x86_64)
url="https://subversion.xor.aps.anl.gov/trac/pyGSAS"
license=(unknown)
depends=(python2 python2-scipy python2-matplotlib wxpython2.8 python2-opengl python2-numpy)
[ "${CARCH}" = "x86_64" ] && depends=("${depends[@]}")
makedepends=(subversion scons gcc-fortran)
source=("${_pkgname}::svn+https://subversion.xor.aps.anl.gov/pyGSAS/trunk/"
	"GSASII.desktop"
	"rungsas2"
	"wxversion.patch")

md5sums=('SKIP'
	'e9d06aed1866e65ce8259cfd5a31e1ce'
	'c114904d9eb6130abfb83e3d23adf005'
	'9d61d13f5f9674c101359bac2f6f590d')

pkgver() {
	  cd "${startdir}/${_pkgname}"
	  svnversion | tr -d [A-z]
}

build() 
{
	#Build Fortran components using scons
	cd "$srcdir/gsas2/fsource"
	sed -i 's/f2py/f2py2/g' SConstruct
	sed -i 's/python/python2/g' SConstruct
	scons
}

package()
{
	mkdir -p "$pkgdir/opt/${_pkgname}"
	mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}/"
	mkdir -p "$pkgdir/usr/share/applications/"
	
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

	#Patching for proper wx version'
	( cd $pkgdir/opt/gsas2
	patch -p0 < $srcdir/wxversion.patch )
}
