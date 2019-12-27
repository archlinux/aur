pkgname=firecracker-git
_gitname=firecracker
pkgver=v0.20.0.r4.g144b6c08
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
  cd ${_gitname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_gitname}
  tools/devtool build --release
}

package() {
  cd ${_gitname}
  toolchain="$(uname -m)-unknown-linux-musl"
  install -Dm755 build/cargo_target/${toolchain}/release/firecracker "$pkgdir/usr/bin/firecracker"
  install -Dm755 build/cargo_target/${toolchain}/release/jailer "$pkgdir/usr/bin/jailer"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
