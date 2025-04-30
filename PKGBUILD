# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=575.51.02
pkgrel=2
pkgdesc="NVIDIA kernel module (beta version)"
arch=('x86_64')
url='https://www.nvidia.com/'
license=('LicenseRef-Custom')
makedepends=('linux-headers' 'dkms')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}" 'NVIDIA-MODULE')
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch'
        '140-nvidia-gcc15-fix.patch')
sha256sums=('fb8f04643ec826b617aa05961bb35653bdd73d03cdb945262819aba19a6a9018'
            '2d14bfda380cdcaae3c0dd0cd0a0220a849f6c3664815b13b5b5f04aea5c27b5'
            'ddd4384b87aa1032b9cf467f90b5c49de2db2f42c9ef5a2015e3c7d8ca145e9f')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    ln -s kernel "${_pkg}/nvidia-${pkgver}"
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
    patch -d "$_pkg" -Np1 -i "${srcdir}/140-nvidia-gcc15-fix.patch"
}

build() {
    fakeroot dkms build --dkmstree "$srcdir" --sourcetree "${srcdir}/${_pkg}" -m "nvidia/${pkgver}" -k "$(</usr/src/linux/version)"
}

package() {
    depends=('linux' "nvidia-utils-beta=${pkgver}" 'libglvnd')
    
    local _kernver
    _kernver="$(</usr/src/linux/version)"
    
    install -D -m644 "nvidia/${pkgver}/${_kernver}/${CARCH}/module"/* -t "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +
}
