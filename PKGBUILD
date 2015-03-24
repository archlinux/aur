# Maintainer: Andre <andre-arch@delorus.de>
pkgname=python2-openant-git
_gitname=openant
pkgver=r86.4500761
pkgrel=4
pkgdesc="A python library to download and upload files from ANT-FS compliant devices (Garmin products)."
arch=('i686' 'x86_64')
source=('git+https://github.com/Tigge/openant')
url="https://github.com/Tigge/openant"
license=("custom:${_gitname}")
depends=('python2' 'python2-pyusb-beta')
makedepends=('python2-setuptools')
optdepends=('antfs-cli-git: To extract all activity FIT files from a device and write them to a folder.')
install=openant.install
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitname}"

  install -Dm644 resources/ant-usb-sticks.rules ${pkgdir}/usr/lib/udev/rules.d/71-ant-usb-sticks.rules

  sed -i 's/install_udev_rules(True)/install_udev_rules(False)/g' setup.py
  sed -i 's/os.geteuid() == 0/False/' setup.py

  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 README.md ${pkgdir}/usr/share/${_gitname}/README

  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE
}

