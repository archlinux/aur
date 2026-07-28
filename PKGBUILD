# Maintainer: Augusto Domingos [augustodomingosvasco@gmail.com](mailto:augustodomingosvasco@gmail.com)

pkgname=wiretray
pkgver=0.3.1
pkgrel=1
pkgdesc="A Linux Wi-Fi hotspot manager with a system tray interface"
arch=('x86_64')
url="https://github.com/aghastygd/wiretray"
license=('MIT')

depends=(
'gtk4'
'glib2'
'networkmanager'
'dnsmasq'
'iptables'
'hicolor-icon-theme'
)

makedepends=(
'rust'
'pkgconf'
'desktop-file-utils'
'gtk-update-icon-cache'
)

install=wiretray.install

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/aghastygd/wiretray/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('eb91482cff7b1bdf4a7390e4176f41ad6e5b1add27b7c9779fea607827cb535a')

prepare() {
cd "${srcdir}/${pkgname}-${pkgver}"

export CARGO_HOME="${srcdir}/cargo-home"

cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
cd "${srcdir}/${pkgname}-${pkgver}"

export CARGO_HOME="${srcdir}/cargo-home"

cargo build --frozen --release
}

check() {
cd "${srcdir}/${pkgname}-${pkgver}"

export CARGO_HOME="${srcdir}/cargo-home"

cargo test --frozen
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/wiretray" "${pkgdir}/usr/bin/wiretray"
  install -Dm755 "target/release/wiretray-settings" "${pkgdir}/usr/bin/wiretray-settings"

  install -Dm644 "data/applications/io.github.AghastyGD.Wiretray.desktop" "${pkgdir}/usr/share/applications/io.github.AghastyGD.Wiretray.desktop"

  install -Dm644 "assets/icons/app/io.github.AghastyGD.Wiretray.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.AghastyGD.Wiretray.png"

  install -Dm644 "data/io.github.AghastyGD.Wiretray.gschema.xml" "${pkgdir}/usr/share/glib-2.0/schemas/io.github.AghastyGD.Wiretray.gschema.xml"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
