# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Matt Welch <matt dot welch at gmail dot com>
# Contributor: Anish Bhatt <anish at gatech dot edu>
# Contributor: Det <nimetonmaili gmail a-dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>

pkgname=nvidia-beta-dkms
pkgver=575.64.03
pkgrel=1
pkgdesc='NVIDIA kernel modules - module sources (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('LicenseRef-custom')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-beta=${pkgver}"
          'NVIDIA-MODULE')
conflicts=('nvidia' 'nvidia-dkms')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch'
        '120-nvidia-linux-rt-gift.patch'
        '130-nvidia-make-modeset-fbdev-default.patch'
        '140-nvidia-linux6.15-fix.patch')
sha256sums=('b158910ec52342db8d301d32b4e2d3e5798fb5f0b7b183ad59c71e6f89778eea'
            '52c6dc3204470b11213ba3d3674be08be222859ae26f5f2a19a7e5ee65cc666e'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            'f120d0d474647edf722859615d95a0ed726a5bfd9525b211a9b803ca52efded0'
            'd9642cf160d5ccd8afc144969fbb7686876e515be67a6e5ef89a46b74e37f347')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-make-modeset-fbdev-default.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/140-nvidia-linux6.15-fix.patch"
}

package() {
    depends=('dkms' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
