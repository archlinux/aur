# Maintainer: Brodi Elwood <brodielwood@gmail.com>
#

pkgname=fauxput
pkgver=0.7.0
pkgrel=1
pkgdesc='Manage virtual displays on Linux'
arch=('x86_64')
url='https://github.com/bdelwood/fauxput'
license=('MIT')
depends=(
  'bash'
  'libcap'
  'libxcvt'
  'util-linux'
  'wayland'
)
optdepends=(
  'sunshine: game-streaming server integration (see /usr/share/fauxput/)'
)
makedepends=('cargo' 'git' 'pkgconf' 'rust' 'clang' 'llvm')
provides=('fauxput')
conflicts=('fauxput-bin')
options=('!lto')
install='fauxput.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07718a682444af49d529bab3cd3890bfe33e1d4e0ec8d1e0ee1f2050900e3215')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --bin fauxput
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen --release --workspace
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/fauxput "${pkgdir}/usr/bin/fauxput"

  install -Dm755 -t "${pkgdir}/usr/share/fauxput/" \
    contrib/sunshine-fauxput-up.sh \
    contrib/sunshine-fauxput-down.sh
  install -Dm644 contrib/sunshine-apps.json.example \
    "${pkgdir}/usr/share/fauxput/sunshine-apps.json.example"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
