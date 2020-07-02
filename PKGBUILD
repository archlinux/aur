# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=neovide
pkgver=0.6.0
pkgrel=7
pkgdesc='No Nonsense Neovim Client in Rust'
arch=('x86_64')
url='https://github.com/Kethku/neovide'
license=('MIT')
depends=('neovim' 'fontconfig' 'freetype2' 'libglvnd' 'sndio')
makedepends=('rust' 'gtk3' 'cmake' 'sdl2' 'make')
optdepends=("vulkan-intel: vulkan support for intel")
provides=("neovide")
conflicts=("neovide-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "0001-Remove-unnecessary-braces-around-if-condition.patch")
sha256sums=('4daaad6ff527c299b9fa3db677bc1320b9596efbc27853ed730a57df6c1568fd'
            '53c28f4f6d9f0dee319188d1dc733ace0500f8c616941110936967e962e605dc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/0001-Remove-unnecessary-braces-around-if-condition.patch"
  sed -i 's/debug = true/opt-level = 3\ndebug = false/' Cargo.toml
  sed -i 's/Icon=neovide/Icon=nvim/' assets/neovide.desktop
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
  export CFLAGS="-fcommon -fPIE"
  cargo build --release
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/neovide/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/neovide" "${pkgdir}/usr/bin/neovide"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/neovide.desktop" "${pkgdir}/usr/share/applications/neovide.desktop"
}

# vim: ts=2 sw=2 et:
