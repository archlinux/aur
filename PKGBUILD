# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=ytermusic
pkgver=0.1.5beta
_pkgvertag="beta-0.1.5"
pkgrel=2
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64' 'armv7h' 'aarch64')
license=('Apache')
depends=('alsa-lib' 'dbus')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ccgauche/ytermusic/archive/refs/tags/$_pkgvertag.tar.gz")
b2sums=('2d94328e9fca94b166cc53ad83645ba8bc13976ab67fab0e9324a805dcd82f1af32ef6c088edfa58124ce502a44de224f11c01dab8626a5a0cfc5f888230ac5c')

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
  # These upstream integration tests require live YouTube access; the ytpapi2
  # tests additionally require private headers.txt and account_id.txt files.
  cargo test --frozen --all-features -- \
    --skip video_download_test \
    --skip advanced_like \
    --skip advanced_test \
    --skip home_test
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-${_pkgvertag}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}-${_pkgvertag}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
