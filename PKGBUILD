# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=monkeyjump
pkgver=1.0.0
pkgrel=2
pkgdesc='Minimalistic GUI for playing Go with GnuGo'
arch=(any)
url='https://github.com/xyproto/monkeyjump'
license=(GPL-2.0-or-later)
depends=(python-pygame gnugo)
makedepends=(gendesk git python-pip python-poetry setconf)
backup=(etc/monkeyjump/gnugocmd.conf
        etc/monkeyjump/theme.conf
        etc/monkeyjump/keybindings.conf)
source=("git+$url#commit=9235ffdfe8a32ad5a3200e0c35c153d80834a30f") # tag: v1.0.0
b2sums=('d7d32b864df6da48a02fb5982cad8c0d55623655dfcfe4ed0a56cfe50c41682ddc5916101bfdcbe81a2cd03dc22ceee2f90368954932499c06da0fb77081de97')

prepare() {
  cd $pkgname
  gendesk -f -n \
    --pkgname="$pkgname" \
    --pkgdesc="$pkgdesc" \
    --exec="/usr/bin/monkeyjump 19" \
    --categories="Game;BoardGame" \
    --terminal=true
  setconf monkeyjump CONFDIR=\"/etc/monkeyjump\"
  setconf monkeyjump THEMEDIR=\"/usr/share/monkeyjump/themes\"
}

package() {
  cd $pkgname

  # Build the package using Poetry and create a wheel
  poetry build -f wheel

  # Install the wheel into the pkgdir
  pip install --ignore-installed --force-reinstall --no-deps --no-warn-script-location --root="$pkgdir" dist/*.whl

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
