 
# Contributor: Andrey Alekseev andrey.android7890@gmail.com

pkgbase=nvidia-450xx-dkms
pkgname=nvidia-450xx-dkms
pkgver=450.57
pkgrel=1
pkgdesc="NVIDIA driver sources for Linux, 450xx"
arch=('x86_64')
url="http://www.nvidia.com/"
depends=('dkms' "nvidia-utils=$pkgver" 'libglvnd' 'linux-headers')
conflicts=('nvidia' 'nvidia-lts')
provides=("nvidia=$pkgver")
license=('custom')
options=('!strip')
_pkg="NVIDIA-Linux-x86_64-${pkgver}"
source=(
        "http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/${_pkg}.run"
       )
sha512sums=(
            '2c57f4752239a028f04a7bdc62e363600b67c8d83b5bfeb2649b41d2f5776c56780a46ced93ee9c22f22a0d820372d2ab0bfdde5044131eafe7f5f2df489fa81'           
           )

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    cd kernel
    sed -i "s/__VERSION_STRING/${pkgver}/" dkms.conf
    sed -i 's/__JOBS/`nproc`/' dkms.conf
    sed -i 's/__DKMS_MODULES//' dkms.conf
    sed -i '$iBUILT_MODULE_NAME[0]="nvidia"\
DEST_MODULE_LOCATION[0]="/kernel/drivers/video"\
BUILT_MODULE_NAME[1]="nvidia-uvm"\
DEST_MODULE_LOCATION[1]="/kernel/drivers/video"\
BUILT_MODULE_NAME[2]="nvidia-modeset"\
DEST_MODULE_LOCATION[2]="/kernel/drivers/video"\
BUILT_MODULE_NAME[3]="nvidia-drm"\
DEST_MODULE_LOCATION[3]="/kernel/drivers/video"' dkms.conf

    
}

package() {
    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}
