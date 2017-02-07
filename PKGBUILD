# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover-git
pkgdesc="Free and open source real-time stenography engine."
pkgver=4.0.0.dev0.44.gdcf0425
pkgrel=2
arch=('any')
license=('GPLv2 or any later version')
depends=(
  'python2'
  'python2-appdirs'
  'python2-dbus'
  'python2-hidapi'
  'python2-pyqt5'
  'python2-pyserial'
  'python2-setuptools'
  'python2-six'
  'python2-xlib'
  'wmctrl'
)
makedepends=(
  'git'
  'python2-babel'
  'python2-mock'
  'python2-pytest'
  'python2-setuptools-scm'
)
provides=('plover')
conflicts=('plover-git')
url="http://www.openstenoproject.org/plover/"
source=($pkgname::git+https://github.com/openstenoproject/plover.git)
sha1sums=(SKIP)

pkgver() {
  cd "$pkgname"
  python2 setup.py patch_version | sed -n '/^patching version to /{s///;s/+/./;p;Q0};${Q1}'
}

prepare() {
  cd "$pkgname"
  sed -e 's/"py\(rcc\|uic\)5"/"python2-py\15"/' -i pyuic.json
}

build() {
  cd "$pkgname"
  PYTHONPATH="$(echo -n .eggs/pyqt_distutils-*.egg)" python2 setup.py build
}

check() {
  cd "$pkgname"
  python2 setup.py test
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir"
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
