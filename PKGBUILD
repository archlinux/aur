# Contributor: actionless <actionless DOT loveless PLUS aur AT gmail MF com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Matt Welch <matt dot welch at gmail dot com>
# Contributor: Anish Bhatt <anish at gatech dot edu>
# Contributor: Det <nimetonmaili gmail a-dot com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Jason Melton <jason dot melton at gmail dot com>
# Contributor: Youpi <max dot flocard at gmail dot com>
# Contributor: sl1pkn07 <sl1pkn07 at gmail dot com>
# Contributor: luciferin <crdaley at gmail dot com>

# Release notes: https://docs.nvidia.com/datacenter/tesla/index.html

pkgname=nvidia-tesla-dkms
pkgver=580.65.06
pkgrel=1
pkgdesc='NVIDIA driver sources for linux (tesla version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('LicenseRef-custom')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-tesla=${pkgver}"
          'NVIDIA-MODULE')
conflicts=('nvidia' 'nvidia-dkms')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}"
source=("https://us.download.nvidia.com/tesla/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch'
        '120-nvidia-linux-rt-gift.patch'
        'gcc14.patch')
sha256sums=('04b10867af585e765cfbfdcf39ed5f4bd112375bebab0172eaa187c6aa5024ff'
            'ac0c8c4ee6b0caa71b895cf8d8535ab4cebc68ac6b9b0b9c3cf28516e0846abd'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            'd422f47158f2812caccac366a4ffd230c449b44f63eaedaef6855bca6a9dba43')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/gcc14.patch"
}

package() {
    depends=('dkms' "nvidia-utils-tesla=${pkgver}" 'libglvnd')
    
    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
