# Maintainer: Sven Fischer <sven (at) leiderfischer.de>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=eibd
pkgbase=bcusdk
pkgver=0.0.5
pkgrel=9
pkgdesc="Daemon as interface to the EIB / KNX bus"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="http://www.auto.tuwien.ac.at/~mkoegler/index.php/bcusdk"
license=('GPL')
depends=('pthsem>=2.0.8' 'gcc-libs')
source=(http://www.auto.tuwien.ac.at/~mkoegler/eib/bcusdk_${pkgver}.tar.gz
        eibd.patch
        eibd.socket
        eibd.service
        eibd.conf
        eibd.sysusers
        90-eibd.rules)
md5sums=('5f81bc4e6bb53564573d573e795a9a5f'
         'b9e50d68138fb74a4d0f6370a720d8fe'
         '82e079c823fa226146ba49b47c76bab7'
         '07be2e58a2b0dd1177778a755d9db69e'
         '815323eebff8bc442c1e653a34e6b0b4'
         '3c64861e1874c8f6e7fc76dddc760da0'
         '8a40297ba18c5d2dc06889c8b72fd3b0')

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
    install -Dm644 eibd.sysusers $pkgdir/usr/lib/sysusers.d/eibd.conf
    install -Dm644 90-eibd.rules -t "${pkgdir}/etc/udev/rules.d"

    cd "${srcdir}/${pkgbase}-${pkgver}/common"
    make DESTDIR="${pkgdir}" install

    cd "${srcdir}/${pkgbase}-${pkgver}/eibd"
    make DESTDIR="${pkgdir}" install
}

