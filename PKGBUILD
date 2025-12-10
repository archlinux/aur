# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-librelane
pkgver=3.0.0.dev45
pkgrel=1
pkgdesc="An infrastructure for implementing chip design flows (successor to OpenLane) - DEVELOPMENT VERSION."
arch=('any')
url="https://github.com/librelane/librelane"
license=('Apache-2.0')

depends=(
    'python'
    'python-psutil'
    'python-semver'
    'python-cloup'
    'python-pyyaml'
    'python-lxml'
    'python-deprecated'
    'python-httpx'
    'python-ciel'
    'python-rapidfuzz'
    'python-rich'
    'tk'
    'klayout'
    # NOTE: Development versions might have new dependencies not listed here!
)

makedepends=(
    'python-setuptools'
    'python-pip'
)
# Source URL updated for the new tag
source=("librelane-${pkgver}.tar.gz::https://github.com/librelane/librelane/archive/refs/tags/${pkgver}.tar.gz")

# >>> ATTENTION: REPLACE 'SKIP' WITH THE ACTUAL CHECKSUM <<<
sha256sums=('e54b5e60e8e3e4ff639ed288d66f12d07d577f23f038a07c9303ad2e4fea2d27')

build() {
    # No build step necessary for this pure Python package.
    echo "Building"
}

package() {
    # Change to the extracted source directory
    cd "$srcdir/librelane-${pkgver}"

    # Install the package using pip into the faux root ($pkgdir)
    python -m pip install --upgrade --isolated \
        --root="$pkgdir" --no-deps \
        --no-warn-script-location \
        --root-user-action=ignore .

    # Define the site-packages path based on your system's Python version
    PYTHON_SITE_PACKAGES="$pkgdir/usr/lib/python3.13/site-packages"
    
    # Clean up makepkg warnings: remove bytecode and direct_url reference
    find "$PYTHON_SITE_PACKAGES" -name "*.pyc" -delete
    rm -f "$PYTHON_SITE_PACKAGES/librelane-${pkgver}.dist-info/direct_url.json"

    # Fix permissions
    chmod -R g-w "$pkgdir"
}
