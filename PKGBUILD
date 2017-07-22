# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=mod_nss
pkgver=1.0.14
pkgrel=1
pkgdesc="SSL/TLS module for the Apache HTTP server"
arch=(i686 x86_64)
url="https://fedorahosted.org/mod_nss/"
license=(Apache)
depends=(apache apr nspr nss)
backup=(etc/httpd/conf/extra/nss.conf
        etc/httpd/alias/secmod.db
        etc/httpd/alias/cert8.db
        etc/httpd/alias/key3.db
        etc/httpd/alias/install.log)
install=mod_nss.install
# Patches are from Fedora

source=("https://releases.pagure.org/mod_nss/mod_nss-${pkgver}.tar.gz")
sha512sums=('8f3279280c019f71b926bbebdcf619bfb3a91ea23ad64193e54bae2a97eba75fe7571597e6a2e34bd702b499d100f75bf38f82f9840822fef42acaa3b205b183')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Update timestamps to avoid regeneration
    touch nss_expr_*.[chyl]
}

build() {
    cd "${pkgname}-${pkgver}"

    export APXS=/usr/bin/apxs

    autoreconf -vfi
    ./configure \
        --prefix=/usr \
        --with-apr-config \
        --enable-ecc
    make all
}

check() {
    cd "${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/etc/httpd/conf/extra/"
    install -dm755 "${pkgdir}/etc/httpd/alias/"
    install -dm755 "${pkgdir}/usr/lib/httpd/modules/"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/share/man/man8/"

    install -m644 gencert.8 "${pkgdir}/usr/share/man/man8/"
    install -m644 nss_pcache.8 "${pkgdir}/usr/share/man/man8/"
    install -m644 nss.conf "${pkgdir}/etc/httpd/conf/extra/"
    install -m755 .libs/libmodnss.so "${pkgdir}/usr/lib/httpd/modules/"
    install -m755 nss_pcache "${pkgdir}/usr/bin/"
    install -m755 gencert "${pkgdir}/usr/bin/"

    perl -pi -e "s:/usr/lib:/usr/bin:" "${pkgdir}/usr/bin/gencert"

    ln -s ../../../usr/lib/libnssckbi.so "${pkgdir}/etc/httpd/alias/"
    touch "${pkgdir}/etc/httpd/alias/secmod.db"
    touch "${pkgdir}/etc/httpd/alias/cert8.db"
    touch "${pkgdir}/etc/httpd/alias/key3.db"
    touch "${pkgdir}/etc/httpd/alias/install.log"
}
