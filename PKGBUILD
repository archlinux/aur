# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('yubikey-manager-git')
_gitname='yubikey-manager'
pkgver=0.1.0.r50.19abdf1
pkgrel=1
pkgdesc='Command line and GUI tool for configuring YubiKeys, over all transports.'
arch=('any')
url='https://developers.yubico.com/yubikey-manager/'
license=('custom')
depends=('python' 'python-pyusb' 'python-pyscard' 'python-pyside' 'python-click')
conflicts=('yubikey-manager')
provides=('yubikey-manager')
source=("$_gitname::git+https://github.com/Yubico/yubikey-manager.git"
	"git+https://github.com/Yubico/python-yubicommon.git")
sha256sums=('SKIP'
	    'SKIP')

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
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

