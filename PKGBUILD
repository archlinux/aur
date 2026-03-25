# Maintainer: GrishMahat <grishmahat@gmail.com>

pkgname=skycrypt
pkgver=0.1.7
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
sha256sums=('5d1858423ddca1ea8b9336296f475cf1142e71e6b52bd3af73784aaff1c682d2')

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
