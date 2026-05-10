pkgname=cmdcreate-git
pkgver=r143.1045ced
pkgrel=1
pkgdesc="Allows you to create custom commands for your custom scripts"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/owen-debiasio/cmdcreate"
license=('GPL-3.0-or-later')

depends=('gcc-libs' 'curl' 'git' 'less' 'openssl')
makedepends=('cargo' 'git')

conflicts=('cmdcreate')
provides=('cmdcreate')

source=("cmdcreate::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd cmdcreate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cmdcreate
  rm -rf .cargo/config.toml
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd cmdcreate
  CFLAGS+=" -ffat-lto-objects"
  cargo build --release --frozen
}

package() {
  cd cmdcreate
  install -Dm755 target/release/cmdcreate "$pkgdir/usr/bin/cmdcreate"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
