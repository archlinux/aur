pkgname=firecracker-git
_gitname=firecracker
pkgver=r1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
depends=()
makedepends=('rustup' 'musl')
arch=('x86_64')
license=('Apache:2.0')
source=("git+https://github.com/firecracker-microvm/firecracker.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  rustup target install x86_64-unknown-linux-musl
  cargo build --release
  #tools/devtool build
}

package() {
  cd "${srcdir}/${_gitname}"
  install -Dm755 target/x86_64-unknown-linux-musl/release/firecracker "$pkgdir/usr/bin/firecracker"
  install -Dm755 target/x86_64-unknown-linux-musl/release/jailer "$pkgdir/usr/bin/jailer"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
