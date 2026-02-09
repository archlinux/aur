# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=zsync2
_pkgver=2.0.0-alpha-1-20250926
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Rewrite of zsync-curl using modern C++"
arch=('x86_64')
url="https://github.com/AppImageCommunity/zsync2"
license=('Artistic-1.0-Perl')
depends=(
  'cpr'
  'curl'
  'libgcrypt'
)
makedepends=(
  'args'
  'cmake'
  'gtest'
)
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('7a24a9ce812e1ae10e8eb75cde576870412633da51c7df60124404f9b2f8254c')

build() {
  CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types"
  LDFLAGS="${LDFLAGS} -Wl,--copy-dt-needed-entries"
  cmake -B build -S "$pkgname-${_pkgver}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_CPR='ON' \
    -DUSE_SYSTEM_ARGS='ON' \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --parallel $(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$pkgname-${_pkgver}"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
