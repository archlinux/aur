# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=soundux-pipewire
pkgver=0.2.8
pkgrel=1
pkgdesc="A crossplatform soundboard that plays sounds into your microphone, with native PipeWire support"
arch=('x86_64')
url="https://github.com/hedgeg0d/Soundux-pipe"
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator' 'libsoup3' 'openssl' 'libx11' 'libxi' 'libxtst' 'glib2' 'cairo' 'gdk-pixbuf2' 'pango' 'harfbuzz' 'libice' 'libsm')
makedepends=('cmake' 'git')
optdepends=(
  'pipewire: native PipeWire playback and moving applications into the soundboard'
  'libpulse: fallback for systems without PipeWire'
  'libwnck3: application icons in the output picker'
  'yt-dlp: downloading sounds from links'
  'ffmpeg: converting downloaded sounds'
)
provides=('soundux')
conflicts=('soundux' 'soundux-git')
source=("$pkgname::git+$url.git#tag=v$pkgver-pipewire")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSTEM_INSTALL=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
