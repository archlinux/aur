# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=aom-psy101
pkgname=$_pkgname-git
pkgver=3.14.1.r174.74890d72b1
pkgrel=1
pkgdesc='Another aom psy fork'
arch=(x86_64)
url=https://gitlab.com/damian101/aom-psy101
license=('BSD-2-Clause' 'LicenseRef-PATENTS')
depends=(gcc-libs)
makedepends=(
  git
  cmake
  clang
  lld
  perl
  yasm
  vmaf
)
optdepends=(
  aom-docs
  vmaf
)
provides=(
  aom
  libaom.so
)
conflicts=(aom)
replaces=($_pkgname-vmaf-git)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  git -C $_pkgname describe --long --tags | \
    sed -E 's/^v//; s/-([^-]*)-g([^-]*)$/-r\1.\2/; s/-/./g'
}

build() {
  export CC=clang CXX=clang++
  export LDFLAGS+=' -fuse-ld=lld'
  CFLAGS=${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=0}
  CXXFLAGS=${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=0}
  cmake -S $_pkgname -B build \
    -DENABLE_TESTS=OFF \
    -DENABLE_DOCS=OFF \
    -DCONFIG_TUNE_VMAF=1 \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 $_pkgname/{LICENSE,PATENTS} \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
