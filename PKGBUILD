# vim:set ts=2 sw=2 et:
# Maintainer: Xinkai Chen <xinkai.chen at qq dot com>

pkgbase=dictype
pkgname=(dictype dictype-fcitx)
pkgver=0.0.7
pkgrel=1
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
sha512sums=('9ce95d217930dba6a1201d82af073adecf9c968cf31f12b33b4ae01bd3f2b6dae57f6f8fd79c85635a4179ef9060a8ed937fdc7a43bb1f0d1df3a6b70af0d852')

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
