# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-panwid
pkgver=0.2.5
pkgrel=2
pkgdesc="A collection of widgets for urwid"
url="https://github.com/tonycpsu/panwid"
arch=('any')
license=('LGPL2.1')
depends=(
  'python-urwid_utils' 'python-six' 'python-raccoon'
  'python-blist' 'python-orderedattrdict'
)
makedepends=('python-setuptools')
source=(
  "https://github.com/tonycpsu/panwid/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '1646404886f158682eef5f76daa43e47513813d6f0349e6b54b0b9dc3f4b1ebf'
)

build() {
    cd "panwid-$pkgver"
    python setup.py build
}

check() {
    cd "panwid-$pkgver"
    python setup.py test
}

package() {
    # Do the initial install. Skip compiling bytecode here since we are going
    # to move some things later which would invalidate the paths to the source
    # files stored in the bytecode.
    cd "panwid-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --no-compile --skip-build

    # Figure out the paths to the site-packages and dist-info directories in $pkgdir.
    PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    SITEPKGS="$pkgdir/usr/lib/python$PYVER/site-packages"
    EGGINFO="$SITEPKGS/panwid-$pkgver-py$PYVER.egg-info"

    # Move the tests into the package directory so its not polluting
    # the main site-packages directory.
    mv "$SITEPKGS/test" "$SITEPKGS/panwid"

    # Update the egg-info metadata to reflect our move of tests/.
    sed -i -e '/^test$/d' "$EGGINFO/top_level.txt"
    sed -i -e 's/^test/panwid\/test/' "$EGGINFO/SOURCES.txt"

    # Compile the modules to optimized bytecode. The -d option is used to specify
    # the location of the file in the final system so that any tracebacks etc.
    # refer to the correct file.
    cd "$SITEPKGS"
    python -O -m compileall -d "/usr/lib/python$PYVER/site-packages/panwid" "panwid"
}
