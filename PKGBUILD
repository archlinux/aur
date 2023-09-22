# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

pkgname=tbs-firmware
_pkgver=1.0
_pkgdate=2023-10-22
pkgver=${_pkgver}.${_pkgdate//-/}
pkgrel=1
pkgdesc='TBS proprietary firmware'
arch=('any')
url='http://www.tbsdtv.com'
license=('custom:firmware')
makedepends=('linux-firmware')
depends=()
source=("tbs-tuner-firmwares_v${pkgver}.tar.bz2::http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v${_pkgver}.tar.bz2")
sha256sums=('972f3e26c88c51252655f028e79abb3c53f085cfb96551f86a8a678c963e2d4e')

package() {
    # Install firmware
    mkdir -p "${pkgdir}/usr/lib/firmware"
    install -m0644 "${srcdir}"/*.fw  "${pkgdir}/usr/lib/firmware"

    # Remove firmware, that is already provided by linux-firmware
    cd "${pkgdir:?}/usr/lib/firmware" && rm -f $(basename -s .zst -a $(pacman -Qlq linux-firmware))

    echo "Compressing firmware files..."
    find "${pkgdir}/usr/lib/firmware" -type f -exec zstd -q --rm "{}" \;
}
