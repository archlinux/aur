# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Andrea Pascal <andrea@anodium.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-pygatt
_module=pygatt
pkgver=5.0.0
pkgrel=2
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
license=('Apache-2.0 AND MIT')
arch=('any')
depends=(python python-pexpect python-pyserial)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-coverage python-mock python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/peplin/${_module}/archive/refs/tags/v${pkgver}.tar.gz
        0001-Remove-dependency-on-enum-compat.patch
        0002-Relax-version-requirements.patch)
sha256sums=('94d02ec4de32a81d1f5adc87664091a38e3cf0c2680dfe9b313c4de797e5e737'
            '3d73f29806f1ce8d9f37927b2c9243f2ec2fd783730708ad0e9d96afa0720e2c'
            '8928f19c185be8dc2ba4583c88cb3d1ae580667f2d902c50c72d95e1fdba6061')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < "${srcdir}/0001-Remove-dependency-on-enum-compat.patch"
    patch -p1 < "${srcdir}/0002-Relax-version-requirements.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
