# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

_pipname=pycrc16
pkgname="python-crc16"
pkgver=0.1.2
pkgrel=2
pkgdesc="Library for calculating CRC16"
url="https://pypi.org/project/pycrc16/"
arch=('x86_64' 'aarch64')
license=('LGPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("${_pipname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('fe1a03d92b352669baa4f7376392674e96f1e47a9c520dae3d0cd522c8c3b744')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="tmp_install" "${_pipname}-${pkgver}"/dist/*.whl
    PYTHONPATH="${srcdir}/tmp_install$_site_packages:$PYTHONPATH" python "${srcdir}/tmp_install$_site_packages/crc16/test.py" -v
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" CHANGES.txt README.txt
}
