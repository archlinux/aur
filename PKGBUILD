# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=aom-psy101
pkgname=${_pkgname}-vmaf-git
pkgver=3.11.0.r253.29c780eed1
pkgrel=1
pkgdesc='Another aom psy fork, with vmaf support'
arch=(x86_64)
url=https://gitlab.com/damian101/aom-psy101
license=(BSD-2-Clause custom:PATENTS)
depends=(gcc-libs)
makedepends=(
  git
  cmake
  perl
  yasm
  vmaf
)
optdepends=(aom-docs)
provides=(aom)
conflicts=(aom)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  cd $_pkgname
  cmake -B _build \
    -DENABLE_TESTS=OFF \
    -DENABLE_DOCS=OFF \
    -DCONFIG_TUNE_VMAF=1 \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C _build "$MAKEFLAGS"
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make -C _build install
  install -Dm644 LICENSE PATENTS -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
