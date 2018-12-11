# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=linux-thermaltake-rgb
pkgdesc="Python usb daemon and controller for thermaltake rgb watercooling devices"
pkgver=0.0.12
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-gobject' 'python-dbus' 'python-psutil' 'python-pyusb')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/chestm007/linux_thermaltake_riing"
source=("git+https://github.com/chestm007/linux_thermaltake_riing/#tag=$pkgver")
md5sums=('SKIP')

#pkgver() {
#  cd linux_thermaltake_riing
#  git describe --tags | cut -d '-' -f 1
#}

build() {
  cd "$srcdir/linux_thermaltake_riing"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  
  python setup.py build
}

package() {
  cd "$srcdir/linux_thermaltake_riing"
  
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir"

  mkdir -p "$pkgdir/etc/udev/rules.d"
  cp "$pkgdir/usr/share/linux_thermaltake_rgb/90-linux_thermaltake_rgb.rules" "$pkgdir/etc/udev/rules.d/"
  
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp "$pkgdir/usr/share/linux_thermaltake_rgb/linux-thermaltake-rgb.service" "$pkgdir/usr/lib/systemd/user/"
  
  mkdir -p "$pkgdir/etc/linux_thermaltake_rgb"
  cp "$pkgdir/usr/share/linux_thermaltake_rgb/config.yml" "$pkgdir/etc/linux_thermaltake_rgb/"
} 
