# Maintainer : Sameed Pervaiz <greenbagels@teknik.io>
# Contributor: Kaan Genç <aur@kaangenc.me>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-grsec
pkgver=358.16
_extramodules=extramodules-4.2.7-grsec
pkgrel=2
pkgdesc="NVIDIA drivers for linux-grsec kernel"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('libgl' "nvidia-utils=${pkgver}" 'linux-grsec>=4.2' 'linux-grsec<4.3')
makedepends=('nvidia-libgl' "nvidia-utils=${pkgver}" 'linux-grsec' 'linux-grsec-headers>=4.2' 'linux-grsec-headers<4.3')
license=('custom')
install=nvidia-grsec.install
options=(!strip)
source=('nvidia-drivers-pax-usercopy.patch'
         'nvidia-drivers-pax-constify.patch'
         'nv-drm.patch')
source_i686="http://us.download.nvidia.com/XFree86/Linux-x86/${pkgver}/NVIDIA-Linux-x86-${pkgver}.run"
source_x86_64="http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
sha512sums=('6abba40f39cf92f4b25e2e8233d4ac4fd6720b4679697471e513042be156aa51d435eee53c5a71b1be078655580d9a52e364763b38827a6230fdb890bc5e1520'
            '7cdd21eb783f48564220122c38bad1a64b0b976f50a6f48411a4d3735d83c5b605bd53336dc8745077e060f0071ddc5ee692f89ae6992e01f5de66ceadf3a73e'
            '068b494da1be73cace96405c82c0816fab311bba88244a2142bd0be92d84b01e485607bc3570f4eb41509621c073b035616980c3431b71ea60ac66d08ca6f31e')
sha512sums_i686=('a5d37fb56a59b9958f6c34139250baf13a1c42ffc70f7deb19ffaac1ae6c2ce80b96649c5797d60754050d75792d14141cd5ebc8820bb73ee4aad4aa6d6c5b20')
sha512sums_x86_64=('eb1abeebbfa807c784e9019afaa3f238d2142b28467c80dcac8d5199cf1082d72ab417e39660bda076023aecb7d04d9c3c91a2d494f1513cfe82b617b17a2297')

[[ "$CARCH" = "i686" ]] && _pkg="NVIDIA-Linux-x86-${pkgver}"
[[ "$CARCH" = "x86_64" ]] && _pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here
    patch -Np1 -i "../nvidia-drivers-pax-usercopy.patch"
    patch -Np1 -i "../nvidia-drivers-pax-constify.patch"
    patch -Np1 -i "../nv-drm.patch"
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia.ko" \
        "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
    install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-modeset.ko" \
         "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-modeset.ko"

    if [[ "$CARCH" = "x86_64" ]]; then
        install -D -m644 "${srcdir}/${_pkg}/kernel/nvidia-uvm.ko" \
            "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia-uvm.ko"
    fi

    gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
    install -d -m755 "${pkgdir}/usr/lib/modprobe.d"

    echo "blacklist nouveau" >> "${pkgdir}/usr/lib/modprobe.d/nvidia-grsec.conf"
    sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${pkgname}.install"
}
