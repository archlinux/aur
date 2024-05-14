# Maintainer: Ben Song <bensongsyz@gmail.com>

pkgname=cp210x-overclock-dkms
pkgver=0.1
pkgrel=1
_pkgbase=cp210x
ker_ver="6.6.30"
pkgdesc="Kernel module for silab cp210x, with patch of cp2102 max baudrate up to 1.5 MHz"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://git.kernel.org"
license=('GPL2')
depends=('dkms' 'bc')
install=cp210x-overclock.install

source=(
        cp210x.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/usb/serial/cp210x.c?h=v${ker_ver}
        0001-extend-the-highest-baudrate-of-cp2102-to-be-1.5-MHz.patch
        dkms.conf
        Makefile
        )
sha256sums=(
        1e19c80e90b1c73a74495f14dfe79183edf644db09a2d16e7d406d2c11b252a3
        519f2bff643716b39ef1742d6360d111ec30d17289c702e4f42f50ca5d6b59b4
        ebff1ec55c7561a9e1711be07d556d4e414963c2636eed6d3eb55b5ce6776221
        85da35a9d01fb8fe9e14beae345234f304c1712f7b1d9fff8edcd02e6f9f934d
        )
prepare(){
    mkdir -p "${_pkgbase}-${pkgver}"
    install -Dm644 Makefile           "${_pkgbase}-${pkgver}/Makefile"
    install -Dm644 cp210x.c           "${_pkgbase}-${pkgver}/cp210x.c"
    install -Dm644 dkms.conf          "${_pkgbase}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${_pkgbase}-${pkgver}/dkms.conf"
    cd "${_pkgbase}-${pkgver}"
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        src="${src%.zst}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

package() {
    mkdir -p "${pkgdir}/usr/src/"
    cp -r "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/src/"
}
