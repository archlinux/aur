# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_pkgbase=macbook12-spi-driver
pkgname=(${_pkgbase}-dkms)
pkgver=0+git.25
pkgrel=1
pkgdesc="WIP input driver for the SPI touchpad / keyboard found in the 12\" MacBook"
arch=('i686' 'x86_64')
url="https://github.com/cb22/macbook12-spi-driver"
license=('GPL2')
groups=('')
depends=('dkms')
makedepends=('git')
optdepends=()
source=(git+https://github.com/cb22/macbook12-spi-driver.git
        iso-layout.patch
        dkms.conf)
sha256sums=('SKIP'
            '986550b8a316f01be1f7dc6b5e28952a89ce76a0f3d5d35636970960c32adea1'
            '72d908df93de0022dbd5e3cc458a3434105fe61125454a2738587727a42e21b7')

pkgver() {
    cd $_pkgbase
    echo "0+git.$(git rev-list HEAD --count)"
}

build() {
    cd "${srcdir}"/${_pkgbase}

    # uncomment for ISO layout
    #patch -Nsf -p1 -i "${srcdir}"/iso-layout.patch
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
