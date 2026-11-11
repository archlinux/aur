# Maintainer: Ritwick Verma <verma1997 at gmail dot com>

pkgname=chordist
pkgver=2.0.1
pkgrel=1
pkgdesc='Guitar companion for KDE Plasma: live chords, tabs, lyrics and fingerings for whatever is playing'
arch=('any')
url='https://gitlab.com/ritwick7/chordist'
license=('MIT')
depends=('bash' 'python' 'plasma-workspace' 'libplasma' 'kirigami' 'kcmutils' 'qt6-declarative' 'hicolor-icon-theme')
optdepends=(
  'songrec: identify a track from its audio when its metadata is unusable'
  'pipewire-audio: record the output for songrec (pw-record)'
  'libpulse: find the default output for songrec (pactl)'
)
install=chordist.install
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/v$pkgver/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('acc309f5497ba0f65c75da5b572399a175496b7fdcec06f3a2034af2665c87a9')

package() {
  cd "$srcdir/$pkgname-$pkgver" || exit 1

  # The service. The launcher finds the package at <prefix>/lib/chordist.
  install -d "$pkgdir/usr/lib/chordist"
  cp -r chordist "$pkgdir/usr/lib/chordist/chordist"
  find "$pkgdir/usr/lib/chordist" -name __pycache__ -prune -exec rm -rf {} +
  install -Dm755 bin/chordistd "$pkgdir/usr/bin/chordistd"
  ln -s chordistd "$pkgdir/usr/bin/chordist"

  # A user unit pointing at the installed launcher instead of ~/.local/bin.
  install -Dm644 packaging/chordistd.service "$pkgdir/usr/lib/systemd/user/chordistd.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/chordistd serve|' "$pkgdir/usr/lib/systemd/user/chordistd.service"

  # The widget and its icon.
  install -d "$pkgdir/usr/share/plasma/plasmoids/com.ritwick.chordist"
  cp -r applet/. "$pkgdir/usr/share/plasma/plasmoids/com.ritwick.chordist/"
  install -Dm644 packaging/chordist.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/chordist.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
