# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-librelane
pkgver=2.4.8
pkgrel=1
pkgdesc="An infrastructure for implementing chip design flows (successor to OpenLane)."
arch=('any')
url="https://github.com/librelane/librelane"
license=('Apache-2.0')

# Corrected dependencies for Arch Linux repositories:
# python-semver -> python-semantic-version
# python-tk -> tk
depends=(
    'python'
    'python-psutil'
    'python-semantic-version'
    'python-cloup'
    'python-pyyaml'
    'python-lxml'
    'python-deprecated'
    'python-httpx'
    'python-rapidfuzz'
    'python-rich'
    'tk'
    'klayout'
)

makedepends=(
    'python-setuptools'
    'python-pip'
)
# Source from the GitHub release tag
source=("librelane-${pkgver}.tar.gz::https://github.com/librelane/librelane/archive/refs/tags/${pkgver}.tar.gz")

# Correct sha256sum for release 2.4.8 tarball
sha256sums=('034bf1bd6de5b1ff735412e309c575a96fe1eee0c3f5447b049852f35a8b387c')

build() {
    echo "Building"
}

package() {
    # The GitHub source tarball extracts to librelane-${pkgver}
    cd "$srcdir/librelane-${pkgver}"

    # Install the package using pip into the faux root ($pkgdir)
    # The two new flags suppress the PATH and root warnings:
    # 1. --no-warn-script-location suppresses the PATH warning.
    # 2. --root-user-action=ignore suppresses the root user warning.
    python -m pip install --upgrade --isolated \
        --root="$pkgdir" --no-deps \
        --no-warn-script-location \
        --root-user-action=ignore .

    # --- Cleanup Steps to Remove Makepkg Warnings ---

    # Note: Use python3.13 as seen in your previous output.
    PYTHON_SITE_PACKAGES="$pkgdir/usr/lib/python3.13/site-packages"

    # 1. Remove .pyc files (Fixes $pkgdir references in bytecode)
    find "$PYTHON_SITE_PACKAGES" -name "*.pyc" -delete

    # 2. Remove direct_url.json (Fixes $srcdir reference)
    rm -f "$PYTHON_SITE_PACKAGES/librelane-${pkgver}.dist-info/direct_url.json"

    # 3. Fix permissions (standard practice for Python packages)
    chmod -R g-w "$pkgdir"
}

