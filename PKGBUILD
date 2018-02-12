# Maintainer: Jonathon Fernyhough <jonathon manjaro_dot_org>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=mate-tweak
pkgver=18.04.9
_umsver=18.04.6
pkgrel=1
pkgdesc="Tweak tool for MATE (fork of MintDesktop)"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-gobject' 'python-psutil' 'python-setproctitle')
makedepends=('python-distutils-extra' 'python-setuptools')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubuntu-mate/$pkgname/archive/$pkgver.tar.gz"
        "ubuntu-mate-settings-$_umsver.tar.gz::https://github.com/ubuntu-mate/ubuntu-mate-settings/archive/$_umsver.tar.gz"
        '41.patch')
sha256sums=('52d67bb8b52b08a1027677ee671da507977d2db299d40c77eb164c8419e529ae'
            'a4e65836a5c5820607e9b948aa02e77deb493f72c29145f46ddb19dc50e019ba'
            'c1657e08eb517a040a6209eebb0e67b477f3e65010cbc800f62f3712e048b617')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/usr/lib/mate-applets/topmenu-mate-panel-applet|/usr/lib/topmenu-gtk/topmenu-mate-panel-applet|' mate-tweak

  # Patch to fix starting on MATE 1.20, https://github.com/ubuntu-mate/mate-tweak/pull/41
  patch -Np1 < ../41.patch
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  cp -r "$srcdir"/ubuntu-mate-settings-$_umsver/usr/share/mate-panel "$pkgdir/usr/share"
}
