# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
_name='h3-py'
pkgname=('python-h3')
pkgdesc="Hexagonal Hierarchical Geospatial Indexing System in Python"
pkgver=4.3.1
pkgrel=1
url="https://github.com/uber/${_name}"
license=('Apache-2.0')
arch=('x86_64' 'x86_64_v3')
depends=(
    'python'
    # Implicit dependencies
    'glibc'
)
optdepends=(
    'python-numpy'
)
makedepends=(
    # VCS
    'git'
    # PEP 517
    'python-build'
    'python-installer'
    'python-wheel'
    # From pyproject.toml
    'cython'
    'python-scikit-build-core'
)
source=(
    "git+${url}.git#tag=v${pkgver}"
    'git+https://github.com/uber/h3.git'
)
b2sums=('43a8b67be8065fff15d7c882132c04952865ddf7283145092c625b63d265d367475609c9cd6af8e4a366bfbc9ca5796d4c77b98987b3e1d28352238efa5ed1c0'
        'SKIP')

prepare() {
    cd "${srcdir}/${_name}"
    git submodule init
    git config submodule.src/h3lib.url "${srcdir}/h3"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
