# Maintainer: Brian Biduock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=rarian
pkgver=0.8.5
pkgrel=4
pkgdesc="Documentation meta-data library, designed as a replacement for Scrollkeeper"
arch=(
  x86_64
  i686
)
url="https://gitlab.freedesktop.org/rarian/rarian"
license=(GPL)
depends=(
  gcc-libs
  glibc
  sh
  tinyxml
)
makedepends=(
  check # Here instead of checkdepends since configure fails without it
  libxslt
)
checkdepends=(
  man-db
  man-pages
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  'd480de82f61feab390e9f69c640a1b8a71b6a8d1d0c5f8c4480829e743f0c4a4'
  'a58398bdd86a37a8b7f69b86630f05418f272cd4a51d8b03892364f7c6ff7c44'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Some tests fail for some users due to locale issues that I've not been able
  # to work around - disable these tests for now.
  patch --strip=1 --input="$srcdir/remove-failing-tests.patch"
}

build() {
  cd "$_archive"

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
  cd "$_archive"

  export LANG=C LC_ALL=C
  make check
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir" install
}
