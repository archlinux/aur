# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=neovide
pkgver=0.7.0
pkgrel=1
pkgdesc='No Nonsense Neovim Client in Rust'
arch=('x86_64')
url='https://github.com/Kethku/neovide'
license=('MIT')
depends=('neovim' 'fontconfig' 'freetype2' 'libglvnd' 'sndio')
makedepends=('rust' 'gtk3' 'cmake' 'sdl2' 'make')
optdepends=("vulkan-intel: vulkan support for intel")
provides=("neovide")
conflicts=("neovide-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('59a4bc94348d1e71b402a6202f6dfaba7248d1d5f4bbeeaff6965a7c421afc40')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/debug = true/opt-level = 3\ndebug = false/' Cargo.toml
  sed -i 's/Icon=neovide/Icon=nvim/' assets/neovide.desktop
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
  export CFLAGS="-fcommon -fPIE"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/neovide/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/neovide" "${pkgdir}/usr/bin/neovide"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/neovide.desktop" "${pkgdir}/usr/share/applications/neovide.desktop"
}

# vim: ts=2 sw=2 et:
