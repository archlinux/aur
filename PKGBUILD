# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

pkgname=desktopnova
pkgver=0.8.1
pkgrel=6
pkgdesc="Changes your desktop wallpaper automatically after a preset period of time"
arch=('x86_64')
url="https://launchpad.net/desktopnova"
license=('GPL')
#'gconf'
depends=('gtk2' 'libdbusmenu-gtk2' 'libxml2' 'xfconf')
makedepends=('cmake' 'intltool' 'python2')
source=("https://launchpad.net/desktopnova/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('b408c01a9cdae3308d9b9e67a8076408514d8b70c722144c94bd53bcef4b9375')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/\bpython\b/python2/g' generate-translators.py ascii-to-header.py src/misc/CMakeLists.txt
}

build() {
  # Avoid error "dbus-server-bindings.h: No such file or directory" by disabling tray which requires dbus
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev \
                                     -DENABLE_TRAY= -DENABLE_DBUS= -DENABLE_MODULE_GNOME= -DENABLE_MODULE_XFCE=
  make -C build desktopnova-module-xfce-xfconf
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

