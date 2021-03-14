_pkg=pyscreenshot
pkgname=python-${_pkg}-git
provides=(python-${_pkg})
conflicts=(python-${_pkg})
pkgver=2.3.r6.g9bccb78
pkgrel=1
pkgdesc="Copy the contents of the screen to a PIL or Pillow image memory"
arch=(any)
url="https://github.com/ponty/pyscreenshot"
license=(BSD)
depends=(python-easyprocess python-entrypoint2 python-mss python-jeepney)
makedepends=(python-setuptools git)
checkdepends=(
    python-pytest python-pyvirtualdisplay python-pillow python-path.py
    python-xlib python-gobject python-pyqt5 python-qtpy python-wxpython
    pyside2 xorg-server-xvfb xorg-xdpyinfo gnome-screenshot scrot imagemagick
    maim pqiv
)
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${_pkg}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkg}
  python setup.py build
}

check() {
  cd ${_pkg}
  export PYTHONPATH="${PWD}/build/lib/" 
  python -m pyscreenshot.check.versions
  python -m pyscreenshot.check.speedtest --virtual-display
  xvfb-run -n 101 -s "+extension RANDR -br -screen 0 900x800x24" python -m pytest -v
  xvfb-run -n 102 -s "-extension RANDR -br -screen 0 900x800x24" python -m pytest -v
}

package() {
  cd ${_pkg}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
