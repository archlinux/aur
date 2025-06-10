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
pkgver=575.57.08
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
        '140-nvidia-linux6.15-fix.patch')
sha256sums=('d0a0f44a1e3e0ef3670be182e2a55285c46312bde6ac4991193fb03add52757b'
            'eb2faac1e5075d17df0480e5065af3147a0b86773403c07cf73c19d1854cf93f'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            'f120d0d474647edf722859615d95a0ed726a5bfd9525b211a9b803ca52efded0'
            '46f9d80a5101a3610055a1231ec39319e3c89e69fdf6dda72f96d50e484af4d8')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-make-modeset-fbdev-default.patch"
    patch -d "${_pkg}/kernel" -Np1 -i "${srcdir}/140-nvidia-linux6.15-fix.patch"
}

package() {
    depends=('dkms' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
