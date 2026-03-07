# vim:set ts=2 sw=2 et:
# Maintainer: Xinkai Chen <xinkai.chen at qq dot com>

pkgbase=dictype
pkgname=(dictype dictype-fcitx)
pkgver=0.0.6
pkgrel=2
pkgdesc='real-time voice-to-text input on Linux'
arch=('x86_64')
url='https://github.com/Xinkai/dictype'
license=('MIT')
_depends_common=(
  libprotobuf.so=33.1.0-64
  libgrpc++.so=1.78-64
)
makedepends=(
  cargo
  clang
  cmake
  fcitx5
  grpc
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3ad234cbe8089f4a3fc26e2cacf4b4fa4d11c015e33254a99717d78732978b73ef594dbf78cc178edacd1254da113a2970cd97e7be3ccc3c5822e247f189b992')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # dictyped
  cargo build --release --package dictyped

  # dictype-fcitx
  cmake \
      -S "${srcdir}/${pkgbase}-${pkgver}" \
      -B "build" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_CXX_COMPILER=clang++ \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_SKIP_INSTALL_RPATH=ON \
      -DBUILD_TESTING=0
  cmake --build build
}

package_dictype() {
  pkgdesc="dictype daemon"
  depends=("${_depends_common[@]}" pulse-native-provider)

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
