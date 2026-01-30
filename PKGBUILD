# Maintainer: Malte Linke <me@parzival.space>

pkgname=eso-addons-manager
pkgdesc='Cross platform addon manager for the Elder Scrolls Online'
pkgver=0.4.13
pkgrel=1
arch=('x86_64')
url="https://github.com/arviceblot/eso-addons"
license=('MIT')
provides=('eso-addons-manager')
conflicts=('eso-addons-manager')
options=('!lto')
depends=(
  glibc
  gcc-libs
)
makedepends=(
  git
  cargo
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/arviceblot/eso-addons/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  "bcf6ec03edeb33d5c321f7a4ba2f1182d709e2d83d015db5226ae2beb8e786e8"
)

prepare() {
  # directory name inside the tarball is eso-addons-<version>
  cd "${srcdir}/eso-addons-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/eso-addons-${pkgver}"
  cargo build --frozen --release --no-default-features
}

package() {
  install -Dm755 "${srcdir}/eso-addons-${pkgver}/target/release/eso-addon-manager" "$pkgdir/usr/bin/eso-addon-manager"
  install -Dm644 "${srcdir}/eso-addons-${pkgver}/data/com.arviceblot.eso-addon-manager.desktop" "$pkgdir/usr/share/applications/com.arviceblot.eso-addon-manager.desktop"
  install -Dm644 "${srcdir}/eso-addons-${pkgver}/data/com.arviceblot.eso-addon-manager.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.arviceblot.eso-addon-manager.svg"
  install -Dm644 "${srcdir}/eso-addons-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
