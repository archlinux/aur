# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=linux-thermaltake-rgb
pkgdesc="Python usb daemon and controller for thermaltake rgb watercooling devices"
pkgver=0.1.1
pkgrel=1
arch=('any')
license=('GPL2')
depends=('python' 'python-yaml' 'python-gobject' 'python-psutil' 'python-pyusb')
makedepends=('python-setuptools' 'python-nose' 'tar')
url="https://github.com/chestm007/linux_thermaltake_riing"
source=("https://github.com/chestm007/linux_thermaltake_riing/archive/${pkgver}.tar.gz")
md5sums=('SKIP')
backup=('etc/linux_thermaltake_rgb/config.yml')

build() {
  cd "$srcdir/linux_thermaltake_riing-${pkgver}"
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  
  python setup.py build
}

package() {
  cd "$srcdir/linux_thermaltake_riing-${pkgver}"
  
  sed -i "s/PROJECTVERSION/$pkgver/g" setup.py
  python setup.py install --prefix=/usr --root="$pkgdir"

  mkdir -p "$pkgdir/etc/udev/rules.d"
  install -Dm644 "$pkgdir/usr/share/linux_thermaltake_rgb/90-linux_thermaltake_rgb.rules" "$pkgdir/etc/udev/rules.d/"
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  install -Dm644 "$pkgdir/usr/share/linux_thermaltake_rgb/linux-thermaltake-rgb.service" "$pkgdir/usr/lib/systemd/user/"
  mkdir -p "$pkgdir/etc/linux_thermaltake_rgb"
  install -Dm644 "$pkgdir/usr/share/linux_thermaltake_rgb/config.yml" "$pkgdir/etc/linux_thermaltake_rgb/"
} 
