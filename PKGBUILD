# Maintainer: Jonathan Lahav <j.lahav@gmail.com>

pkgname=hushmark
pkgver=0.3.0
pkgrel=1
pkgdesc="Calm, minimalist Markdown reader"
arch=('x86_64')
url="https://github.com/SoleSoul/hushmark"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('rust' 'npm' 'pkgconf')
checkdepends=('desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db984f37b796aff662d05273a11950ce587424952f359a71178724b4445cf78a')

prepare() {
  cd "${pkgname}-${pkgver}"
  npm ci
}

build() {
  cd "${pkgname}-${pkgver}"
  npm run tauri -- build --no-bundle
}

check() {
  cd "${pkgname}-${pkgver}"
  desktop-file-validate packaging/linux/hushmark.desktop
  cargo test --manifest-path src-tauri/Cargo.toml --quiet --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 src-tauri/target/release/hushmark "${pkgdir}/usr/bin/hushmark"
  install -Dm644 packaging/linux/hushmark.desktop "${pkgdir}/usr/share/applications/hushmark.desktop"
  install -Dm644 src-tauri/icons/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hushmark.svg"
  install -Dm644 src-tauri/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hushmark.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
