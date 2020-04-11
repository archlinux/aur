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
pkgver=440.82
pkgrel=1
pkgdesc='NVIDIA driver sources for linux (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-utils-beta>=${pkgver}" 'libglvnd')
makedepends=('linux-headers')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-beta=${pkgver}"
          'NVIDIA-MODULE')
conflicts=('nvidia')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-beta-dkms-change-dkms-conf.patch'
        '120-nvidia-beta-dkms-linux-rt-gift.patch')
sha256sums=('89feda0c3e54c9c0d0528760bbb5cf4d8e57408fb3df2728653f3a1b73c110a9'
            'eb2bdea01f430a493a40b5fa77f762d09fd5fa450517070b4d7f429cb75e2089'
            '25e29ee166552523366278d94ba69a7895cd50321cf402a9f69598b16a9e2827')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-beta-dkms-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-beta-dkms-linux-rt-gift.patch"
}

package() {
    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
