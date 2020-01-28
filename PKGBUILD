# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=440.44
pkgrel=2
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
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/010-nvidia-prime-kernel-5.4.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/020-nvidia-kernel-5.5.patch"
}

build() {
    printf '%s\n' "  -> Building Nvidia module for $(</usr/src/linux/version)..."
    make -C "${_pkg}/kernel" SYSSRC='/usr/src/linux' module
}

package() {
    local _extradir
     _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
    
    install -D -m644 "${_pkg}/kernel/"nvidia{,-drm,-modeset,-uvm}.ko -t "${pkgdir}${_extradir}"
    find "$pkgdir" -name '*.ko' -exec gzip -n {} +
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
