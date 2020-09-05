# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail>
# Contributor: Ng Oon-Ee

pkgname=nvidia-beta-all
pkgver=450.66
pkgrel=1
pkgdesc='NVIDIA drivers for all kernels on the system (beta version)'
arch=('x86_64')
url='https://www.nvidia.com/'
license=('custom')
makedepends=('linux' 'linux-headers' 'dkms')
provides=("nvidia=${pkgver}" "nvidia-beta=${pkgver}")
conflicts=('nvidia')
options=('!strip')
_pkg="NVIDIA-Linux-${CARCH}-${pkgver}-no-compat32"
source=("https://us.download.nvidia.com/XFree86/Linux-${CARCH}/${pkgver}/${_pkg}.run"
        '110-nvidia-change-dkms-conf.patch')
sha256sums=('82712c36bc55509c871dd0736a8e91ab7922d8b6c15d08d4e7e86a0bef90083f'
            '03faca3cdb0bb8eaf0ba4281104d20a67d2fd3908fbbcd786888acbbc316716b')

prepare() {
    # extract the source file
    [ -d "$_pkg" ] && rm -rf "$_pkg"
    printf '%s\n' "  -> Self-Extracting ${_pkg}.run..."
    sh "${_pkg}.run" --extract-only
    ln -s kernel "${_pkg}/nvidia-${pkgver}"
    
    patch -d "$_pkg" -Np1 -i "${srcdir}/110-nvidia-change-dkms-conf.patch"
}

build() {
    local _kernel
    while read -r _kernel
    do
        printf '%s\n' "  -> Building NVIDIA module for kernel ${_kernel}..."
        fakeroot dkms build --dkmstree "$srcdir" --sourcetree "${srcdir}/${_pkg}" -m "nvidia/${pkgver}" -k "$_kernel"
    done < <(find /usr/lib/modules/*/build/version -exec cat {} +)
}

package() {
    depends=("nvidia-utils-beta>=${pkgver}" 'libglvnd')
    
    local _kernel
    while read -r _kernel
    do
        install -D -m644 "nvidia/${pkgver}/${_kernel}/${CARCH}/module"/* -t "${pkgdir}/usr/lib/modules/${_kernel}/extramodules"
    done < <(find /usr/lib/modules/*/build/version -exec cat {} +)
    
    find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
    printf '%s\n' 'blacklist nouveau' | install -D -m644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/nvidia.conf"
    install -D -m644 "${_pkg}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
