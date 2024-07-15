# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-colcon-cmake-git
_name=colcon-cmake
pkgver=r122.454124f
pkgrel=1
pkgdesc="An extension for colcon-core to support CMake projects."
arch=(any)
url="https://github.com/colcon/colcon-cmake"
license=('Apache')
provides=(python-colcon-cmake)
conflicts=(python-colcon-cmake)
depends=('python-colcon-core')
makedepends=('python-setuptools' 'flake8')
source=(
    colcon-cmake::git+https://github.com/colcon/colcon-cmake
    https://github.com/myint/scspell/archive/refs/tags/v2.2.tar.gz)
sha256sums=('SKIP'
            '04c6a795a9e0ef4571678eb9fc503bcf39106a975691336af778f31a01027082')

pkgver() {
    cd ${srcdir}/${_name}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_name}
    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_name}/test
    export PYTHONPATH="${srcdir}/scspell-2.2:${srcdir}/${_name}"
    ls test*.py | xargs -I {} pytest {}
}

package() {
    cd ${srcdir}/${_name}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
