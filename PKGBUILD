pkgname=tp_smapi-dkms
pkgver=0.42
pkgrel=1
pkgdesc="DKMS controlled modules for ThinkPad's SMAPI functionality"
arch=(any)
url="http://www.thinkwiki.org/wiki/Tp_smapi"
license=('GPL')
depends=('dkms')
conflicts=('tp_smapi')
provides=("tp_smapi=${pkgver%.*}")
options=(!strip)
install='tp_smapi-dkms.install'
source=("https://github.com/evgeni/tp_smapi/releases/download/tp-smapi%2F${pkgver}/tp_smapi-${pkgver}.tgz" 'dkms.conf' 'kbase.patch')
sha256sums=('7b8d9f488c3859805f1f292bf4d518cc5b32ebb69b0ebe96367d0852dd792d27'
            'e2d3db8b9bd5c53cba1d702e36814ec56ef52dd37dfe8a03f58deb83c11c8bed'
            '4bcce516a9f3c486a934cfe6e3d3c92443833f4094ec008ce25264d1a5b66097')
prepare() {
    cd tp_smapi-${pkgver}
    # patch Makefile for recent kernel module directory change
    patch -p2 < "${srcdir}"/kbase.patch
    msg2 "Patching dkms.conf"
    sed -ri 's/^(PACKAGE_VERSION=).*/\1'${pkgver}'/g' "${srcdir}"/dkms.conf
}

package() 
{
    mkdir -p "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp -a tp_smapi-${pkgver}/{*.{h,c},Makefile} "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    cp dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}
    sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}
