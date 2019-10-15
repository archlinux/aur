pkgname=firecracker-git
_gitname=firecracker
pkgver=r1496.effaab05
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
depends=()
makedepends=('docker')
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
  tools/devtool build --release
}

package() {
  cd "${srcdir}/${_gitname}"
  toolchain="$(uname -m)-unknown-linux-musl"
  install -Dm755 build/cargo_target/${toolchain}/release/firecracker "$pkgdir/usr/bin/firecracker"
  install -Dm755 build/cargo_target/${toolchain}/release/jailer "$pkgdir/usr/bin/jailer"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
