# Maintainer: Moabeat <moabeat at berlin dot de>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot-ncurses
_pkgname=ncspot
pkgver=1.3.3
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
b2sums=('aeec753e4103139952822337b180319dd0c4bb955c6e76c9b35288f02f4a2110d9e3279f15aae6516e4ea8fb96463e65fcb29ab0cfc5d8d1d678bdbf8756fced')
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
