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
pkgver=575.51.02
pkgrel=2
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
        '140-nvidia-gcc15-fix.patch')
sha256sums=('fb8f04643ec826b617aa05961bb35653bdd73d03cdb945262819aba19a6a9018'
            '2d14bfda380cdcaae3c0dd0cd0a0220a849f6c3664815b13b5b5f04aea5c27b5'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            'f120d0d474647edf722859615d95a0ed726a5bfd9525b211a9b803ca52efded0'
            'ddd4384b87aa1032b9cf467f90b5c49de2db2f42c9ef5a2015e3c7d8ca145e9f')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-make-modeset-fbdev-default.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/140-nvidia-gcc15-fix.patch"
}

package() {
    depends=('dkms' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
