# Maintainer: Kuro <kuro@kuro.run>

pkgname=echoroutine
_pkgrepo=EchoRoutine
pkgver=1.0.0
pkgrel=6
pkgdesc="AI-powered daily routine voice assistant — schedule blocks announced via ElevenLabs TTS"
arch=('x86_64')
url="https://github.com/kurojs/EchoRoutine"
license=('MIT')
depends=(
  'opencode'
  'libnotify'
  'jq'
  'systemd'
)
makedepends=('go')
source=("$_pkgrepo::git+https://github.com/kurojs/EchoRoutine.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgrepo"
  (git describe --long --tags 2>/dev/null || echo "1.0.0") | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "$srcdir/$_pkgrepo"
  go build -ldflags="-s -w" -o bin/echoroutine ./cmd/echoroutine/
}

package() {
  cd "$srcdir/$_pkgrepo"

  # Binary — trigger script
  install -Dm755 bin/block-announcer "$pkgdir/usr/bin/block-announcer"

  # Binary — TUI
  install -Dm755 bin/echoroutine "$pkgdir/usr/bin/echoroutine"

  # Config template (copied to ~/.config/echoroutine/ on first run)
  install -Dm644 config/schedule.txt "$pkgdir/usr/share/echoroutine/schedule.txt.default"

  # systemd units
  install -Dm644 config/block-announcer.service "$pkgdir/usr/lib/systemd/user/block-announcer.service"
  install -Dm644 config/block-announcer.timer "$pkgdir/usr/lib/systemd/user/block-announcer.timer"
}
