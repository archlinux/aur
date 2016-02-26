# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=3.5.6
_umsver=16.04.2
pkgrel=2
pkgdesc="Tweak tool for MATE, a fork of mintDesktop"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
optdepends=('gnome-main-menu: for openSUSE panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'plank: for Cupertino panel layout'
            'topmenu-gtk: for Mutiny panel layout')
source=("$pkgname-$pkgver::git+https://bitbucket.org/ubuntu-mate/$pkgname.git#tag=$pkgver"
        "https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-mate-settings_$_umsver.tar.xz"
        "0001-Fix-checking-available-features.patch"
        "fix-mutiny-fresh.patch")
md5sums=('SKIP'
         '9003c6af0c1851c6e7a5926fe061d258'
         '1717e0df056603a840b1f1daa52cdb13'
         'e389460b0f34dc6da6622830efa05273')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-Fix-checking-available-features.patch
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak
  cd ../ubuntu-mate-settings-16.04.1
  patch -Np1 -i ../fix-mutiny-fresh.patch
}

package() {
  cd $pkgname-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir/ubuntu-mate-settings-16.04.1/usr/share/mate-panel" "$pkgdir/usr/share"
}
