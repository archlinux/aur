# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee

pkgname=nvidia-beta-all
pkgver=430.34
pkgrel=1
pkgdesc='NVIDIA drivers for all kernels on the system (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
depends=("nvidia-utils-beta>=${pkgver}" 'libglvnd')
makedepends=('linux' 'linux-headers')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'FS62142.patch')
sha256sums=('248ed9d3dee62eba86d0e0c7737218666aae204a0c0bb9c557b114db75edc523'
            'c961006882afb691410c017c239e2c2ef61badb88f15735d37112b513ef0a99d')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    
    # create a build directory for each installed kernel
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/extramodules-*/version -exec cat {} +)
    for _kernel in "${_kernels[@]}"
    do
        cp -a kernel "kernel-${_kernel}"
        printf '%s\n' "  -> Applying patch(es) for kernel ${_kernel}..."
        cd "kernel-${_kernel}"
        
        # fix https://bugs.archlinux.org/task/62142
        patch -Np2 -i "${srcdir}/FS62142.patch"
        
        cd ..
    done
}

build() {
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/extramodules-*/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        cd "${srcdir}/${_pkg}/kernel-${_kernel}"
        
        printf '%s\n' "  -> Building Nvidia module for ${_kernel}..."
        make SYSSRC="/usr/lib/modules/${_kernel}/build" module
    done
}

package() {
    local _dir
    local _kernel
    local -a _kerndirs
    mapfile -t -d '' _kerndirs < <(find /usr/lib/modules -maxdepth 1 -type d -name 'extramodules-*' -print0)
    
    for _dir in "${_kerndirs[@]}"
    do
        _kernel="$(cat "${_dir}/version")"
        
        install -D -m644 "${_pkg}/kernel-${_kernel}/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/${_dir}"
        
        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
    done
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
