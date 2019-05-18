# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Based on nvidia-beta: https://aur.archlinux.org/packages/nvidia-beta/

pkgname=nvidia-beta-all
pkgver=430.14
pkgrel=1
pkgdesc='NVIDIA drivers for all kernels on the system (beta)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom:NVIDIA')
depends=("nvidia-utils-beta>=${pkgver}" 'libgl')
makedepends=('linux-headers')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run")
sha256sums=('0f583a277b1731cb8327510b75dba9cf7adf5c781247e4f48bcc9f358253278f')

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
        
        #printf '%s\n' "  -> Applying patch(es) for kernel ${_kernel}..."
        #cd "kernel-${_kernel}"
        
        # apply patches(es) here:
        #patch -Np2 -i "${srcdir}/<patch>"
        
        #cd ..
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
