# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mkchromecast
pkgver=0.3.8.1
pkgrel=3
pkgdesc='Cast Audio/Video to your Google Cast and Sonos Devices'
arch=('any')
url=http://mkchromecast.com
license=('MIT')
depends=(
  'faac'
  'flac'
  'lame'
  'python-flask'
  'python-gobject'
  'python-psutil'
  'sox'
  'vorbis-tools'
)
optdepends=(
  'alsa-utils: to cast with ALSA'
  'ffmpeg: for ffmpeg backend (which is also needed to cast with ALSA)'
  'gstreamer: for gstreamer backend'
  'pavucontrol: for parec backend or just to cast with PulseAudio'
  'pulseaudio: for parec backend or just to cast with PulseAudio'
  'python-pychromecast: to cast to Chromecast devices'
  'python-pyqt5: for system tray menu support'
  'python-soco: to cast to Sonos devices'
  'yt-dlp: for --youtube'
)
source=(
  "https://github.com/muammar/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "https://github.com/muammar/mkchromecast/commit/0070f9f2b505f1c5a1b6d63324ff337f2de09860.patch"
  pipewire.patch
)
sha256sums=(
  'c680a398385d95d51c47eb522b95cf98f932b55caf065ab8b5725e78bf0099b2'
  'SKIP'
  'ba2d8c5080469a77df145b5430ce7abd0041040ba095a26d7fc04ae117905d0c'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for p in ../*.patch ; do
    echo "$p"
    patch -Np1 -F50 --verbose -i "$p"
  done

  sed -i 's/\byoutube-dl\b/yt-dlp/' mkchromecast/audio.py
  sed -i 's/\byoutube-dl\b/yt-dlp/' mkchromecast/video.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  install -Dt "$pkgdir/usr/share/$pkgname" "$pkgname.py"
  cp -a --parents images/google* "$pkgname" "$pkgdir/usr/share/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/applications" "$pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/pixmaps" "images/$pkgname.xpm"
  install -Dm644 -t "$pkgdir/usr/share/man/man1" "man/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
