# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=450.51
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
source=("http://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '010-nvidia-kernel-5.7.patch')
sha256sums=('7e08a97f68e9d4b8fbae9811926fdfbff216fa37252aa114425bc1aa85730d22'
            '37cf072fdaee3f9f0c5a8b4d5f2dac722c7b96720fc317bc2da947bde52fb946')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/010-nvidia-kernel-5.7.patch"
}

build() {
    printf '%s\n' "  -> Building Nvidia module for kernel $(</usr/src/linux/version)..."
    make -C "${_pkg}/kernel" SYSSRC='/usr/src/linux' module
}

package() {
    local _extradir
     _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    
    install -D -m644 "${_pkg}/kernel/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}${_extradir}"
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
