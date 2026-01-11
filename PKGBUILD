pkgname=kangaroo
pkgver=0.4.0
pkgrel=1
pkgdesc="Pollard's Kangaroo ECDLP solver for secp256k1 using Vulkan/Metal/DX12 compute"
arch=('x86_64')
url="https://github.com/oritwoen/kangaroo"
license=('MIT')
depends=('gcc-libs' 'glibc' 'vulkan-icd-loader')
makedepends=('git' 'rust' 'vulkan-headers')
optdepends=('vulkan-validation-layers: for debugging')
source=("git+https://github.com/oritwoen/kangaroo.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release --locked --offline
}

check() {
  cd "$pkgname"
  cargo test --locked --offline
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
