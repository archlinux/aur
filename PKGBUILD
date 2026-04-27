# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=595.58.03
pkgrel=2
pkgdesc="NVIDIA kernel module (beta version)"
arch=('x86_64')
url='https://www.nvidia.com/'
license=('LicenseRef-Custom')
makedepends=(
    'dkms'
    'linux-headers')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}" 'NVIDIA-MODULE')
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch'
        '130-nvidia-kernel-7.0.patch')
sha256sums=('b66c59b9bebc191b9c21bad7476da1486dd390198223a548892110bca5fb91f9'
            '0a917ea2dab04bfe2a2d92744c032f29c41b20c5884f5a4864a67d9980ffd265'
            '5cfe18380caaf82c78a9c1ae107d15f78686c836ba55bfc3a45630b40af2e20c')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    ln -s kernel "${_pkg}/nvidia-${pkgver}"
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/130-nvidia-kernel-7.0.patch"
}

build() {
    fakeroot dkms build --dkmstree "$srcdir" --sourcetree "${srcdir}/${_pkg}" -m "nvidia/${pkgver}" -k "$(</usr/src/linux/version)"
}

package() {
    depends=(
        'libglvnd'
        'linux'
        "nvidia-utils-beta=${pkgver}")
    
    local _kernver
    _kernver="$(</usr/src/linux/version)"
    
    install -D -m644 "nvidia/${pkgver}/${_kernver}/${CARCH}/module"/* -t "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +
}
