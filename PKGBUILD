# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>
pkgname=masari
pkgver=0.2.4.0
pkgrel=1
pkgdesc="Masari: cryptonote currency daemon and wallet"
arch=('x86_64' 'i686')
url="https://github.com/masari-project/$pkgname"
license=('custom:Cryptonote')
makedepends=( 'boost' 'cmake' 'git' )
depends=( 'boost-libs' 'libunwind' 'miniupnpc' 'openssl' 'readline'
    'unbound' 'zeromq' )
optdepends=( 'doxygen: documentation'
    'expat: XML parsing'
    'graphviz: documentation'
    'ldns: SSL toolkit' )
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    'boost1.67.patch')
md5sums=('0842be0b301b068c9cb714f5ce04312c'
    '499c24532d596d4f94110a0a6e952718')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i ../boost1.67.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build && cd build
    CXXFLAGS="-Wno-error=class-memaccess"
    cmake ..
    make
}

package() {
	cd "${pkgname}-${pkgver}"
    install -Dm755 "./build/bin/masari-blockchain-export" \
        "${pkgdir}/usr/bin/masari-blockchain-export"
    install -Dm755 "./build/bin/masari-blockchain-import" \
        "${pkgdir}/usr/bin/masari-blockchain-import"
    install -Dm755 "./build/bin/masari-gen-trusted-multisig" \
        "${pkgdir}/usr/bin/masari-gen-trusted-multisig"
    install -Dm755 "./build/bin/masari-wallet-cli" \
        "${pkgdir}/usr/bin/masari-wallet-cli"
    install -Dm755 "./build/bin/masari-wallet-rpc" \
        "${pkgdir}/usr/bin/masari-wallet-rpc"
    install -Dm755 "./build/bin/masarid" \
        "${pkgdir}/usr/bin/masarid"
    install -Dm644 ./utils/conf/masarid.conf \
        "${pkgdir}/etc/masarid.conf"
    install -Dm644  LICENSE \
        "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
