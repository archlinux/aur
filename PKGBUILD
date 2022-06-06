# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Maintainer: Andrey Melentyev <andrey.melentyev@protonmail.com>
_pkgbase=macbook12-spi-driver
pkgname=(${_pkgbase}-dkms)
pkgver=0+git.304
pkgrel=4
pkgdesc="Driver for the keyboard, touchpad and touchbar found in newer MacBook (Pro) models"
arch=('i686' 'x86_64')
url="https://github.com/roadrunner2/macbook12-spi-driver"
license=('GPL2')
groups=('')
depends=('dkms')
makedepends=('git')
optdepends=()
source=(git+https://github.com/roadrunner2/macbook12-spi-driver.git#branch=touchbar-driver-hid-driver
        dkms.conf
        linux-5.9.patch::https://github.com/PatrickVerner/macbook12-spi-driver/commit/5328c33cf2fc40208811cd6e191890537db6aeb4.patch
        linux-5.13.patch::https://github.com/PatrickVerner/macbook12-spi-driver/commit/cb139b1f725ef23063c787028bcb8287571cffae.patch
        linux-5.14.patch::https://github.com/PatrickVerner/macbook12-spi-driver/commit/f85d028a41fbc928048c8ad248735501e76a2ce9.patch
        linux-5.18.1.patch::https://github.com/roadrunner2/macbook12-spi-driver/commit/2905d318d1a3ee1a227052490bf20eddef2592f9.patch)
sha256sums=('SKIP'
            'e42243352d015a78e5d13260361d3052d0b84c4105bcb89191a319f2249cc47b'
            '119491f0b1e903b2fd7a6d8152d3f82f70d5a294e2740b6478904d7ba92b7c22'
            '78124048bb151f09486df4767ccb3f657a2c19415e642ad1486ee3f640d9fa79'
            'f497f8a7f03c841a1ecd0e5f8903499d78bf856e7790eb83cdc570b0c423a4b1'
            'b9a6479688437370f3b74f94b0d952df3c48fc52369e27a1866352a33661f8d1')

pkgver() {
    cd $_pkgbase
    echo "0+git.$(git rev-list HEAD --count)"
}

prepare() {
    cd $_pkgbase
    patch -Np1 -i ${srcdir}/linux-5.9.patch
    patch -Np1 -i ${srcdir}/linux-5.13.patch
    patch -Np1 -i ${srcdir}/linux-5.14.patch
    patch -Np1 -i ${srcdir}/linux-5.18.1.patch
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
