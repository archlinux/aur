# Maintainer: Lucas Canonaco <canolucas@gmail.com>

pkgname=nvidia-430xx
pkgver=430.40
pkgrel=1
pkgdesc="NVIDIA drivers for linux, 430xx legacy branch"
arch=('x86_64')
url="https://www.nvidia.com/"
makedepends=("nvidia-430xx-utils=${pkgver}" 'libglvnd' 'linux-headers' "nvidia-430xx-dkms=$pkgver")
provides=('NVIDIA-MODULE')
conflicts=('nvidia')
license=('custom')
options=('!strip')

build() {
    #cd "${_pkg}"/kernel
    #make SYSSRC=/usr/src/linux module

    _kernver=$(</usr/src/linux/version)

    fakeroot dkms build --dkmstree "${srcdir}" -m nvidia/${pkgver} -k ${_kernver}
}

package() {
    depends=('linux' "nvidia-430xx-utils=${pkgver}" 'libglvnd')

    _kernver="$(</usr/src/linux/version)"

    install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/extramodules" -m644 \
        nvidia/${pkgver}/${_kernver}/${CARCH}/module/*

    # compress each module individually
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 \
        /usr/share/licenses/nvidia-430xx-dkms/LICENSE
}

