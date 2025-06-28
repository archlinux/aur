# Maintainer: Pranav Sharma <pranav.sharma.ama@gmail.com>
# Contributor: j.r <j.r@jugendhacker.de>
# Contributor: Matthew Murray <matt@mattmurr.xyz>
pkgname=python-validity
pkgver=0.15
pkgrel=1
pkgdesc="Validity fingerprint sensor driver"
arch=(any)
license=(MIT)
depends=(python python-yaml python-pyusb python-cryptography python-dbus python-gobject 
  innoextract "open-fprintd>=0.6" fprintd-clients glib2)
makedepends=(python-setuptools glib2-devel)
conflicts=($pkgname)
provides=($pkgname)
url="https://github.com/uunicorn/${pkgname}"
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz"
  python3-validity-suspend-hotfix.service 
)
md5sums=('7134839860dea1caafa5ae5024536385'
         'cf8c944df027bbb349c56710c9755cbe')
install=$pkgname.install

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1

  sed -i 's/^Restart=.*/Restart=on-failure/' debian/python3-validity.service
  install -D -m 644 debian/python3-validity.service \
    $pkgdir/usr/lib/systemd/system/python3-validity.service

  install -D -m 644 ../python3-validity-suspend-hotfix.service \
    $pkgdir/usr/lib/systemd/system/python3-validity-suspend-hotfix.service

  install -D -m 644 debian/python3-validity.udev \
    $pkgdir/usr/lib/udev/rules.d/60-python-validity.rules

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
