# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=simplebench
pkgver=0.2.0
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
sha256sums=('47c3e4e429be5d1bd846e20d0e5b66018f9f9ba1dc223bb7db48d226f80dfc64')

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
