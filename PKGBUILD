pkgname=dude
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc='Safe orphan package cleanup for Arch Linux with preview mode and a terminal UI'
arch=('x86_64')
url='https://github.com/marawny/dude'
license=('MIT' 'Apache')
depends=(gcc-libs pacman glibc)
makedepends=('cargo')
optdepends=('libnotify: desktop notifications')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e06fe167d73ae4a5aea8ce2c11efe9635ebe05bb3c91ee566bf83fe8c0856f2')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/dude "$pkgdir/usr/bin/dude"
  install -Dm644 hooks/dude.hook "$pkgdir/usr/share/libalpm/hooks/dude.hook"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
