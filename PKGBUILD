# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee
# Contributor: Dan Vratil

pkgname=nvidia-beta
pkgver=530.41.03
pkgrel=1
pkgdesc="NVIDIA drivers for Arch's official 'linux' package (beta version)"
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
makedepends=('linux-headers' 'dkms')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}" 'NVIDIA-MODULE')
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("http://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch')
sha256sums=('01a129b657481c4a80930803668a3c7cb5f94a7aa218f5509d783080eb9fbf14'
            'ae623c8b4e60fa024cce4d49128dc8acab8d3508cc59599a138903f60a264b55')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    ln -s kernel "${_pkg}/nvidia-${pkgver}"
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
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
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
}
