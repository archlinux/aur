# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=mod_nss
pkgver=1.0.11
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
source=("https://fedorahosted.org/released/mod_nss/mod_nss-${pkgver}.tar.gz"
        mod_nss-conf.patch
        mod_nss-gencert.patch)
sha512sums=('659ce74a48bf09d5ade3c1cc7f64bb3b529049f8591519000d59079485c8231a60a681718a380fa4ec9897216909f24dc6bab88d023a00dd2d6b08d997b5ef47'
            '90e6f55cf1ccc4e33062d7077b6cb3e065b31e1c9947fd2246c682994f50fff62c2c9e9424b65bae4bea5ed8e0c4d9748ddbaa23c93d4da7106b914a8aa74539'
            'bbfd2b85e1aa2daf312ca621b309fd626f8fc6e5ed5ebc2321f95351347284ba5d57bda9be646fff4ff7d9656939db779d4344de9689eaa9fd63aacb79821ead')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -p1 -i ../mod_nss-conf.patch
    patch -p1 -i ../mod_nss-gencert.patch

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
