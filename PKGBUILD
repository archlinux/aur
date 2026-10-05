# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=lomi
pkgver=0.6.0
pkgrel=1
pkgdesc='A workspace for terminal-driven development'
arch=('x86_64')
url='https://github.com/lomi-dev/lomi'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=('git: source control and repository history')
makedepends=('rust' 'nodejs' 'pnpm' 'librsvg')
provides=('lomi')
conflicts=('lomi-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# The publication workflow replaces SKIP with the released source's SHA-256.
sha256sums=('0cf81cf9e3fa8cc1151df7e48565ad6fa442a743f971c5466d7aa72db3fea35d')

prepare() {
  cd "${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"
  pnpm tauri build --bundles deb -- --locked
}

package() {
  cp -a "${srcdir}/cargo-target/release/bundle/deb/"*/data/* "${pkgdir}/"
}
