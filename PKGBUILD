# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=ytermusic
pkgver=0.1.0beta
_pkgvertag="beta-0.1.0"
pkgrel=1
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64' 'armv7h' 'aarch64')
license=('Apache')
depends=('alsa-lib' 'dbus')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ccgauche/ytermusic/archive/refs/tags/$_pkgvertag.tar.gz")
b2sums=('fb8f81cc20d0a81b8f1d8ee63cf1ca6105b523a1d77de067499a60413e96c25c2f508789810cfc2343dc1b9614f761217f94bb5a08607aa9dfe2e4536280657e')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  cargo build --frozen --release --all-features
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgvertag}"
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  cargo test --frozen --all-features
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${_pkgvertag}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${_pkgvertag}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
