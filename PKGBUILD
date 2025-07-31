# Maintainer: taotieren <admin@taotieren.com>

pkgname=ethercat
pkgver=1.6.7
pkgrel=1
pkgdesc="IgH EtherCAT Master for Linux"
arch=($CARCH)
url="https://gitlab.com/etherlab.org/ethercat"
license=('GPL-2.0-or-later OR LGPL-2.1-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    gcc-libs
    glibc
)
makedepends=(
    systemd-libs
)
backup=()
options=()
#install=${pkgname}.install
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('f6df9e6324bd689fb7ad9c4a3036e10e4779441fef0f06b1e502984c8792cf37')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's|sbindir|bindir|g' script/ethercat.service.in
    sed -i 's|sbin|bin|g' script/ethercatctl.in
    sed -i 's|sbin|bin|g' script/ifup-eoe.sh
    sed -i 's|sbin|bin|g' script/init.d/ethercat.in
    #     sed -i 's|(sbindir)|(bindir)|g' script/Makefile.am
    ./bootstrap
    ./configure --enable-kernel=no \
        --with-systemdsystemunitdir=yes \
        --prefix=/usr \
        --sbin=/usr/bin
    #  --with-linux-dir=/usr/lib/modules/$(uname -r)/build \
    make

}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    make DESTDIR="$pkgdir/" install
    mv ${pkgdir}/usr/etc ${pkgdir}/etc

}
