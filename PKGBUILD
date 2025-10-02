# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Riolku <me [at] kgugeler [dot] ca>
pkgname=kambi
pkgver=0.3.0
pkgrel=1
pkgdesc='Simple rotating wallpaper client for Wayland'
arch=('x86_64')
url="https://git.sr.ht/~riolku/$pkgname"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'scdoc')
provides=("$pkgname")
conflicts=('kambi-git')
source=("$url/archive/v$pkgver.tar.gz"
		"$url/blob/v0.1.1/man/kambi.5.scd")
sha512sums=('b6dab9fc3585c983286252eec124b79f509f694bd6e46fd46c792e94c90f0bdb663f9c0d2b00c51270ecaf236f6964eaa1c3e0b109b97e5cec674544bf0db539'
            'ae8c198d9b99d358cc7bce961254c748791cfdbb8ce014d7464cfc8b97ff2106da4cf8c60189f2f0b5b3719ee3d6f2f41bab3f70bab1a2c8af9138a6efcccf99')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

# https://wiki.archlinux.org/title/Rust_package_guidelines
build() {
  scdoc < kambi.5.scd > kambi.5

  cd "$srcdir/$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --locked
}

package() {
  install -Dm0755 -t "$pkgdir/usr/share/man/man5" "$pkgname.5"
  cd "$srcdir/$pkgname-v$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
