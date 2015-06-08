# Maintainer: Sven Fischer <sven (at) leiderfischer.de>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=eibd
pkgbase=bcusdk
pkgver=0.0.5
pkgrel=7
pkgdesc="Daemon as interface to the EIB / KNX bus"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="http://www.auto.tuwien.ac.at/~mkoegler/index.php/bcusdk"
license=('GPL')
depends=('pthsem>=2.0.8' 'gcc-libs')
source=(http://www.auto.tuwien.ac.at/~mkoegler/eib/bcusdk_${pkgver}.tar.gz
        eibd.patch eibd.socket eibd.service eibd.conf 90-eibd.rules)
md5sums=('5f81bc4e6bb53564573d573e795a9a5f'
         'b9e50d68138fb74a4d0f6370a720d8fe'
         '82e079c823fa226146ba49b47c76bab7'
         '6535a482ea51ff5f8d9abf3d560fca1a'
         '815323eebff8bc442c1e653a34e6b0b4'
         '1004b9412428a50f754f26288f07f0f9')

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    patch -p1 -i ${srcdir}/eibd.patch
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --enable-onlyeibd \
        --enable-usb \
        --enable-ft12 \
        --enable-eibnetip \
        --enable-eibnetipserver \
        --enable-eibnetiptunnel

    cd "${srcdir}/${pkgbase}-${pkgver}/common"
    make

    cd "${srcdir}/${pkgbase}-${pkgver}/eibd"
    make
}

package_eibd() {
    backup=(etc/conf.d/eibd.conf)

    cd "${srcdir}"
    install -Dm644 eibd.socket eibd.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 eibd.conf -t "${pkgdir}/etc/conf.d"
    install -Dm644 90-eibd.rules -t "${pkgdir}/etc/udev/rules.d"

    cd "${srcdir}/${pkgbase}-${pkgver}/common"
    make DESTDIR="${pkgdir}" install

    cd "${srcdir}/${pkgbase}-${pkgver}/eibd"
    make DESTDIR="${pkgdir}" install
}

