# Maintainer: Frederic Bezies < fredbezies at gmail dot com > 
# Contributor: Tom < reztho at archlinux dot us >
pkgname=mate-tweak-git 
pkgver=18.04.16.r0.g8dd9931
pkgrel=1
pkgdesc="MATE desktop tweak tool"
arch=('any')
url="https://github.com/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('python' 'gtk3' 'dconf' 'gdk-pixbuf2' 'libnotify' 'python-gobject' 'python-psutil' 'python-configobj' 'mesa-demos' 'python-setproctitle')
optdepends=('plank' 'docky' 'synapse' 'topmenu-gtk' 'mate-menu' 'mate-netbook' 'mate-applet-dock-git' 'mutter' 'compiz')
makedepends=('git' 'bzr' 'python-setuptools' 'python-distutils-extra') 
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
