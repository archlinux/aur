# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee

pkgname=nvidia-beta-all
pkgver=440.44
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
        '010-nvidia-prime-kernel-5.4.patch::https://gitlab.com/snippets/1929174/raw'
        '020-nvidia-kernel-5.5.patch::https://gitlab.com/snippets/1923197/raw')
sha256sums=('794fdfc8e65c203ae482f59df7e55050ddcf0a11af2a95eaa1a10c7d48ec7e0f'
            'bedd55074771222bad8391c66b7022a266c135ff51d478710f7dda8708c3e9aa'
            '7dcd609e85720cb812d7b41320d845931d8ea3e8529c700231372e0da66e5804')

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
    local _majver
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    for _kernel in "${_kernels[@]}"
    do
        _majver="$(printf "$_kernel" | sed -E 's/^([0-9]+\.[0-9]+).*/\1/')"
        cp -a kernel-orig kernel
        
        # current patches are for 5.4 and later only
        if [ "$(vercmp "$_majver" '5.4')" -ge '0' ]
        then
            printf '%s\n' "  -> Applying patch(es) for kernel ${_kernel}..."
            patch -Np1 -i "${srcdir}/010-nvidia-prime-kernel-5.4.patch"
            
            if [ "$(vercmp "$_majver" '5.5')" -ge '0' ]
            then
                patch -Np1 -i "${srcdir}/020-nvidia-kernel-5.5.patch"
            fi
        fi
        
        mv kernel "kernel-${_kernel}"
        cp -a .manifest ".manifest-${_kernel}"
    done
}

build() {
    local _kernel
    local -a _kernels
    mapfile -t _kernels < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    for _kernel in "${_kernels[@]}"
    do
        cd "${srcdir}/${_pkg}/kernel-${_kernel}"
        cp -a "${srcdir}/${_pkg}/.manifest-${_kernel}" "${srcdir}/${_pkg}/.manifest"
        printf '%s\n' "  -> Building Nvidia module for ${_kernel}..."
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
