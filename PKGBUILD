# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

pkgname=tbs-firmware
_pkgver=1.0
_pkgdate=2023-04-30
pkgver=${_pkgver}.${_pkgdate//-/}
pkgrel=1
pkgdesc='TBS proprietary firmware'
arch=('any')
url='http://www.tbsdtv.com'
license=('custom:firmware')
makedepends=('linux-firmware')
depends=()
source=("tbs-tuner-firmwares_v${pkgver}.tar.bz2::http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v${_pkgver}.tar.bz2")
sha256sums=('db7de61cb491d142807f54cfd99c44a4bf0450f65636182ed5b7b674f1da008d')

package() {
    # Install firmware
    mkdir -p "${pkgdir}/usr/lib/firmware"
    install -m0644 "${srcdir}"/*.fw  "${pkgdir}/usr/lib/firmware"

    # Remove firmware, that is already provided by linux-firmware
    cd "${pkgdir:?}/usr/lib/firmware" && rm -f $(basename -s .xz -a $(pacman -Qlq linux-firmware))

    echo "Compressing firmware files..."
    find "${pkgdir}/usr/lib/firmware" -type f -exec xz -C crc32 "{}" \;
}
