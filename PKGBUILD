# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/

pkgname=nvidia-beta-all
pkgver=410.73
pkgrel=1
pkgdesc='NVIDIA drivers for all kernels on the system (beta)'
arch=('x86_64')
url='http://www.nvidia.com/'
license=('custom:NVIDIA')
depends=("nvidia-utils-beta>=${pkgver}" 'libgl')
makedepends=('linux-headers')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'linux-4.16.patch')
sha256sums=('7d6b6c9931f8b89404149a5fdf7a580edae0cd567cc2d4ffe3823b1af02a705d'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')

prepare() {
    local _kernel
    
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    cd "$_pkg"
    
    # create a build directory for each installed kernel
    for _kernel in $(cat /usr/lib/modules/extramodules-*/version)
    do
        cp -a kernel "kernel-${_kernel}"
        
        printf '%s\n' "  -> Applying patch(es) for kernel ${_kernel}..."
        cd "kernel-${_kernel}"
        
        # restore phys_to_dma support
        # https://bugs.archlinux.org/task/58074
        patch -Np2 -i "${srcdir}/linux-4.16.patch"
        
        cd ..
    done
}

build() {
    local _kernel
    
    for _kernel in $(cat /usr/lib/modules/extramodules-*/version)
    do
        cd "${srcdir}/${_pkg}/kernel-${_kernel}"
        
        printf '%s\n' "  -> Building Nvidia module for ${_kernel}..."
        make SYSSRC="/usr/lib/modules/${_kernel}/build" module
    done
}

package() {
    local _dir
    local _kernel
    
    for _dir in $(find /usr/lib/modules -maxdepth 1 -type d -name 'extramodules-*')
    do
        _kernel="$(cat "${_dir}/version")"
        
        install -D -m644 "${_pkg}/kernel-${_kernel}/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/${_dir}"
        
        gzip -n "${pkgdir}/${_dir}/"*.ko
    done
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
