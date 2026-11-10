# Maintainer: InstaZDLL <github.105mh@8shield.net>
pkgname=waveflow-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Local-first music player with Hi-Res audio, AutoMix, word-synced lyrics, smart playlists, themes and plugins. No account or subscription'
arch=('x86_64')
url='https://github.com/InstaZDLL/WaveFlow'
license=('GPL-3.0-only')
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
sha256sums=('78cd066d8f6d9cd1db28fc955533b9d2c24efecb47dad541a0fd59a7ea511a14')

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
