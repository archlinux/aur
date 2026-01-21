# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-librelane
pkgver=3.0.0.dev47.r5.gb33e0b7
pkgrel=1
pkgdesc="An infrastructure for implementing chip design flows (successor to OpenLane) - DEVELOPMENT VERSION (git dev branch)."
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
    'yosys'
    'abc'
)

makedepends=(
    'git'
    'python-setuptools'
    'python-setuptools-scm'
    'python-pip'
    'python-build'
    'python-installer'
    'python-wheel'
)

# Since this is now named 'python-librelane', it provides itself.
# We keep 'python-librelane-git' in provides/conflicts so users of 
# the old naming scheme can transition smoothly.
provides=("python-librelane-git")
conflicts=("python-librelane-git")

source=("librelane::git+https://github.com/librelane/librelane.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/librelane"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1g/;s/-/./g'
}

build() {
    cd "$srcdir/librelane"
    
    # Exporting the version helps setuptools_scm recognize the dynamic version
    export SETUPTOOLS_SCM_PRETEND_VERSION=$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/+/')
    
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/librelane"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Fix for Yosys synthesis pathing
    install -d "$pkgdir/usr/bin"
    ln -sf abc "$pkgdir/usr/bin/yosys-abc"

    # Clean up Python artifacts
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHON_SITE_PACKAGES="${pkgdir}${site_packages}"

    if [ -d "$PYTHON_SITE_PACKAGES" ]; then
        find "$PYTHON_SITE_PACKAGES" -name "__pycache__" -type d -exec rm -rf {} +
        find "$PYTHON_SITE_PACKAGES" -name "direct_url.json" -delete
    fi

    # Install the license file - using the new pkgname variable
    install -Dm644 License -t "$pkgdir/usr/share/licenses/$pkgname/"

    chmod -R g-w "$pkgdir"
}
