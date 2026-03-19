# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight desktop wrapper for SkyCrypt built with Rust and Tauri."
arch=('x86_64')
url="https://github.com/GrishMahat/SkyCrypt-desktop"
license=('MIT')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'librsvg'
  'libayatana-appindicator'
  'libsoup3'
  'hicolor-icon-theme'
)

makedepends=(
  'nodejs'
  'pnpm'
  'rust'
  'cargo'
  'pkgconf'
  'cmake'
  'clang'
  'dpkg'
  'git'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/SkyCrypt-desktop-${pkgver}"

  pnpm install --frozen-lockfile
  pnpm run build
  pnpm run tauri build -- --bundles deb
}

package() {
  cd "${srcdir}/SkyCrypt-desktop-${pkgver}"

  local deb_file
  deb_file=$(ls src-tauri/target/release/bundle/deb/*.deb | head -n 1)
  ar x "${deb_file}"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
