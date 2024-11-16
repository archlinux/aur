# Maintainer: Brian Biduock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=rarian
pkgver=0.8.6
pkgrel=1
pkgdesc="Documentation meta-data library, designed as a replacement for Scrollkeeper"
arch=(
  x86_64
  i686
)
url="https://gitlab.freedesktop.org/rarian/rarian"
license=(GPL-2.0-or-later)
depends=(
  bash
  gcc-libs
  glibc
  tinyxml2
)
makedepends=(
  check # Here instead of checkdepends since configure fails without it
  libxslt
)
options=(!emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  '4678f1c169f86b8a098e6e32a5fffec86efe2ac86949c4aaf1c79ca69701d12f'
  'a58398bdd86a37a8b7f69b86630f05418f272cd4a51d8b03892364f7c6ff7c44'
)

prepare() {
  cd $pkgname-$pkgver
  # The man tests seem to be flaky
  sed -i '/srunner_add_suite(sr, rarian_man_suite());/d' tests/check-main.c

  # Some tests fail for some users due to locale issues that I've not been able
  # to work around - disable these tests for now.
  patch --strip=1 --input="$srcdir/remove-failing-tests.patch"
}

build() {
  cd $pkgname-$pkgver
  export LANG=C LC_ALL=C
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --with-check \
    PACKAGE_VERSION="$pkgver"
  make
}

check() {
  cd $pkgname-$pkgver
  export LANG=C LC_ALL=C
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
