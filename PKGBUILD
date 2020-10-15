 
# Contributor: Andrey Alekseev andrey.android7890@gmail.com

pkgbase=nvidia-450xx-dkms
pkgname=nvidia-450xx-dkms
pkgver=450.80.02
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
md5sums=(
	'c68b3500fb5ceb17a0fcebcbb143dad8'
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
