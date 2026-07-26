# Maintainer: InstaZDLL <github.105mh@8shield.net>
pkgname=waveflow-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Spotify for your local files - bit-perfect Hi-Res music player'
arch=('x86_64')
url='https://github.com/InstaZDLL/WaveFlow'
license=('GPL-3.0-only')
# AUR keywords show up as blue chips on the package page and drive
# search discovery on aur.archlinux.org. The field name is bare
# `keywords` (no leading underscore) — variables prefixed with `_`
# are a PKGBUILD convention for PRIVATE values that makepkg ignores
# during `--printsrcinfo`, so `_keywords=(...)` would silently
# render zero chips. `keywords` is one of the recognised optional
# .SRCINFO fields; each array entry comes out as a `keywords = ...`
# line that the AUR web ingests on push. Mix of category terms
# (music-player, audio-player), comparatives that match what people
# search for (spotify-alternative, apple-music-alternative),
# local-first differentiators (local-music, offline-music) and
# audiophile-cluster (hi-res, dsd, flac, bit-perfect, replaygain).
keywords=(
  'music-player'
  'music'
  'audio-player'
  'spotify-alternative'
  'apple-music-alternative'
  'local-music'
  'offline-music'
  'audiophile'
  'hi-res'
  'lossless'
  'flac'
  'dsd'
  'bit-perfect'
  'replaygain'
  'tauri'
)
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'cairo'
  'glib2'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
)
provides=('waveflow')
conflicts=('waveflow')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::https://github.com/InstaZDLL/WaveFlow/releases/download/v${pkgver}/WaveFlow_${pkgver}_linux-x86_64.deb")
sha256sums=('1651d7358b9985b1d51ce7ae6dc3cd144793a7cdacba50eb8c5e1caae040773b')

prepare() {
  # Crack open the .deb so package() can move its data tarball into $pkgdir.
  bsdtar -xf "$pkgname-$pkgver.deb"
}

package() {
  # Tauri-bundler's .deb output uses gzip in 0.18.x and zstd in newer
  # versions; try all compressions for forward compat.
  for archive in data.tar.zst data.tar.xz data.tar.gz; do
    if [ -f "$srcdir/$archive" ]; then
      bsdtar -xf "$srcdir/$archive" -C "$pkgdir/"
      return 0
    fi
  done
  echo 'No data.tar.* found in the .deb' >&2
  return 1
}
