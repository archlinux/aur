# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

pkgname=pdudaemon-git
pkgver=r176.e6b47d5
pkgrel=1
pkgdesc='Daemon for controlling PDUs (Power Distribution Units)'
arch=(any)
url="https://github.com/pdudaemon/pdudaemon"
license=('GPL2')
depends=('python' 'python-requests' 'python-pexpect'
         'python-systemd' 'python-paramiko' 'python-pyserial'
         'python-hidapi' 'python-pysnmp' 'python-pycryptodomex'
         'python-pyusb')
makedepends=('python-setuptools')
conflicts=('pdudaemon')
provides=('pdudaemon')
backup=('etc/pdudaemon/pdudaemon.conf')
source=('pdudaemon::git+https://github.com/pdudaemon/pdudaemon.git'
        'sysusers.d'
        'tmpfiles.d')
sha256sums=('SKIP'
            '889b97b347ae9b3d27f507ed9c40212e8e7e741d0ba5a5a36d28c2a5935e59c1'
            'fc725d7ffe871d08e53c36ec1495e602dc0e5595f94f0ecec6c097987c78b411')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -D -m755 "pduclient" "${pkgdir}/usr/bin/pduclient"
  install -D -m644 "share/pdudaemon.conf" "${pkgdir}/etc/pdudaemon/pdudaemon.conf"
  install -D -m644 "share/pdudaemon.service" "${pkgdir}/usr/lib/systemd/system/pdudaemon.service"
  install -D -m644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/pdudaemon.conf"
  install -D -m644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/pdudaemon.conf"

  sed "s/DynamicUser=yes/User=pdudaemon/" -i "${pkgdir}/usr/lib/systemd/system/pdudaemon.service"
}
