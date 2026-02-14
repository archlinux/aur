# vim:set ts=2 sw=2 et:
# Maintainer: Xinkai Chen <xinkai.chen at qq dot com>

pkgbase=dictype
pkgname=(dictype dictype-fcitx)
pkgver=0.0.2
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
sha512sums=('833ac5b8fcaa8cb69b9c4dd7ce8f52b5d4ee215303cdfa516814c22964d82f40d8b97252fc5f1f666e49916cf1881c04941cc8eecb956d7151935a93f864c400')

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
