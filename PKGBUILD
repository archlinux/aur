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
pkgver=550.40.07
pkgrel=2
pkgdesc='NVIDIA driver sources for linux (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-beta=${pkgver}"
          'NVIDIA-MODULE')
conflicts=('nvidia' 'nvidia-dkms')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch'
        '120-nvidia-linux-rt-gift.patch'
        '130-nvidia-linux-fix.patch')
sha256sums=('6d32940a6f4b92f534b42d68aa0974a7fcd6b5c0abb4d900b43c07f2326da85a'
            '4d18fbf00ffde21d22fee704c94c041e27aab2074a95dfff25d4666a6fcba9dd'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            '59958c134261a53edb641ba3c96b13e397d1903ec3637c8be8d61141356292de')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    
    # fix incompat with Linux 6.6.15 and 6.7.3
    # from Gentoo at https://github.com/gentoo/gentoo/commit/c64caf5352e8b82edbaa2204aaf055cbcabfc8d1
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-linux-fix.patch"
}

package() {
    depends=('dkms' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    
    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
