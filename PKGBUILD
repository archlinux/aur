# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=430.26
pkgrel=1
pkgdesc="NVIDIA drivers for Arch's official 'linux' package (beta version)"
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
depends=('linux' "nvidia-utils-beta>=${pkgver}" 'libglvnd')
makedepends=('linux-headers')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        'FS62142.patch')
sha256sums=('a7dfb1bdd7591f42bbe501b8a9a80349415bdb51723db3cd11b08ce2e2d4679c'
            'c961006882afb691410c017c239e2c2ef61badb88f15735d37112b513ef0a99d')

_extramodules='extramodules-ARCH'

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    # fix https://bugs.archlinux.org/task/62142
    cd "$_pkg"
    patch -Np1 -i "${srcdir}/FS62142.patch"
}

build() {
    cd "${_pkg}/kernel"
    
    local _kernver
    _kernver="$(cat "/usr/lib/modules/${_extramodules}/version")"
    
    printf '%s\n' "  -> Building Nvidia module for ${_kernver}..."
    make SYSSRC="/usr/lib/modules/${_kernver}/build" module
}

package() {
    install -D -m644 "${_pkg}/kernel/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}/usr/lib/modules/${_extramodules}"
    
    find "$pkgdir" -name '*.ko' -exec gzip -n {} +
    
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
