# Maintainer: jaboll <spexe0011@gmail.com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=open-quickshare
pkgver=0.16.1
pkgrel=1
pkgdesc="Complete Quick Share implementation for Linux with Bluetooth LE and Wi-Fi Direct"
arch=('x86_64' 'aarch64')
url="https://github.com/ignotusbucius/${pkgname}"
license=('GPL-3.0-only')

depends=(
  'gtk3'
  'libayatana-appindicator'
  'libsoup3'
  'webkit2gtk-4.1'
  'bluez'
  'networkmanager'
)

optdepends=(
  'wpa_supplicant: Wi-Fi Direct support with a compatible NetworkManager backend'
  'bluez-utils: Bluetooth troubleshooting utilities'
)

makedepends=(
  'cargo'
  'nodejs'
  'pnpm'
  'protobuf'
)

provides=(
  'r-quick-share'
  'rquickshare'
)

conflicts=(
  'r-quick-share'
  'rquickshare'
)

options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('2da72630d6289bdd31368c55e023a7447eae8e5986fb9994cd6f76047ec95a64')

prepare() {
  cd "${pkgname}-$pkgver/app/main"
  cargo update --manifest-path src-tauri/Cargo.toml -p bluer --precise 0.17.4 # fix: inconsistent version pinning in upstream
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-$pkgver/app/main"
  pnpm tauri build -b deb
}

package() {
  cd "${pkgname}-$pkgver/app/main"
  cp -a src-tauri/target/release/bundle/deb/${pkgname}_${pkgver}_*/data/* "${pkgdir}"
}
