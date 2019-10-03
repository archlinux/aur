# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-raccoon
pkgver=2.1.5
pkgrel=3
pkgdesc="Python DataFrame with fast insert and appends"
url="https://raccoon.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-blist' 'python-six' 'python-tabulate')
makedepends=('python-pip')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/py2.py3/r/raccoon/raccoon-$pkgver-py2.py3-none-any.whl"
  "https://raw.githubusercontent.com/rsheftel/raccoon/master/LICENSE"
)
sha256sums=(
  'fd2388d715d8b07ed5b00aeeb8b670405b21b273e0ee967bf02507df583ae998'
  'a96e75fc0f88ed8bad941facf1548a78e3fe68bf374fe2dbf0baaa535c758a5c'
)
noextract=("raccoon-$pkgver-py2.py3-none-any.whl")

prepare() {
    # 'Install' the wheel to the source directory.
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$srcdir/raccoon-$pkgver" \
      --ignore-installed --no-deps --no-compile "raccoon-$pkgver-py2.py3-none-any.whl"
}

check() {
    # The install directory includes the Python version string so figure that out.
    PYVER=$(python -c 'import sys; print("python{}.{}".format(*sys.version_info[:2]))')

    # Run the tests on the version to be installed, but don't write the compiled
    # byte code of the modules here (it would include references to $srcdir).
    cd "raccoon-$pkgver/usr/lib/$PYVER/site-packages"
    PYTHONPATH="$PWD" PYTHONDONTWRITEBYTECODE=1 pytest -v tests/
}

package() {
    # Figure out the paths to the site-packages and dist-info directories in $pkgdir.
    PYVER=$(python -c 'import sys; print("python{}.{}".format(*sys.version_info[:2]))')
    SITEPKGS="$pkgdir/usr/lib/$PYVER/site-packages"
    DISTINFO="$SITEPKGS/raccoon-$pkgver.dist-info"

    # Copy the tree installed from the wheel over to the packaging directory.
    cp -a "raccoon-$pkgver/usr" "$pkgdir/"

    # Move the tests into the package directory so its not polluting
    # the main site-packages directory.
    mv "$SITEPKGS/tests" "$SITEPKGS/raccoon"

    # Update the dist-info (wheel) metadata to reflect our move of tests/.
    sed -i -e '/^tests$/d' "$DISTINFO/top_level.txt"
    sed -i -e 's/^tests/raccoon\/tests/' "$DISTINFO/RECORD"

    # Install the license.
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Copy the readme from the dist-info directory.
    install -Dm644 "$DISTINFO/DESCRIPTION.rst" "$pkgdir/usr/share/doc/${pkgname}/README.rst"

    # Compile the modules to optimized bytecode. The -d option is used to specify
    # the location of the file in the final system so that any tracebacks etc.
    # refer to the correct file.
    cd "$SITEPKGS"
    python -O -m compileall -d "/usr/lib/$PYVER/site-packages/raccoon" "raccoon"
}
