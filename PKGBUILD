# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Andrey Melentyev <andrey.melentyev@protonmail.com>
_pkgbase=macbook12-spi-driver
pkgname=(${_pkgbase}-dkms)
pkgver=0+git.315
pkgrel=1
pkgdesc="Driver for the keyboard, touchpad and touchbar found in newer MacBook (Pro) models"
arch=('i686' 'x86_64')
url="https://github.com/marc-git/macbook12-spi-driver"
license=('GPL2')
depends=('dkms')
makedepends=('git')
optdepends=()
source=(git+https://github.com/marc-git/macbook12-spi-driver.git#branch=touchbar-driver-hid-driver
        dkms.conf)
sha256sums=('SKIP'
            'e42243352d015a78e5d13260361d3052d0b84c4105bcb89191a319f2249cc47b')

pkgver() {
    cd $_pkgbase
    echo "0+git.$(git rev-list HEAD --count)"
}

package() {
    install -dm755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

    # Copy sources (including Makefile)
    cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

    # Copy dkms.conf over the original one from the repo
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
