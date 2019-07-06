# Maintainer: Frederic Bezies < fredbezies at gmail dot com > 
# Contributor: Tom < reztho at archlinux dot us >
pkgname=mate-tweak-git 
pkgver=19.10.1.r3.gf45f868
pkgrel=1
pkgdesc="MATE desktop tweak tool"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('gtk3' 'libnotify' 'mate-applets' 'python-configobj' 'python-distro' 'python-gobject' 'python-psutil' 'python-setproctitle')
optdepends=('brisk-menu: for Manjaro panel layout'
            'mate-applet-dock: for Mutiny panel layout'
            'mate-menu: to enable advanced menu'
            'mate-netbook: for Netbook panel layout'
            'plank: for Cupertino panel layout'
            'synapse: to enable launcher'
            'tilda: to enable pull-down terminal'
            'topmenu-gtk: for Mutiny panel layout'
            'vala-panel-appmenu-mate: for Mutiny,Cupertino')
makedepends=('bzr' 'git' 'python-distutils-extra' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mate-tweak::git+https://github.com/ubuntu-mate/mate-tweak.git'
	'ubuntu-mate-settings::bzr+lp:~ubuntu-mate-dev/ubuntu-mate/ubuntu-mate-settings')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's@/usr/lib/mate-applets/topmenu-mate-panel-applet@/usr/lib/topmenu-gtk/topmenu-mate-panel-applet@' ./mate-tweak
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  # Extra layouts from the ubuntu-mate-default-settings package
  install -d "$pkgdir/usr/share/mate-panel/layouts/"
  install -m644 "$srcdir/ubuntu-mate-settings/usr/share/mate-panel/layouts/"* "$pkgdir/usr/share/mate-panel/layouts/"
}
