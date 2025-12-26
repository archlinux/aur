# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dan Johansen <strit@strits.dk>
# Contributor: Shaber

pkgname=libcsys-git
pkgver=5.0.0.r0.gb8ca438
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/libcsys"
groups=('coreapps')
license=('GPL-3.0-or-later')
depends=('qt6-base' 'udisks2')
makedepends=('cmake' 'git' 'ninja')
provides=("${pkgname%-git}" 'libcsys.so')
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cmake \
    -B build \
    -S "$pkgname" \
    -W no-dev \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

