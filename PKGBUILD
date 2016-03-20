# Maintainer: Tom < reztho at archlinux dot us >
pkgname=mate-tweak-git 
pkgver=3.5.8.r0.8a5299d
pkgrel=1
pkgdesc="MATE desktop tweak tool"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('python' 'gtk3' 'dconf' 'gdk-pixbuf2' 'libnotify' 'python-gobject' 'python-psutil' 'python-configobj' 'mesa-demos')
optdepends=('plank' 'docky' 'synapse' 'topmenu-gtk' 'gnome-main-menu' 'mate-menu' 'mate-netbook' 'mate-applet-dock-git' 'mutter' 'compiz')
makedepends=('git' 'bzr' 'python-setuptools' 'python-distutils-extra') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mate-tweak::git+https://bitbucket.org/ubuntu-mate/mate-tweak.git'
               'ubuntu-mate-settings::bzr+lp:~ubuntu-mate-dev/ubuntu-mate/ubuntu-mate-settings')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
