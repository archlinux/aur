# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_pkgbase=macbook12-spi-driver
pkgname=(${_pkgbase}-dkms)
pkgver=0+git.35
pkgrel=2
pkgdesc="WIP input driver for the SPI touchpad / keyboard found in the 12\" MacBook"
arch=('i686' 'x86_64')
url="https://github.com/cb22/macbook12-spi-driver"
license=('GPL2')
groups=('')
depends=('dkms')
makedepends=('git')
optdepends=()
source=(git+https://github.com/cb22/macbook12-spi-driver.git
        0001-add-option-iso_layout.patch
        dkms.conf)
sha256sums=('SKIP'
            '81a95ad335d6e6cfb0c4b5e590be488cd241e039a4c913753e4f6096d57491ad'
            '72d908df93de0022dbd5e3cc458a3434105fe61125454a2738587727a42e21b7')

pkgver() {
    cd $_pkgbase
    echo "0+git.$(git rev-list HEAD --count)"
}

build() {
    cd "${srcdir}"/${_pkgbase}
    patch -p1 -i "${srcdir}"/0001-add-option-iso_layout.patch
}

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    cp -r \
        "${srcdir}"/${_pkgbase}/* \
        "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
