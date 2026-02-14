# vim:set ts=2 sw=2 et:
# Maintainer: Xinkai Chen <xinkai.chen at qq dot com>

pkgbase=dictype
pkgname=(dictype dictype-fcitx)
pkgver=0.0.1
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
sha512sums=('a2137070c0f24fbc4db1c7332348b2526bb446fbbe7c5ce9bc3856c90d0ed2dfe294f7e658610ec7f9810e42ebaf71558518f7efa853a2001f048c6924478d27')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # dictyped
  cargo build --release --frozen --package dictyped

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
