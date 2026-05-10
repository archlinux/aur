# Maintainer: Brodi Elwood <brodielwood@gmail.com>
#

pkgname=fauxput
pkgver=0.5.0
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
makedepends=('cargo' 'git' 'pkgconf' 'rust')
provides=('fauxput')
options=('!lto')
install='fauxput.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea6e9d736f04bdffde0c47c1da87e95688f6555373cd5ff4c76ab90a303f4875')

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
