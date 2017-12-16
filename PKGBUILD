# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover-git
pkgdesc="Free and open source real-time stenography engine."
pkgver=4.0.0.dev6.7.gfcac6c3
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  'python'
  'python-appdirs'
  'python-dbus'
  'python-pyqt5'
  'python-pyserial'
  'python-setuptools'
  'python-xlib'
)
makedepends=(
  'git'
  'python-babel'
  'python-mock'
  'python-pytest'
  'python-setuptools-scm'
)
provides=('plover')
conflicts=('plover-git')
url="http://www.openstenoproject.org/plover/"
source=($pkgname::git+https://github.com/openstenoproject/plover.git)
sha1sums=(SKIP)

pkgver() {
  cd "$pkgname"
  python setup.py patch_version | sed -n '/^patching version to /{s///;s/+/./;p;Q0};${Q1}'
}

prepare() {
  cd "$pkgname"
  sed -i '/^\s*PyQt5\b.*/d' setup.py setup.cfg
}

build() {
  cd "$pkgname"
  python setup.py build
}

check() {
  cd "$pkgname"
  python setup.py test
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir"
  install -vDm644 -t "${pkgdir}/usr/share/pixmaps" plover/assets/plover.png
  install -vDm644 -t "${pkgdir}/usr/share/applications" application/plover.desktop
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
