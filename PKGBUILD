# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=mlbstreamer-git
pkgver=v0.0.10.r23.g92eb0ad
pkgrel=1
pkgdesc="Enables real-time and time-shifted viewing of MLB.tv streams"
url="https://github.com/tonycpsu/mlbstreamer"
arch=('any')
license=('GPL2')
conflicts=('mlbstreamer')
provides=('mlbstreamer')
depends=(
  'python' 'python-six' 'python-requests' 'python-lxml' 'python-pytz'
  'python-tzlocal' 'python-pymemoize' 'python-orderedattrdict' 'python-yaml'
  'python-dateutil' 'streamlink>=0.11.0' 'python-prompt_toolkit' 'python-urwid'
  'python-urwid_utils>=0.1.2' 'python-panwid>=0.2.5'
)
makedepends=('git')
source=(
  'git+https://github.com/tonycpsu/mlbstreamer.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "mlbstreamer"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# The dateutil module is provided through the python-dateutil dependency.
# However, setuptools doesn't pick this up and so raises a fatal error
# when the command-line executables start. Removing it from setup.py doesn't
# affect the build and packaging, but prevents this error.
prepare() {
    cd "mlbstreamer"
    sed -i -e "/py-dateutil/d" setup.py
}

# Make the setup.py version match the PKGBUILD version so the .egg-info
# metadata also matches. Not entirely sure this is needed but it seems cleaner.
build() {
    cd "mlbstreamer"
    sed -i -e "s/version=\"[0-9a-z\.]\+\"/version=\"${pkgver:1}\"/" setup.py
    python setup.py build
}

package() {
    cd "mlbstreamer"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    rm -r "$pkgdir/usr/lib/python3.7/site-packages/test"
}
