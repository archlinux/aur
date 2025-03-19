# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
# Previous Maintainer: Riolku <me [at] kgugeler [dot] ca>
pkgname=kambi
pkgver=0.2.0
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
sha512sums=('b023bea925834cf61426f1b151166e7c4afdcf6c078a85b1d7594a8d530613a84268f13d56e7485d26a7a80cc73c56845e56e53a94ee5aa401fee94344a84785'
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
