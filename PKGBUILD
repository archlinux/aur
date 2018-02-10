pkgname=tp_smapi-dkms
pkgver=0.42
pkgrel=3
pkgdesc="DKMS controlled modules for ThinkPad's SMAPI functionality"
arch=(any)
url="http://www.thinkwiki.org/wiki/Tp_smapi"
license=('GPL')
depends=('dkms')
conflicts=('tp_smapi')
provides=("tp_smapi=${pkgver}")
options=(!strip)
source=("https://github.com/evgeni/tp_smapi/releases/download/tp-smapi%2F${pkgver}/tp_smapi-${pkgver}.tgz"
        'https://github.com/evgeni/tp_smapi/commit/76c5120f7be4880cf2c6801f872327e4e70c449f.patch'
        'dkms.conf'
        'kbase.patch')
sha256sums=('7b8d9f488c3859805f1f292bf4d518cc5b32ebb69b0ebe96367d0852dd792d27'
            'f0a99958a49db767532c4f133453f011e56e1eb0d43b429acc4b778b366f8d4f'
            'ad75d30622f7d40ad00daa784776bb595c2ac4736fa58f492d7f0d6948e0a832'
            '4bcce516a9f3c486a934cfe6e3d3c92443833f4094ec008ce25264d1a5b66097')

prepare() {
    cd tp_smapi-${pkgver}
    # patch Makefile for recent kernel module directory change
    patch -p2 < "${srcdir}"/kbase.patch
    msg2 "Patching dkms.conf"
    sed -ri 's/^(PACKAGE_VERSION=).*/\1'${pkgver}'/g' "${srcdir}"/dkms.conf

    msg2 "Apply patch for Linux 4.15"
    patch -p1 < "${srcdir}"/76c5120f7be4880cf2c6801f872327e4e70c449f.patch
}

package() {
    mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp -a tp_smapi-${pkgver}/{*.{h,c},Makefile} "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}

    sed -e "s/@PKGNAME@/${pkgname}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

    sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}
