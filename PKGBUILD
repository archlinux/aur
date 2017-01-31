# $Id$
# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgname=isdn4k-utils
pkgname=lib32-${_pkgname}
pkgver=3.27
pkgrel=1
pkgdesc="CAPI support libraries"
arch=('x86_64')
url="http://www.isdn4linux.de/"
license=('GPL')
makedepends=('git')
depends=(${_pkgname})
source=(${_pkgname}::git+git://git.misdn.eu/${_pkgname}.git#tag=v${pkgver})
replaces=('lib32-capi4k-utils')
provides=('lib32-libcapi20')
md5sums=('SKIP')

prepare() {
  export CPPFLAGS="$CPPFLAGS -O2"
  export CC="gcc -m32"
  cd ${srcdir}/${_pkgname}/capi20
  libtoolize -i --force
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr --libdir=/usr/lib32 --datadir=/usr/lib/isdn
}

build() {
  cd ${srcdir}/${_pkgname}/capi20
  make
}

package() {
  cd ${srcdir}/${_pkgname}/capi20

  # For whatever reason, rm -rf'ing pkg/usr/include directory after make
  # install doesn't work. So this just installs everything but the include dir.
  make DESTDIR=${pkgdir} install-exec-am install-modulesLTLIBRARIES install-pcDATA
}
