# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee

pkgname=nvidia-beta-all
pkgver=440.64
pkgrel=2
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
        '130-nvidia-440.64-linux-5.6.patch')
sha256sums=('b0567234f6eaa841bb9f5cf965d1e93b9c7b4c87d6e5bdc3d7add924e9a55a7d'
            '4665651c2ee77f5d7d0e73f3e5032138093e7295f73852e5846a4304a41a8c6c')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    mv kernel kernel-orig
    
    # create a build directory for each installed kernel
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    for _kernel in "${_kernels[@]}"
    do
        printf '%s\n' "  -> Preparing for kernel ${_kernel}"
        cp -a kernel-orig "kernel-${_kernel}"
        patch -d "kernel-${_kernel}" -Np2 -i "${srcdir}/130-nvidia-440.64-linux-5.6.patch"
    done
}

build() {
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        cd "${srcdir}/${_pkg}/kernel-${_kernel}"
        printf '%s\n' "  -> Building Nvidia module for kernel ${_kernel}..."
        make SYSSRC="/usr/lib/modules/${_kernel}/build" module
    done
}

package() {
    local _kernel
    local -a _kerndels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        install -D -m644 "${_pkg}/kernel-${_kernel}/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/usr/lib/modules/${_kernel}/extramodules"
        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
    done
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
