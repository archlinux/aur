# Maintainer: Benoit Pierre <benoit.pierre@gmail.com>

pkgname=plover-git
pkgdesc="Free and open source real-time stenography engine."
pkgver=4.0.0.dev10+115.gc75215e
pkgrel=4
arch=('any')
license=('GPL2')
depends=(
  'python'
  'python-appdirs'
  'python-dbus'
  'python-plover_stroke'
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
  'python-install'
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
  pytest test
}

package() {
  cd "$pkgname"
  python -m install --destdir="$pkgdir" --optimize=1 dist/*.whl
  install -vDm644 -t "${pkgdir}/usr/share/pixmaps" plover/assets/plover.png
  install -vDm644 -t "${pkgdir}/usr/share/applications" linux/plover.desktop
  chmod og+rX -R "$pkgdir"
  # Workaround `python-install` bug: console scripts missing execute permissions...
  chmod +x "$pkgdir/usr/bin"/*
}

# vim:set sw=2 sts=2 et:
