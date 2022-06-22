# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
pkgname=python-projectq
_name="ProjectQ"
pkgver=0.7.3
pkgrel=1
pkgdesc="Open-source framework for quantum computing"
arch=('x86_64')
url="https://github.com/ProjectQ-Framework/ProjectQ"
license=("Apache")
depends=(
    'python-matplotlib'
    'python-networkx'
    'python-numpy'
    'python-requests'
    'python-scipy'
)
makedepends=(
    'git'
    'pybind11'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('python-boto3: support for AWS Braket service')
source=("${pkgname}::git+https://github.com/ProjectQ-Framework/${_name}.git#tag=v${pkgver}")
b2sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}/projectq"
    python -m installer --destdir="${srcdir}/test" ../dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${srcdir}"/test/usr/lib/python${python_version}/site-packages
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -D -m644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
    chmod 644 "${pkgdir}/usr/share/doc/${pkgname}/examples/"*
}
