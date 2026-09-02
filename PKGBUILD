# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-c
pkgver=1.10.0
pkgrel=2
pkgdesc="C API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ninja' 'rust')
source=("https://github.com/eclipse-zenoh/zenoh-c/archive/$pkgver.tar.gz")
sha256sums=('c7bb6d90d6cbf1f612850e9bf00eaa27c47acd54247629c6de80b64e655607be')

_builddir="build-${pkgver}"

options=(!debug)

# Pull in fix for discovery regression introduced in 1.10.0
# https://github.com/eclipse-zenoh/zenoh/pull/2755
_zenoh_rev='c92d641defdb0617d37654f757401a499793a7ae'

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s|git = \"https://github.com/eclipse-zenoh/zenoh.git\", branch = \"release/1.10.0\"|git = \"https://github.com/eclipse-zenoh/zenoh.git\", rev = \"$_zenoh_rev\"|g" \
    Cargo.toml.in build-resources/opaque-types/Cargo.toml
  rm -f Cargo.lock build-resources/opaque-types/Cargo.lock
}

build() {
  # Discussion on LTO: https://github.com/briansmith/ring/issues/1444
  CFLAGS+=' -fno-lto'
  CXXFLAGS+=' -fno-lto'

  cmake -GNinja -B "${_builddir}" -S "$pkgname-$pkgver" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHC_BUILD_WITH_UNSTABLE_API:BOOL=ON \
           -DZENOHC_BUILD_WITH_SHARED_MEMORY:BOOL=ON
  cmake --build "${_builddir}"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${_builddir}"
}
