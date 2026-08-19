# Maintainer: taotieren <admin@taotieren.com>

pkgname=ethercat
pkgver=1.6.11
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
    libgcc_s.so
    libstdc++.so
)
makedepends=(
    git
    systemd-libs
)
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=${pkgver}")

sha256sums=('b4d9bbf22e9b15a6a0e4d2bd324212187fd7a43ed2e17bcfbede31ebba8e383e')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -i 's|str >> (char \*) target;|{ std::string _tok; str >> _tok; ((char *) target)[_tok.copy((char *) target, _tok.size())] = 0; }|' tool/DataTypeHandler.cpp
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
    cd "${srcdir}/${pkgname}/"
    make DESTDIR="$pkgdir/" install
    mv ${pkgdir}/usr/etc ${pkgdir}/etc

}
