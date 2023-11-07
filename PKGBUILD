# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cacophony
pkgver=0.1.2
pkgrel=1
pkgdesc='A minimalist and ergonomic MIDI sequencer'
arch=('x86_64')
url='https://subalterngames.com/cacophony'
license=('MIT')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'libspeechd')
makedepends=('git' 'rust' 'clang')
options=('!lto')
_commit='cdbb7bfad550618d973b109f408e4e38709e3496'
source=("$pkgname::git+https://github.com/subalterngames/cacophony")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  cargo build --frozen --release
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
