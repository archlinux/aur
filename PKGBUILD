# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover-git
pkgdesc="Free and open source real-time stenography engine."
pkgver=4.0.0.dev12
pkgrel=1
arch=('any')
license=('GPL2')
depends=(
  'dbus'
  'python'
  'python-appdirs'
  'python-plover_stroke>=1.1.0'
  'python-pyqt5'
  'python-pyserial'
  'python-rtf_tokenize'
  'python-setuptools'
  'python-wcwidth'
  'python-xlib'
  'qt5-svg'
)
makedepends=(
  'git'
  'python-babel'
  'python-build'
  'python-installer'
  'python-mock'
  'python-pytest'
  'python-pytest-qt'
  'python-pytest-xvfb'
  'python-wheel'
)
provides=('plover')
conflicts=('plover')
url="http://www.openstenoproject.org/plover/"
source=($pkgname::git+https://github.com/openstenoproject/plover.git)
sha1sums=(SKIP)

pkgver() {
  cd "$pkgname"
  python setup.py --quiet patch_version
  python setup.py --version
}

prepare() {
  cd "$pkgname"
  # Use the distributions' main entry point, so plugins are isolated.
  sed -i 's/^\(\s*plover = plover.\)main:main$/\1dist_main:main/' setup.cfg
}

build() {
  cd "$pkgname"
  pyproject-build --no-isolation --skip-dependency-check --wheel
}

check() {
  cd "$pkgname"
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest -p pytest-qt -p xvfb test
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
  install -vDm644 -t "${pkgdir}/usr/share/pixmaps" plover/assets/plover.png
  install -vDm644 -t "${pkgdir}/usr/share/applications" linux/plover.desktop
  chmod og+rX -R "$pkgdir"
}

# vim:set sw=2 sts=2 et:
