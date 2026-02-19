# Maintainer: Felix <felix.crabdrop@gmail.com>
pkgname=crabdrop
pkgver=0.3.5
pkgrel=1
pkgdesc="A simple, fast file manager for S3-compatible storage"
arch=('x86_64')
url="https://github.com/alsofelix/crabdrop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
makedepends=('cargo' 'npm' 'libappindicator-gtk3' 'librsvg' 'patchelf')
options=(!lto)
provides=('crabdrop')
conflicts=('crabdrop-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f4b04c2482376c8e563e4e534373bf38eb32b57dd5f4892c65b2236416d02f3d')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="${srcdir}/cargo"
  npm ci
  npm run tauri -- build --no-bundle
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 src-tauri/target/release/crabdrop -t "${pkgdir}/usr/bin/"
  install -Dm644 packaging/io.github.alsofelix.crabdrop.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 packaging/io.github.alsofelix.crabdrop.metainfo.xml -t "${pkgdir}/usr/share/metainfo/"

  install -Dm644 src-tauri/icons/32x32.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/io.github.alsofelix.crabdrop.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.alsofelix.crabdrop.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.alsofelix.crabdrop.png"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
