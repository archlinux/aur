# Maintainer: Richard Cesar <richard.cesar@netkeepers.cz>

pkgname=flexibee-client-bin
pkgver=2022.1.0
pkgbasever=2022.1
pkgrel=1
pkgdesc="Accounting economic system for person and business usage. Client-only package."
arch=('i686' 'x86_64')
url="http://www.flexibee.eu"
license=('custom')
depends=('glibc' 'jre8-openjdk')
install=flexibee.install
source=("https://download.flexibee.eu/download/$pkgbasever/$pkgver/flexibee-client_${pkgver}_all.deb")

sha256sums=('bdd666dbee0927d90e32b2dfa906a969282a84077bd532349098c4791dded6d6')

prepare() {
    cd ${srcdir}
    mkdir $pkgname-$pkgver
    tar -vxzf data.tar.gz -C ./$pkgname-$pkgver
    sed -i 's/^# FLEXIBEE_JAVA=$/FLEXIBEE_JAVA=\/usr\/lib\/jvm\/java-8-openjdk\/jre\/bin\/java/' ./$pkgname-$pkgver/etc/default/flexibee
}

package() {

    cd ${srcdir}/$pkgname-$pkgver

    # Prepare /etc
    install -d -m 755 "${pkgdir}/etc/flexibee"
    install -d -m 755 "${pkgdir}/etc/default"
    install -m 644 ./etc/default/flexibee "${pkgdir}/etc/default/"

    # Prepare /usr/bin -> install executables
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 ./usr/bin/* "${pkgdir}/usr/bin/"

    # Install everything in /usr/share
    install -d -m 755 "${pkgdir}/usr/share"
    find ./usr/share/ -type d -exec install -d -m 755 {} "${pkgdir}/{}" \;
    find ./usr/share/ -type f -exec install -m 664 {} "${pkgdir}/{}" \;
}


