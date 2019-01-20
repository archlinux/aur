# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mkchromecast
pkgver=0.3.8.1
pkgrel=2
pkgdesc='Cast Audio/Video to your Google Cast and Sonos Devices'
arch=('any')
url=http://mkchromecast.com
license=('MIT')
depends=('faac' 'flac' 'lame' 'python-flask' 'python-gobject' 'python-psutil'
         'sox' 'vorbis-tools')
optdepends=('alsa-utils: to cast with ALSA'
            'ffmpeg: for ffmpeg backend (which is also needed to cast with ALSA)'
            'gstreamer: for gstreamer backend'
            'pavucontrol: for parec backend or just to cast with PulseAudio'
            'pulseaudio: for parec backend or just to cast with PulseAudio'
            'python-pychromecast: to cast to Chromecast devices'
            'python-pyqt5: for system tray menu support'
            'python-soco: to cast to Sonos devices'
            'youtube-dl: for --youtube')
source=("https://github.com/muammar/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'pychromecast_optional.patch::https://github.com/muammar/mkchromecast/commit/0070f9f2b505f1c5a1b6d63324ff337f2de09860.patch')
sha512sums=('ee66450768f3221500f198bf618120f02b93108797209ca0d6c2be9f882eee36753d3e1038354e51b5d76d130c12d193c7d152b33f80776cb225347a3743f376'
            '2fa2fa3986075582ed7f1d881ec32660b97278e47afffadecbd7cfc1c58833a734f5a7d442d4699fc99582c00b18e3c43cf87f974c8a8ec3af4b8ebfea40435f')

prepare() {
  cd $pkgname-$pkgver
  sed -i '1s/env //' mkchromecast.py
  patch -Np1 --no-backup-if-mismatch -i ../pychromecast_optional.patch
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/$pkgname/$pkgname.py "$pkgdir"/usr/bin/$pkgname

  install -Dt "$pkgdir"/usr/share/$pkgname $pkgname.py
  cp -a --parents images/google* $pkgname "$pkgdir"/usr/share/$pkgname

  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/applications $pkgname.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps images/$pkgname.xpm
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 man/$pkgname.1
}

# vim:set ts=2 sw=2 et:
