# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=voyager-disco
pkgver=0.4.0
pkgrel=2
pkgdesc="Control RGB LEDs on ZSA keyboards (Voyager, Moonlander, ErgoDox EZ) without Keymapp"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/voyager-disco"
license=('MIT')
depends=('systemd-libs')
makedepends=('cargo')
# makepkg's -flto=auto in CFLAGS produces GCC-LTO objects for the bundled
# hidapi C library, which Rust's lld linker can't read.
options=('!lto' '!debug')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '50-zsa.rules')
sha256sums=('132e03f6d65cb081edc4d2aa44316a8db17831879432a3afa96e19fe102545e3'
            'e9f20d846ef6f72937022fa7e2925fbb31a82592ca17f99345a5a6160aa9b64c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/50-zsa.rules" "$pkgdir/usr/lib/udev/rules.d/50-zsa.rules"
  "target/release/$pkgname" completions bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  "target/release/$pkgname" completions zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  "target/release/$pkgname" completions fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
