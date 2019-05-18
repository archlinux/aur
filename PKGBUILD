# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil
# Based on [extra]'s nvidia: https://www.archlinux.org/packages/extra/x86_64/nvidia/

pkgname=nvidia-beta
pkgver=430.14
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
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run")
sha256sums=('0f583a277b1731cb8327510b75dba9cf7adf5c781247e4f48bcc9f358253278f')
_extramodules=extramodules-ARCH

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
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
