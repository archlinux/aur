 
# Contributor: Andrey Alekseev andrey.android7890@gmail.com

pkgbase=nvidia-440xx
pkgname=nvidia-440xx-dkms
pkgver=440.100
pkgrel=1
pkgdesc="NVIDIA driver sources for Linux, 440xx"
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
        'kernel-5.8.patch::https://gitlab.com/snippets/1986228/raw'
       )
sha512sums=(
            '274b3a8e4c801b67a3f71f11da93134bc1a16a48bc85a6bf63265c00bb3fd8caf935dd23c85c40285a162e83c146bd5e34bb0b1d74fc34e7122bfc4c3a8c81e7'
            '99a6fc7b3ad3980bfb72daed1c32966ab967dad7dfcdf6b2d6aba1607bc56f7d487693a02f6c2bd9b774fdebfa8579ca337e6dfc76842dcdd010fefa6a79f9d3'
           )

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"

    patch -p1 -i '../kernel-5.8.patch'

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

    # linux-rt
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package() {
    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel "${pkgdir}/usr/src/nvidia-${pkgver}"

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"

    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${_pkg}/LICENSE"
}
