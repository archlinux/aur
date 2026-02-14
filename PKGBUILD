# vim:set ts=2 sw=2 et:
# Maintainer: Xinkai Chen <xinkai.chen at qq dot com>

pkgbase=dictype
pkgname=(dictype dictype-fcitx)
pkgver=0.0.3
pkgrel=1
pkgdesc='real-time voice-to-text input on Linux'
arch=('x86_64')
url='https://github.com/Xinkai/dictype'
license=('MIT')
_depends_common=(
  libprotobuf.so=33.1.0-64
  libgrpc++.so=1.76-64
)
makedepends=(
  cargo
  clang
  cmake
  fcitx5
  grpc
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('683853b4164981d08ccb13d8dca5b026f2208a2ea3df79c2048d593002edf060ee77c47cca2fc0dea38fb09d7b4a66ba8ec9dccd3cda8b23dd0d7d00e29a08b6')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # dictyped
  cargo build --release --package dictyped

  # dictype-fcitx
  cmake \
      -S "${srcdir}/${pkgbase}-${pkgver}" \
      -B "build" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_SKIP_INSTALL_RPATH=ON \
      -DBUILD_TESTING=0
  cmake --build build
}

package_dictype() {
  pkgdesc="dictype daemon"
  depends=("${_depends_common[@]}")

  cd "$srcdir/${pkgbase}-${pkgver}"

  install -Dm755 \
    "target/release/dictyped" \
    "${pkgdir}/usr/bin/dictyped"

  install -Dm644 \
    "crates/dictyped/assets/dictyped.service" \
    "${pkgdir}/usr/lib/systemd/user/dictyped.service"
}

package_dictype-fcitx() {
  pkgdesc="dictype integration with fcitx5"
  depends=("${_depends_common[@]}" fcitx5 dictype)

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C build DESTDIR="${pkgdir}" install
}
