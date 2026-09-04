# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=python-librelane
pkgver=3.0.11
pkgrel=1
pkgdesc="An infrastructure for implementing chip design flows (successor to OpenLane)."
arch=('any')
url="https://github.com/librelane/librelane"
license=('Apache-2.0')

depends=(
    'abc'
    'klayout'
    'python'
    'python-ciel'
    'python-cloup'
    'python-deprecated'
    'python-httpx'
    'python-libparse'
    'python-lxml'
    'python-psutil'
    'python-pyyaml'
    'python-rapidfuzz'
    'python-rich'
    'python-semver'
    'python-yamlcore'
    'tk'
    'yosys'
)

makedepends=(
    'python-setuptools'
    'python-setuptools-scm'
    'python-pip'
    'python-build'
    'python-installer'
    'python-wheel'
)

provides=("python-librelane-git")
conflicts=("python-librelane-git")

source=("librelane-${pkgver}.tar.gz::https://github.com/librelane/librelane/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('20d24c80619af83f0e088da806d57ead46eb89cd7a00bcae94d939978849d535')

build() {
    cd "librelane-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "librelane-${pkgver}"

    local _wheel=$(ls dist/*.whl)
    python -m installer --destdir="$pkgdir" "$_wheel"

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
