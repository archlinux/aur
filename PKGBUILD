# Maintainer:

pkgname=virtiofsd
pkgver=1.1.0
pkgrel=1
pkgdesc="A virtio-fs vhost-user device daemon written in Rust"
arch=('x86_64')
url="https://gitlab.com/virtio-fs/virtiofsd"
license=('Apache' 'BSD')
depends=('gcc-libs' 'libcap-ng' 'libseccomp')
makedepends=('git' 'rust')
options=('!lto')
_commit='220405d7a2606c92636d31992b5cb3036a41047b' # v1.1.0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
