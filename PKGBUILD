# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-340xx-lts44
_extramodules='extramodules-4.4-lts44'
pkgver=340.107
pkgrel=1
pkgdesc="NVIDIA drivers for linux-lts44, 340xx legacy branch"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux-lts44' 'linux-lts44-headers')
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        'kernel-4.4.168.patch')
sha512sums=('0de6f182d67bd322df7ae04e74c0cde6973c55bfea47a8f2503a29f8a899cd1b801ae4b52d066628df4a4f9c84e5e7547465bdc37d1b87df47af43fdab23466f'
            'ea8c5d03ea05041e726a5ecd17e27833a4b6c7d824fe87f1016a47f484d07ac77652d6545439cff9e468e336fec0c7ad618e29401fcb325f18bc6f4308bd941b')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only

    cd "${_pkg}"

    patch -Np1 < "${srcdir}/kernel-4.4.168.patch"
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    cd uvm
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package() {
    install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
      "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

    find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
