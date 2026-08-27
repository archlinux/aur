# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-handy-archives
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Handy archive helpers for Python'
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://handy-archives.readthedocs.io/'
depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-flit-core'
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/handy-archives.git#tag=v$pkgver")
sha256sums=('b3054aa2f2ad87d2a545d4e5d34431d355b1fbbfd2511b1ef2948e5ff24b52b9')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i -E 's/"([a-zA-Z][a-zA-Z0-9_.-]*)[><!=~][0-9][^"]*"/"\1"/g' pyproject.toml
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
