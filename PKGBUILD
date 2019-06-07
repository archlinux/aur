# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=nvidia-340xx
pkgname=(nvidia-340xx nvidia-340xx-dkms)
pkgver=340.107
_extramodules=extramodules-ARCH
pkgrel=90
pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
arch=('x86_64')
url="http://www.nvidia.com/"
makedepends=("nvidia-340xx-utils=${pkgver}" 'linux' 'linux-headers')
conflicts=('nvidia')
license=('custom')
options=('!strip')
source=("http://us.download.nvidia.com/XFree86/Linux-x86_64/${pkgver}/NVIDIA-Linux-x86_64-${pkgver}-no-compat32.run"
        'kernel-4.11.patch' 'kernel-5.0.patch' 'kernel-5.1.patch')
sha512sums=('0de6f182d67bd322df7ae04e74c0cde6973c55bfea47a8f2503a29f8a899cd1b801ae4b52d066628df4a4f9c84e5e7547465bdc37d1b87df47af43fdab23466f'
            'c25d90499e1deb26129a67dd7e953be8c1e31c5770e2b8b64d03af54cf1afec1a52636e74900f8ac468692207ab8a3765a12edd581142c4d2cfd2d6e66ac7ac2'
            'ad60f9d09b6e8d5038375f9ddaab93341958f9400f40f5175857e44c7f7002d481121dc5d677703551c3cdf24069939ac6a1861920a455acf40e637f24234a56'
            '4bde7d15d68d21a8254e82cb41b07e55b3fd04054251919159dc440bf3253de76d7066e69b21c33d00d5ba61f88589b5444c2b5765c54cd1c0bcd7300971d499')

_pkg="NVIDIA-Linux-x86_64-${pkgver}-no-compat32"

prepare() {
    sh "${_pkg}.run" --extract-only
    cd "${_pkg}"
    # patches here

    patch -Np0 < "${srcdir}/kernel-4.11.patch"
    patch -Np0 < "${srcdir}/kernel-5.0.patch"
    patch -Np0 < "${srcdir}/kernel-5.1.patch"

    cp -a kernel kernel-dkms
}

build() {
    _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
    cd "${_pkg}"/kernel
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module

    cd uvm
    make SYSSRC=/usr/lib/modules/"${_kernver}/build" module
}

package_nvidia-340xx() {
    pkgdesc="NVIDIA drivers for linux, 340xx legacy branch"
    depends=('linux' "nvidia-340xx-utils=${pkgver}" 'libgl')

    install -Dt "${pkgdir}/usr/lib/modules/${_extramodules}" -m644 \
      "${srcdir}/${_pkg}/kernel"/{nvidia,uvm/nvidia-uvm}.ko

    find "${pkgdir}" -name '*.ko' -exec gzip -n {} +

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}

package_nvidia-340xx-dkms() {
    pkgdesc="NVIDIA driver sources for linux, 340xx legacy branch"
    depends=('dkms' "nvidia-340xx-utils=$pkgver" 'libgl')
    optdepends=('linux-headers: Build the module for Arch kernel'
                'linux-lts-headers: Build the module for LTS Arch kernel')
    provides=("nvidia-340xx=$pkgver")
    conflicts+=('nvidia-340xx')

    cd ${_pkg}

    install -dm 755 "${pkgdir}"/usr/src
    cp -dr --no-preserve='ownership' kernel-dkms "${pkgdir}/usr/src/nvidia-${pkgver}"
    cat "${pkgdir}"/usr/src/nvidia-${pkgver}/uvm/dkms.conf.fragment >> "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf

    echo "blacklist nouveau" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf"
}
