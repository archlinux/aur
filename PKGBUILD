# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
_pkgname=console-solarized
pkgname=console-solarized-git
pkgver=r17.g26929b5
pkgrel=2
pkgdesc="A Solarized colorscheme for the Linux console"
arch=('any')
url='https://github.com/adeverteuil/console-solarized'
license=('MIT')
backup=('etc/console-solarized.conf')
depends=('systemd')
makedepends=('git')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/adeverteuil/console-solarized.git"
        '0001-systemd.service-add-condition-to-test-for-tty-device.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i ../0001-systemd.service-add-condition-to-test-for-tty-device.patch
  sed -i -e 's#^\(ExecStart=.*\)/local/\(.*\)$#\1/\2#' console-solarized@.service
}
package() {
  cd "${_pkgname}"
  install -Dm755 console-solarized -t "${pkgdir}"/usr/bin
  install -Dm644 console-solarized@.service  -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm644 solarized.conf "${pkgdir}"/usr/lib/systemd/system/getty@.service.d/console-solarized.conf
  install -Dm644 console-solarized.conf -t "${pkgdir}"/etc/
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
