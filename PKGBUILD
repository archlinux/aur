# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=ios-notif-forward
pkgver=0.1.1
pkgrel=1
pkgdesc="Forward notifications from Apple devices to your desktop."
url="https://github.com/impiaaa/ios-notif-forward"
arch=('x86_64')
license=('MIT')
depends=('gtk3' 'xdotool' 'libappindicator-gtk3')
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/impiaaa/ios-notif-forward/archive/refs/tags/v${pkgver}.tar.gz"
  "ios-notif-forward.service"
  "ios-notif-forward.desktop"
)
b2sums=('405c05a7fd2ebc3f16f7a4133713d8464b29cef7523243c1ab62c214501da812ebc5673f8d2a1b2279b03a03daa24f51b995a5f92043f1f8329dce042272ee90'
        'dce610dd9a1b2e292039731da28d1456e258344bfba53972060b7ef7b5b3a0372f5f1843521a970863c4faca864e9a1a03a076315cd19fb3b773409df83e68e5'
        'dce70aa4e097650a806119a04e85f29442182a2b2aaeaa479e13f10dd3c8d3e88c595cb0056381f67af8d5b06a09ebc4688fb14a03f4657865458496f3f39a16')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/icon.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${pkgname}-symbolic.svg"
  install -D -m644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/user/${pkgname}.service"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
