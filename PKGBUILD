# Maintainer: InstaZDLL <github.105mh@8shield.net>
pkgname=waveflow-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Local-first music player desktop app with a Spotify-inspired 3-panel UI'
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
sha256sums=('e9491b76026675ed8b85bb27c426b7c5f29c92fddabbaf63356c4ab491a42118')

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
