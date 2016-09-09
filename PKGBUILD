# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('yubikey-manager-git')
_gitname='yubikey-manager'
pkgver=0.1.0.r50.19abdf1
pkgrel=6
pkgdesc='Command line and GUI tool for configuring YubiKeys, over all transports.'
arch=('any')
url='https://github.com/Yubico/yubikey-manager'
license=('BSD')
depends=('python' 'python-pyusb' 'python-pyscard' 'python-pyside' 'python-click' 'libu2f-host' 'yubikey-personalization')
makedepends=('git' 'python2-pyside-tools' 'imagemagick')
conflicts=('yubikey-manager')
provides=('yubikey-manager')
source=("$_gitname::git+https://github.com/Yubico/yubikey-manager.git"
	"git+https://github.com/Yubico/python-yubicommon.git"
	'ykman-gui.desktop')
sha256sums=('SKIP'
            'SKIP'
            '57e9637916c0f32f06294ddeae09310a881db0c3443ac14bdef18cc9141d34be')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/^yubikey-manager.//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.vendor/yubicommon.url "$srcdir/python-yubicommon"
  git submodule update
}

package() {
  cd "$srcdir/$_gitname"

  python setup.py qt_resources
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m0644 resources/yubikey-manager.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/yubikey-manager.png"
  for SIZE in 16 24 32 48 64 96; do
    convert -scale $SIZE resources/yubikey-manager.png "$srcdir/yubikey-manager.png"
    install -Dm0644 "$srcdir/yubikey-manager.png" "$pkgdir/usr/share/icons/hicolor/$SIZEx$SIZE/apps/yubikey-manager.png"
  done

  install -Dm0644 "$srcdir/ykman-gui.desktop" "$pkgdir/usr/share/applications/ykman-gui.desktop"

  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm0644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"

  install -d "$pkgdir/usr/share/bash-completion/completions/"
  _YKMAN_COMPLETE=source "$pkgdir/usr/bin/ykman" > "$pkgdir/usr/share/bash-completion/completions/ykman" || true
}

