# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('yubikey-manager')
pkgver=0.1.0
pkgrel=4
pkgdesc='Command line and GUI tool for configuring YubiKeys, over all transports.'
arch=('any')
url='https://developers.yubico.com/yubikey-manager/'
license=('BSD')
depends=('python' 'python-pyusb' 'python-pyscard' 'python-pyside' 'python-click' 'libu2f-host' 'yubikey-personalization')
makedepends=('python2-pyside-tools' 'imagemagick')
source=("https://developers.yubico.com/$pkgname/Releases/yubikey-manager-$pkgver.tar.gz"
	'ykman-gui.desktop')
sha256sums=('a710b1ba35e88d2651e7ab8a0b93a68dceab4be6be457dd56fb8c84f22674f3d'
            '57e9637916c0f32f06294ddeae09310a881db0c3443ac14bdef18cc9141d34be')

package() {
  cd "$srcdir/$pkgname-$pkgver"

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

