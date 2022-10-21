# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-comparxiv
_name=${pkgname#python-}
pkgver=0.1.8
pkgrel=2
pkgdesc="A wrapper of latexdiff to compare two version of an arXiv preprint with a single command"
arch=('any')
url="https://github.com/temken/comparxiv"
license=('MIT')
depends=(
    'python-arxiv'
    'python-argparse'
    'python-requests'
    'python-tqdm'
    'texlive-bin'
    'texlive-core'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
#checkdepends=('python-pytest')
source=(
    "${_name}-${pkgver}.tar.gz::https://github.com/temken/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "fix-query.patch::https://github.com/temken/${_name}/commit/a73f623.patch"
)
b2sums=(
    'df820799c1d03d141af27e3fb6b8f4caa6c8ce190056496ff99bc4b6857d8d9a1f6d268ed14352bbc2293d22fd1d1ea1295eac2ec89b44a9fdb70b6c12be6330'
    '0320b0a2fd23196f645814e05d8b1792248c2094953e93cc60042232698014aee0df205515aab502fecb64bd9feccf2e84c870c5a71a06d6b7368ccb98657a35')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/fix-query.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "${srcdir}/${_name}-${pkgver}"
#    rm -rf test
#    python -m installer --destdir="test" dist/*.whl
#    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#    export PYTHONPATH="${PWD}/test/usr/lib/python${python_version}/site-packages"
#    rm -rf ${_name}
#    python -m pytest -v tests/
#}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
