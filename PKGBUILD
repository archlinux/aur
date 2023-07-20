# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=ytermusic
pkgver=0.1.0
_pkgvertag="alpha-$pkgver"
pkgrel=1
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64' 'armv7h' 'aarch64')
license=('Apache')
depends=('alsa-lib' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ccgauche/ytermusic/archive/refs/tags/$_pkgvertag.tar.gz")
sha256sums=('0a6457368a52c80700794bb96d03bfcf79dcb685fc00df7e491456074f167a75')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${_pkgvertag}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${_pkgvertag}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
