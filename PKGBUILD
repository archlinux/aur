# Maintainer: Daniel Garcia <dgarcia@kabr.org>
pkgname=steamfetch
pkgver=0.5.2
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
sha256sums=('9f1b6a201ad3aa2aaa51270f068a109f05ad1d1d2e37c1cae3df88e5f4edf421')
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
  install -Dm755 target/release/build/steamworks-sys-*/out/libsteam_api.so "$pkgdir/usr/lib/libsteam_api.so"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
