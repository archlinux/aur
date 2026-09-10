# Maintainer: Korialo <korialo001[at]gmail[dot]com>
_pkgname=pysubs2
pkgname=python-pysubs2-git
pkgver=1.9.0.r0.g34d6ca5
pkgrel=1
pkgdesc="A Python library for editing subtitle files"
arch=('any')
url="https://github.com/tkarabela/pysubs2"
license=('MIT')
groups=()
depends=('python>=3.12')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-setuptools'
    #'python-sphinx'           # Doc dependencies:
    #'python-sphinx_rtd_theme' # with cyclic dependencies from
    #'python-enum-tools'       # 'enum-tools', `apeye` fails to build.
)
checkdepends=('python-pytest' 'python-pytest-timeout')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
provides=("python-pysubs2=${pkgver%%.r*}")
conflicts=('python-pysubs2')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}"
    export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
    export PYTEST_PLUGINS="pytest_timeout"
    pytest
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

