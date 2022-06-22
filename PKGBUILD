# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
pkgname=python-projectq
_name="ProjectQ"
pkgver=0.7.3
pkgrel=2
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
    'pybind11'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=('python-pytest')
optdepends=('python-boto3: support for AWS Braket service')
source=("https://github.com/${_name}-Framework/${_name}/releases/download/v${pkgver}/${pkgname/python-}-${pkgver}.tar.gz")
b2sums=('8fa8346e59eaaa2226dd26e351bc3e752f0dc0d092550a4a4060096be727f0fce2bb5303461ce18ee9041a585a1c2298661757314bddecbbfadac2936a31be30')

build() {
    cd "${srcdir}/${_name,,}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_name,,}-${pkgver}/projectq"
    python -m installer --destdir="${srcdir}/test" ../dist/*.whl
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${srcdir}"/test/usr/lib/python${python_version}/site-packages
    python -m pytest tests/
}

package() {
    cd "${srcdir}/${_name,,}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -D -m644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
    chmod 644 "${pkgdir}/usr/share/doc/${pkgname}/examples/"*
}
