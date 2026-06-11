# Maintainer: Leriart <leriart@github.com>

pkgname=cava-bg
pkgver=0.2.5
pkgrel=1
pkgdesc="Audio visualizer for Wayland — background layer with dynamic wallpaper colors"
arch=('x86_64')
url="https://github.com/leriart/cava-bg"
license=('MIT')
depends=('cava' 'ffmpeg' 'wayland' 'libxkbcommon' 'libegl' 'libgl' 'dbus')
makedepends=('cargo' 'git' 'pkg-config')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leriart/cava-bg/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('48270609f5e2a9909cff589d6806748bdb49e8a8232cc343ad143af3fb03bd90')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "target/release/completions/${pkgname}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "target/release/completions/_${pkgname}" \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "target/release/completions/${pkgname}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
