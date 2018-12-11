# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil
# Based on [extra]'s nvidia: https://www.archlinux.org/packages/extra/x86_64/nvidia/

pkgname=nvidia-beta
pkgver=415.22
pkgrel=1
pkgdesc="NVIDIA drivers for Arch's official 'linux' package (beta version)"
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom:NVIDIA')
depends=('linux' "nvidia-utils-beta>=${pkgver}" 'libgl')
makedepends=('linux-headers')
provides=("nvidia=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'linux-4.16.patch')
sha256sums=('41f59dc6916aad42bce97debacd9cf44a7511e49de661138da761cebc23d13c9'
            '622ac792ec200b2239cb663c0010392118b78c9904973d82cd261165c16d6385')
_extramodules=extramodules-ARCH

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    # restore phys_to_dma support
    # https://bugs.archlinux.org/task/58074
    cd "$_pkg"
    patch -Np1 -i "${srcdir}/linux-4.16.patch"
}

build() {
    cd "${_pkg}/kernel"
    
    local _kernel
    _kernel="$(cat "/usr/lib/modules/${_extramodules}/version")"
    
    printf '%s\n' "  -> Building Nvidia module for ${_kernel}..."
    make SYSSRC="/usr/lib/modules/${_kernel}/build" module
}

package() {
    install -D -m644 "${_pkg}/kernel/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/usr/lib/modules/${_extramodules}"
    
    gzip -n "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
