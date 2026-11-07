# Maintainer: Gabriel <horizzon3507>
pkgname=stillmusic
pkgver=0.3.0beta2
_tag=0.3.0-beta.2
pkgrel=1
pkgdesc='Minimal black and white CLI music player powered by MPV'
arch=('x86_64')
url='https://github.com/horizzon3507/stillmusic'
license=('Apache-2.0')
depends=('mpv' 'libgcc' 'glibc' 'sqlite')
makedepends=('cargo' 'pkgconf')
optdepends=('cava: spectrum bars'
            'yt-dlp: download music and videos'
            'ffmpeg: extract and convert downloaded audio'
            'tar: export and import backups')
conflicts=('stillmusic-bin' 'optionmusic' 'optmusic')
options=('!lto')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('920ac16fe99d8556f7583cbe1529caccbb13aace4db9e8cc47487498679a3bbe')

prepare() {
  cd "stillmusic-$_tag"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "stillmusic-$_tag"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --bins
}

package() {
  cd "stillmusic-$_tag"
  install -Dm755 "$srcdir/target/release/still" "$pkgdir/usr/bin/still"
  install -Dm755 "$srcdir/target/release/msc" "$pkgdir/usr/bin/msc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
