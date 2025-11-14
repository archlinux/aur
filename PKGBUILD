# Maintainer: Moabeat <moabeat at berlin dot de>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot-ncurses
_pkgname=ncspot
pkgver=1.3.2
pkgrel=1
pkgdesc='Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes'
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD-2-Clause')
provides=('ncspot')
conflicts=('ncspot' 'ncspot-git' 'ncspot-bin')
depends=('openssl' 'libpulse' 'libxcb' 'dbus' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'ncurses')
makedepends=('cargo' 'python' 'pkgconf' 'ueberzug' 'pandoc-cli')
optdepends=('ueberzug: display album art in terminal (X11 and wayland using ueberzugpp)')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hrkfdn/ncspot/archive/v${pkgver}.tar.gz")
b2sums=('f2d5c8ceb571bb20e53f1ac0fe740be927fe29227c50b2de32d17952e632e935c4a4706e1d537dc3da40bb8dcd539b7ff56ec4652a7a5e8fb057eb626af66b1e')
options=('!lto' '!debug' 'strip')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features --features "share_clipboard pulseaudio_backend mpris notify cover ncurses_backend"
  # generate docs
  pandoc README.md -t man -s --columns=500 | grep -vE "\[IMAGE:|Click to show/hide" > ncspot.1
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --features cover
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "misc/ncspot.desktop" "${pkgdir}/usr/share/applications/ncspot.desktop"
  install -Dm 644 "images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ncspot.svg"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "ncspot.1" "${pkgdir}/usr/share/man/man1/ncspot.1"
}
