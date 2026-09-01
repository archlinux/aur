# Contributor: Wilhelm Schuster <aur [aT] rot13 dot io>
# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=moonraker
pkgname="$_pkgname-venv"
pkgver=0.11.0
pkgrel=1
pkgdesc="Web API Server for Klipper"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPL3')
depends=('python' 'curl')
provides=("$_pkgname" 'moonraker-venv-git')
conflicts=("$_pkgname" 'moonraker-venv-git')
backup=('etc/moonraker/moonraker.conf')
source=(
  "https://github.com/Arksine/moonraker/archive/refs/tags/v$pkgver.tar.gz"
  'moonraker.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=(
  'bba9042e9fc904b30cd46690320fec2bffe27c4458b539db65560582c6318ab3'
  '96f2f9a88c63edb7411a57f2ce8b68d0d72d41ecea7be2e60029c3805d15584a'
  '8112fbcb737d546340e5da10782cec8b6779c9d17ee096056fd0b715b1a09e4d'
  'dc098d326b5c72c01592f1eb02ca2405ae71c328bc7d07a7c177c905aa29be01'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m compileall moonraker
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share"
  cp -r moonraker "$pkgdir/usr/share"

  install -Dm644 scripts/moonraker-requirements.txt "$pkgdir/usr/share/$_pkgname"
  install -Dm644 docs/moonraker.conf "$pkgdir/etc/moonraker/moonraker.conf"

  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonraker.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
}
