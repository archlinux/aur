# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=steamfetch
pkgver=0.5.7
pkgrel=1
epoch=
pkgdesc="neofetch for Steam - Display your Steam stats in terminal with style."
arch=('x86_64')
url="https://github.com/unhappychoice/steamfetch"
license=('ISC')
groups=()
depends=('glibc' 'libgcc' 'openssl')
makedepends=('rust' 'cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=('steamfetch-git' 'steamfetch-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('cd8184c8b1c0c53b5d2d4ff99e08a0cef778de641bb75ae6fa0d8dac4178dc66')
validpgpkeys=()

prepare() {
  cd "$srcdir/steamfetch-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/steamfetch-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "$srcdir/steamfetch-$pkgver"

  install -Dm755 "target/release/steamfetch" "$pkgdir/usr/bin/steamfetch"
  install -Dm755 target/release/build/steamworks-sys-*/out/libsteam_api.so "$pkgdir/usr/lib/steamfetch/libsteam_api.so"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
