# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
# Maintainer: Matthias Maennich <matthias@maennich.net>

pkgname=stg-git
pkgver=r712.2bfa1f8
pkgrel=1
pkgdesc="Symbol-Type Graph (STG) is an ABI representation and this project contains tools for the creation and comparison of such representations."
arch=(x86_64)
url="https://android.googlesource.com/platform/external/stg/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=(jemalloc libelf libxml2 protobuf)
makedepends=(cmake git)
provides=(stg)
source=("git+https://android.googlesource.com/platform/external/stg")
sha256sums=('SKIP')

pkgver() {
  cd stg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export LDFLAGS="-Wl,--copy-dt-needed-entries"
  cmake -B build -S stg \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build --parallel
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
