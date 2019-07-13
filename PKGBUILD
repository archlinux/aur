# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

pkgname=pdudaemon-git
pkgver=r138.5ec803b
pkgrel=2
pkgdesc='Daemon for controlling PDUs (Power Distribution Units)'
arch=(any)
url="https://github.com/pdudaemon/pdudaemon"
license=('GPL2')
depends=('python' 'python-requests' 'python-pexpect'
         'python-systemd' 'python-paramiko' 'python-pyserial'
         'python-hidapi' 'python-pysnmp')
makedepends=('python-setuptools')
backup=('etc/pdudaemon.conf')
source=('pdudaemon::git+https://github.com/pdudaemon/pdudaemon.git')
sha1sums=('SKIP')

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

  install -D -m644 "share/pdudaemon.conf" "${pkgdir}/etc/pdudaemon.conf"
  install -D -m644 "share/pdudaemon.service" "${pkgdir}/usr/lib/systemd/system/pdudaemon.service"
}
