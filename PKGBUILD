# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Matt Welch <matt dot welch at gmail dot com>
# Contributor: Anish Bhatt <anish at gatech dot edu>
# Contributor: Det <nimetonmaili gmail a-dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>

pkgname=nvidia-beta-dkms
pkgver=415.25
pkgrel=1
pkgdesc='NVIDIA driver sources for linux (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-utils-beta>=${pkgver}" 'libglvnd')
makedepends=('linux-headers')
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
_srcname="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_srcname}.run"
        'linux-4.16.patch')
sha256sums=('2031f3227df1bb2bff84f5783e97b2a72ad5cf064cfa3ad68dd369ff27dc95e6'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

prepare() {
    # extract the source file
    [ -d "$_srcname" ] && rm -rf "$_srcname"
    printf '%s\n' "  -> Self-Extracting ${_srcname}.run..."
    sh "${_srcname}.run" --extract-only
    
    # restore phys_to_dma support
    # https://bugs.archlinux.org/task/58074
    cd "$_srcname"
    patch -Np1 -i "${srcdir}/linux-4.16.patch"
    
    # update dkms.conf
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

    # gift for linux-rt guys
    sed -i 's/NV_EXCLUDE_BUILD_MODULES/IGNORE_PREEMPT_RT_PRESENCE=1 NV_EXCLUDE_BUILD_MODULES/' dkms.conf
}

package() {
    cd "${_srcname}/kernel"
    
    # directories creation
    install -d "${pkgdir}/usr/lib/modprobe.d/"
    install -d "${pkgdir}/usr/src/nvidia-${pkgver}/"
    
    # install
    cp -dr --no-preserve='ownership' * "${pkgdir}/usr/src/nvidia-${pkgver}/"
    
    # blacklist nouveau driver
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    # license
    cd "${srcdir}/${_srcname}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
