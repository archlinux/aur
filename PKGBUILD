pkgname=dude
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc='A single-binary helper that discovers, previews and removes pacman orphans'
arch=('x86_64')
url='https://github.com/seeyebe/dude'
license=('MIT' 'Apache')
depends=(gcc-libs pacman glibc)
makedepends=('cargo')
optdepends=('libnotify: desktop notifications')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5dace30ae13ebe017db0d2e630cc9e02eef2549c74e6b0602e17c939ebe9f15')

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
