# Maintainer: Jonathon Fernyhough <jonathon at+m2x+dev>
# Contributor: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: loqs
# Contributor: Dede Dindin Qudsy <xtrymind+gmail+com>
# Contributor: Ike Devolder <ike.devolder+gmail+com>

pkgname=nvidia-390xx
pkgver=390.154
pkgrel=1
pkgdesc="NVIDIA drivers for linux, 390xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-390xx-utils=${pkgver}" 'libglvnd' 'linux-headers' "nvidia-390xx-dkms=$pkgver")
provides=('NVIDIA-MODULE')
conflicts=('nvidia')
license=('custom')
options=('!strip')

build() {
    _kernver=$(</usr/src/linux/version)

    fakeroot dkms build --dkmstree "${srcdir}" -m nvidia/${pkgver} -k ${_kernver}
}

package() {
    depends=('linux' "nvidia-390xx-utils=${pkgver}" 'libglvnd')

    _kernver="$(</usr/src/linux/version)"

    install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/extramodules" -m644 nvidia/${pkgver}/${_kernver}/${CARCH}/module/*

    # compress each module individually
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

    install -Dm644 /usr/share/licenses/nvidia-390xx-dkms/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
