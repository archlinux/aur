# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=monkeyjump
pkgver=0.5
pkgrel=5
pkgdesc='Minimalistic GUI for playing Go with GnuGo and other GTP applications'
arch=(any)
url='https://github.com/xyproto/monkeyjump'
license=(GPL2)
depends=(python2-pygame gnugo)
makedepends=(gendesk setconf)
backup=(etc/monkeyjump/gnugocmd.conf etc/monkeyjump/theme.conf etc/monkeyjump/keybindings.conf)
source=("git+$url#commit=a6fcea4e0f03c09a47b0117567893d0fe882b2a8")
md5sums=('SKIP')

prepare() {
  cd $pkgname

  gendesk -f -n \
    --pkgname="$pkgname" \
    --pkgdesc="$pkgdesc" \
    --exec="/usr/bin/monkeyjump 19" \
    --categories="Game;BoardGame;" \
    --terminal=true
  setconf monkeyjump CONFDIR=\"/etc/monkeyjump\"
  setconf monkeyjump THEMEDIR=\"/usr/share/monkeyjump/themes\"
}

package() {
  cd "$pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1

  # Executable
  install -Dm755 monkeyjump "$pkgdir/usr/bin/monkeyjump"

  # Themes
  install -d "$pkgdir/usr/share/monkeyjump/themes"
  cp -r themes/* "$pkgdir/usr/share/monkeyjump/themes/"

  # Configuration
  install -d "$pkgdir/etc/monkeyjump"
  install -Dm644 conf/* "$pkgdir/etc/monkeyjump/"

  # Desktop shortcut and icon
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "dotimages/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
