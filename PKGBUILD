# Contributor: Wilhelm Schuster <aur [aT] rot13 dot io>
# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=moonraker
pkgname="${_pkgname}-venv-git"
pkgver=0.10.0.r10.gfb257f8
pkgrel=1
pkgdesc="Web API Server for Klipper"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPL3')
depends=('python' 'curl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/moonraker/moonraker.conf')
source=(
  'git+https://github.com/Arksine/moonraker.git'
  'moonraker.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=(
  'SKIP'
  '96f2f9a88c63edb7411a57f2ce8b68d0d72d41ecea7be2e60029c3805d15584a'
  '8112fbcb737d546340e5da10782cec8b6779c9d17ee096056fd0b715b1a09e4d'
  'dc098d326b5c72c01592f1eb02ca2405ae71c328bc7d07a7c177c905aa29be01'
)

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  python -m compileall moonraker
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/share"

  cp -r moonraker "$pkgdir/usr/share"
  install -Dm644 "$srcdir/moonraker/scripts/moonraker-requirements.txt" "$pkgdir/usr/share/$_pkgname"

  install -Dm644 "$srcdir/moonraker/docs/moonraker.conf" "$pkgdir/etc/moonraker/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonraker.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
}
