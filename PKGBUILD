# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=ytermusic
pkgver=0.0.10
_pkgvertag="alpha-$pkgver"
pkgrel=1
pkgdesc="A terminal based Youtube Music Player. It's aims to be as fast and simple as possible. Writtten in Rust."
url="https://github.com/ccgauche/ytermusic"
arch=('x86_64' 'armv7h' 'aarch64')
license=('Apache')
depends=('alsa-lib')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ccgauche/ytermusic/archive/refs/tags/$_pkgvertag.tar.gz")
sha256sums=('fa90f7bb4a04c881e84d84eb9a2f08f66d8da45f5f1378a24d3cabfad7c11b5e')

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
