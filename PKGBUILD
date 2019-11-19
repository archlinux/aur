# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=mlbstreamer
pkgver=0.0.10
pkgrel=2
pkgdesc="Enables real-time and time-shifted viewing of MLB.tv streams"
url="https://github.com/tonycpsu/mlbstreamer"
arch=('any')
license=('GPL2')
depends=(
  'python' 'python-six' 'python-requests' 'python-lxml' 'python-pytz'
  'python-tzlocal' 'python-pymemoize' 'python-orderedattrdict' 'python-yaml'
  'python-dateutil' 'streamlink' 'python-prompt_toolkit' 'python-urwid'
  'python-urwid_utils' 'python-panwid'
)
makedepends=(
  'python-setuptools'
)
source=(
  "https://github.com/tonycpsu/mlbstreamer/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '78550190b990608234241b9ec6a884098b5895da21474eb8b8c7af333a7631ca'
)

# The dateutil module is provided through the python-dateutil dependency.
# However, setuptools doesn't pick this up and so raises a fatal error
# when the command-line executables start. Removing it from setup.py doesn't
# affect the build and packaging, but prevents this error.
prepare() {
    cd "mlbstreamer-$pkgver"
    sed -i -e "/py-dateutil/d" setup.py
}

build() {
    cd "mlbstreamer-$pkgver"
    python setup.py build
}

package() {
    cd "mlbstreamer-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    SPDIR=$(python -c 'import site; print(site.getsitepackages()[0])')
    rm -r "$pkgdir$SPDIR/test"
}
