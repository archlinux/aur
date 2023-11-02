# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname=ncspot
pkgname="${_pkgname}-git"
pkgver=0.13.4
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=(
   'openssl'
   'libpulse'
)
optdepends=(
   'portaudio: PortAudio backend'
   'ueberzugpp: display album art in terminal (X11)'
)
makedepends=(
   'rust'
   'cargo'
   'git'
   'alsa-lib'
   'python'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/hrkfdn/ncspot.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
#  cargo build --frozen --release --features "cover"
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --frozen --release
#  cargo test --frozen --release --features "cover"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "misc/ncspot.desktop" "${pkgdir}/usr/share/applications/ncspot.desktop"
  install -Dm 644 "images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ncspot.svg"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

