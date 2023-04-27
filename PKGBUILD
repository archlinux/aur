# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy [dot] lecocq [at] protonmail [dot] com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgmainbranch=nvidia
pkgname=nvidia-525xx
pkgver=525.89.02
pkgrel=1
pkgdesc="NVIDIA drivers for linux"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=('linux-headers' "nvidia-dkms=$pkgver")
conflicts=('nvidia')
provides=('nvidia' 'NVIDIA-MODULE')
license=('custom')
options=('!strip')

build() {
    _kernver=$(</usr/src/linux/version)

    fakeroot dkms build --dkmstree "${srcdir}" -m nvidia/${pkgver} -k ${_kernver}
}

package() {
    depends=('linux' "nvidia-utils=${pkgver}" 'libglvnd')

    _kernver="$(</usr/src/linux/version)"

    install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/extramodules" -m644 nvidia/${pkgver}/${_kernver}/${CARCH}/module/*

    # compress each module individually
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

    install -Dm644 /usr/share/licenses/nvidia-dkms/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
