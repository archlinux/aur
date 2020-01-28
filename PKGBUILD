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
pkgver=440.44
pkgrel=2
pkgdesc='NVIDIA driver sources for linux (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
depends=('dkms' "nvidia-utils-beta>=${pkgver}" 'libglvnd')
makedepends=('linux-headers')
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("nvidia=${pkgver}" "nvidia-dkms=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '010-nvidia-prime-kernel-5.4.patch::https://gitlab.com/snippets/1929174/raw'
        '020-nvidia-kernel-5.5.patch::https://gitlab.com/snippets/1923197/raw'
        '110-nvidia-beta-dkms-change-dkms-conf.patch'
        '120-nvidia-beta-dkms-linux-rt-gift.patch')
sha256sums=('794fdfc8e65c203ae482f59df7e55050ddcf0a11af2a95eaa1a10c7d48ec7e0f'
            'bedd55074771222bad8391c66b7022a266c135ff51d478710f7dda8708c3e9aa'
            '7dcd609e85720cb812d7b41320d845931d8ea3e8529c700231372e0da66e5804'
            'eb2bdea01f430a493a40b5fa77f762d09fd5fa450517070b4d7f429cb75e2089'
            '25e29ee166552523366278d94ba69a7895cd50321cf402a9f69598b16a9e2827')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/010-nvidia-prime-kernel-5.4.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/020-nvidia-kernel-5.5.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-beta-dkms-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-beta-dkms-linux-rt-gift.patch"
}

package() {
    mkdir -p "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
