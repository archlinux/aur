pkgname=pcw-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line client for ProxyCoreWrapper"
url='https://github.com/ProxyCoreWrapper/cli'
arch=('x86_64')
license=('MIT OR Apache-2.0')
options=('!debug')

depends=('glibc' 'pcw-backend')
makedepends=('git' 'rust' 'protobuf')

source=("git+https://github.com/ProxyCoreWrapper/cli.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/cli"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/cli"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/cli"

  install -Dm755 target/release/cli "$pkgdir/usr/bin/pcw-cli"
  install -Dm644 autocompletion/pcw-cli.bash \
    "$pkgdir/usr/share/bash-completion/completions/pcw-cli"
  install -Dm644 autocompletion/pcw-cli.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/pcw-cli.fish"
  install -Dm644 autocompletion/_pcw-cli \
    "$pkgdir/usr/share/zsh/site-functions/_pcw-cli"
  install -Dm644 LICENSE-MIT LICENSE-APACHE \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
