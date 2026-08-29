# Maintainer: Gabriel <horizzon3507>
pkgname=optionmusic
# pkgver must not contain hyphens (makepkg rule); the full tag (with channel,
# e.g. 0.2.14-beta) lives in _tag and feeds the source URL / extracted dir.
pkgver=0.2.14
_tag=0.2.14-beta
pkgrel=1
pkgdesc='Minimal black and white CLI music player powered by MPV'
arch=('x86_64')
url='https://github.com/fireflylabss/optionMusic'
license=('Apache-2.0')
depends=('mpv' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('cava: optional spectrum bars')
options=('!lto')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('f232336759d3657c855a8aff6e3cb7d14d9e8f7b85551476009fbb5bd6fb8fa5')

prepare() {
  cd "optionMusic-$_tag"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "optionMusic-$_tag"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "optionMusic-$_tag"
  install -Dm755 target/release/optionmusic "$pkgdir/usr/bin/optionmusic"
  install -Dm755 target/release/msc         "$pkgdir/usr/bin/msc"
  install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md               "$pkgdir/usr/share/doc/$pkgname/README.md"
}
