# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=aom-psy101
pkgname=${_pkgname}-git
pkgver=3.11.0.r253.29c780eed1
pkgrel=1
pkgdesc='Another aom psy fork'
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
replaces=(${_pkgname}-vmaf-git)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  cmake -S $_pkgname -B aom_build \
    -DENABLE_TESTS=OFF \
    -DENABLE_DOCS=OFF \
    -DCONFIG_TUNE_VMAF=1 \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  make -C aom_build "$MAKEFLAGS"
}

package() {
  DESTDIR="$pkgdir" make -C aom_build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} \
    -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
