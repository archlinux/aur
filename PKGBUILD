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
pkgver=595.58.03
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
        '130-nvidia-kernel-7.0.patch')
sha256sums=('b66c59b9bebc191b9c21bad7476da1486dd390198223a548892110bca5fb91f9'
            '0a917ea2dab04bfe2a2d92744c032f29c41b20c5884f5a4864a67d9980ffd265'
            '291bc6568e18496a4c2e732fd8616f6d536d8e9f3ab51f1959e3fc08f0de126b'
            '5cfe18380caaf82c78a9c1ae107d15f78686c836ba55bfc3a45630b40af2e20c')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/120-nvidia-linux-rt-gift.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-kernel-7.0.patch"
}

package() {
    depends=(
        'dkms'
        'libglvnd'
        "nvidia-utils-beta=${pkgver}")
    
    install -d -m755 "${pkgdir}/usr/src"
    cp -dr --no-preserve='ownership' "${_pkg}/kernel" "${pkgdir}/usr/src/nvidia-${pkgver}"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
