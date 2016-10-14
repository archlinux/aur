# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak-gtk2
_pkgname=${pkgname//-gtk2/}
pkgver=16.10.5
_umsver=16.10.7
pkgrel=1
pkgdesc="Tweak tool for MATE, a fork of MintDesktop - GTK2 version."
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
provides=('mate-tweak')
conflicts=('mate-tweak')
depends=('gtk2' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout')
source=("$_pkgname-$pkgver.tar.gz::https://bitbucket.org/ubuntu-mate/${_pkgname}/get/$pkgver.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz"
        "fix-mutiny-fresh.patch")
sha256sums=('dac113407663ee2660a3d304e07dc2b762c5ac493a2db7ef34609d4d153308fe'
            'bf0046befe9b8704e5b9972fc86da3847b0b458b72a186f8ebf5d7b30ee591ac'
            'ac2ade84a532486c50245a176d370f0815330f13df07fd62e133afe0383db5fc')

prepare() {
  cd ubuntu-mate-${_pkgname}-*
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
  cd ../ubuntu-mate-settings
  patch -Np1 -i ../fix-mutiny-fresh.patch
}

package() {
  cd ubuntu-mate-${_pkgname}-*
  python3 setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings/usr/share/mate-panel "$pkgdir/usr/share"
}
