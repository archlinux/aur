# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: Andrea Pascal <andrea@anodium.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-pygatt
_module=pygatt
pkgver=4.0.5
pkgrel=4
pkgdesc="Python Bluetooth LE (Low Energy) and GATT Library"
url="https://github.com/peplin/pygatt"
license=('custom:partly Apache, partly MIT')
arch=('any')
depends=(python-pexpect python-pyserial)
makedepends=(python-build python-installer python-wheel python-nose)
checkdepends=(python-mock)
source=(https://github.com/peplin/${_module}/archive/refs/tags/v${pkgver}.tar.gz
        0001-Remove-dependency-on-enum-compat.patch)
sha256sums=('fdfca26688b55f8d63800dbca6989bfbfff7796e0dcba3b020daffea34e9f224'
            '1485111d418ac0812751426bbbec76ef56f8d79b7740f41009f7f6cb7f2a1e1a')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < "${srcdir}/0001-Remove-dependency-on-enum-compat.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    nosetests
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
