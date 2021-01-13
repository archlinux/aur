# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libmikmod-git
pkgver=3.3.11.1
pkgrel=1
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM"
url=http://mikmod.sourceforge.net
license=(GPL2 LGPL2.1)
arch=(x86_64)
depends=(glibc libpulse sh)
makedepends=(alsa-lib cmake)
provides=(libmikmod.so libmikmod)
conflicts=(libmikmod)
source=(git://git.code.sf.net/p/mikmod/mikmod.git
        cmake-man.diff)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd mikmod
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd mikmod
  patch -Np1 -i ../cmake-man.diff
}

build() {
  # cmake ignores CPPFLAGS
  CFLAGS+=" $CPPFLAGS"

  cmake -H$mikmod -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DL=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --build build --target install

  install -Dt "$pkgdir/usr/share/aclocal" -m644 libmikmod/libmikmod.m4
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 \
    libmikmod/{NEWS,README,TODO} build/docs/mikmod.html
  install -Dt "$pkgdir/usr/share/info" build/docs/mikmod.info
  install -Dt "$pkgdir/usr/share/man/man1" build/docs/libmikmod-config.1
}

# vim: ts=2 sw=2 et:

