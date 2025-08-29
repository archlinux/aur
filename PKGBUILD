# Maintainer: Lars Sjostrom <lars at radicore dot se>
pkgname=iptvnator-git
pkgver=r1336.4330301
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more."
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'webkit2gtk-4.1'
  'openssl'
  'pango'
  'sqlite'
)
optdepends=(
  'ffmpeg: audio and video libraries'
  'mpv: media player'
  'vlc: media player'
)
provides=('iptvnator')
conflicts=('iptvnator')
options=(!strip)
source=($pkgname::git+$url)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  pushd "$srcdir/$pkgname"
  npm install
}

build() {
  pushd "$srcdir/$pkgname"

  # generate dummy signing key
  pnpm tauri signer generate -p dummy -w signing.key
  export TAURI_SIGNING_PRIVATE_KEY=$(cat signing.key)
  export TAURI_SIGNING_PRIVATE_KEY_PASSWORD="dummy"
  rm -f signing.key

  # build
  CFLAGS="$CFLAGS -ffat-lto-objects" pnpm tauri build -b deb
}

package() {
  pushd "$srcdir/$pkgname"
  cp -a src-tauri/target/release/bundle/deb/iptvnator_*/data/* "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
