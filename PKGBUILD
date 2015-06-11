pkgname=python2-temper
pkgver=1.2.1
pkgrel=1
pkgdesc="This is a rewrite of a userspace USB driver for TEMPer devices presenting a USB ID like this: 0c45:7401 Microdia"
arch=('any')
license=('unknown')
url=('https://github.com/padelt/temper-python')
makedepends=('python-distribute')
install=${pkgname}.install
source=(https://github.com/padelt/temper-python/archive/master.zip
        munin.patch)
sha256sums=('a335199bc8cdbc01a642d8336ab356dbcb6016a7b43c961908fa97bb5a634a3b'
            '2f19940d78f04c72e85d3fed2e896179d71a3a750c069043d77f9adb59f6545b')
depends=('python2' 'python2-pyusb-beta' 'python2-setuptools' 'python2-snmp-passpersist')
provides=("${pkgname}")

prepare() {
  cd "${srcdir}/temper-python-master"
  sed -i 's/python/python2/g' "${srcdir}/temper-python-master/etc/munin-temperature"
  cd "etc"
  patch -Np1 -i "${srcdir}/munin.patch"
}
package() {
  cd "${srcdir}/temper-python-master"
  python2 setup.py install --root "${pkgdir}"
  mkdir -p "${pkgdir}/etc/udev/rules.d" "${pkgdir}/usr/lib/munin/plugins"
  install -Dm644 "${srcdir}/temper-python-master/etc/99-tempsensor.rules" "${pkgdir}/etc/udev/rules.d/"
  install -Dm755 "${srcdir}/temper-python-master/etc/munin-temperature" "${pkgdir}/usr/lib/munin/plugins/temper"
}
