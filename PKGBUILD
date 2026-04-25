pkgname=cmdcreate-git
pkgver=r1382.3380b6c
pkgrel=1
pkgdesc="Allows you to create custom commands for your custom scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL3')

depends=('gcc-libs' 'less')
makedepends=('cargo' 'git' 'cmake' 'clang')

conflicts=('cmdcreate')
provides=('cmdcreate')
options=('!lto') 

source=("cmdcreate::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd cmdcreate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cmdcreate
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd cmdcreate
  export LIBCLANG_PATH=/usr/lib
  cargo build --release --frozen
}

package() {
  cd cmdcreate
  install -Dm755 target/release/cmdcreate "$pkgdir/usr/bin/cmdcreate"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
