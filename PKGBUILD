# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-menu
pkgver=1.1.20150415155150
_srcdirname=deepin-menu-1.1+20150415155150~faffe35053
pkgrel=1
pkgdesc="Deepin menu service for building beautiful menus."
arch=('i686' 'x86_64')
url="https://gitcafe.com/Deepin/deepin-menu"
license=('GPL3')
depends=('python2-pyqt5')
makedepends=('python2-setuptools' 'qt5-declarative' 'qt5-x11extras')
groups=('deepin')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/deepin-menu/deepin-menu_1.1+20150415155150~faffe35053.tar.gz")
sha256sums=('9e7e8c95d02543b1be339d53a2a77a6a0b3797d6d9d49e1abf41f65d95b2f8e1')

prepare() {
  cd "${_srcdirname}"

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python *$=\1python2='
}

build() {
  cd "${_srcdirname}"

  python2 setup.py build
  qmake && make
}

package() {
  cd "${_srcdirname}"

  python2 setup.py install --root="${pkgdir}" --optimize=1

  make INSTALL_ROOT="$pkgdir" install

  #install -dm 755 "${pkgdir}"/usr/share/pyshared
  install -dm 755 "${pkgdir}"/usr/share/dbus-1/services/
  install -dm 755 "${pkgdir}"/etc/xdg/autostart/

  mv "${pkgdir}"/usr/deepin_menu "${pkgdir}"/usr/share/pyshared
  chmod +x "${pkgdir}"/usr/share/pyshared/menu.py

  install -m 644 *.service "${pkgdir}"/usr/share/dbus-1/services/
  install -m 644 *.desktop "${pkgdir}"/etc/xdg/autostart/
}
