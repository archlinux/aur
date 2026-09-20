# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplebench
pkgver=0.4.0
pkgrel=1
pkgdesc='A workspace for terminal-driven development'
arch=('x86_64')
url='https://github.com/MaciejKolerski/simplebench'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'hicolor-icon-theme')
optdepends=('git: source control and repository history')
makedepends=('rust' 'nodejs' 'pnpm' 'librsvg')
provides=('simplebench')
conflicts=('simplebench-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# The publication workflow replaces SKIP with the released source's SHA-256.
sha256sums=('b2d70131f0c37f6f8e1a39e68deab2f377c03c268cc5979ba21ed2f4370fd83e')

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
