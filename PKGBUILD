# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=sslsniff
pkgver=0.8
pkgrel=1
pkgdesc='A tool for automated MITM attacks on SSL connections'
arch=('any')
url='http://www.thoughtcrime.org/software/sslsniff/'
license=('GPL3')
depends=(log4cpp asio boost boost-libs openssl)
makedepend=(base-devel git)
conflicts=(sslsniff)
provides=(sslsniff)

source=(git://github.com/moxie0/sslsniff.git
        fix_asio.patch)
sha512sums=('SKIP'
            580280a8b4110bd194f84a817060da5281c33783e2925583617cfa7847fd276457f6a3ebd5a918f5a0682d3f9e362f0c801cb9f1b73f850e3b52e98b66e1f2ed)

prepare() {
    cd ${pkgname}
    patch -p1 < ../fix_asio.patch
}

build() {
    cd ${pkgname}
    aclocal
    autoconf
    automake --add-missing
    ./configure
    make
    g++ -ggdb -g -O2 -lpthread -lboost_thread -llog4cpp  -o sslsniff SSLConnectionManager.o Destination.o FirefoxUpdater.o Logger.o SessionCache.o SSLBridge.o HTTPSBridge.o sslsniff.o FingerprintManager.o AuthorityCertificateManager.o TargetedCertificateManager.o CertificateManager.o HttpBridge.o HttpConnectionManager.o HttpHeaders.o UpdateManager.o OCSPDenier.o FirefoxAddonUpdater.o -lssl -lboost_filesystem -lboost_system -lcrypto
}

package() {
    cd ${pkgname}
    install -Dm 755 sslsniff "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
