# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=masari
pkgver=0.2.4.3
_gituser=masari-project
_gitrepo=masari
_gitver=v0.2.4.3
pkgrel=1
pkgdesc="Masari: cryptonote currency daemon and wallet"
arch=('x86_64' 'i686')
url="https://github.com/$_gituser/$_gitrepo"
license=('custom:Cryptonote')
makedepends=( 'boost' 'cmake' 'git' )
depends=( 'boost-libs' 'libunwind' 'miniupnpc' 'openssl' 'readline'
    'unbound' 'zeromq' )
optdepends=( 'doxygen: documentation'
    'expat: XML parsing'
    'graphviz: documentation'
    'ldns: SSL toolkit' )
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
md5sums=('5054dc3ff60b0526f9e7f1d3ba28bafd')

prepare() {
    if [ ! -d "$srcdir/$pkgname-$pkgver" ]; then
        if [ -d "$srcdir/$_gitrepo-$_gitver" ]; then
            mv "$srcdir/$_gitrepo-$_gitver" "$srcdir/$pkgname-$pkgver"
        elif [ -d "$srcdir/$pkgname-$_gitver" ]; then
            mv "$srcdir/$pkgname-$_gitver" "$srcdir/$pkgname-$pkgver"
        fi
    fi
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build && cd build
    CXXFLAGS="-Wno-error=class-memaccess"
    cmake ..
    make
}

package() {
	cd "${pkgname}-${pkgver}"
    install -Dm755 "./build/bin/masari-blockchain-blackball" \
        "${pkgdir}/usr/bin/masari-blockchain-blackball"
    install -Dm755 "./build/bin/masari-blockchain-export" \
        "${pkgdir}/usr/bin/masari-blockchain-export"
    install -Dm755 "./build/bin/masari-blockchain-import" \
        "${pkgdir}/usr/bin/masari-blockchain-import"
    install -Dm755 "./build/bin/masari-blockchain-usage" \
        "${pkgdir}/usr/bin/masari-blockchain-usage"
    install -Dm755 "./build/bin/masarid" \
        "${pkgdir}/usr/bin/masarid"
    install -Dm755 "./build/bin/masari-gen-trusted-multisig" \
        "${pkgdir}/usr/bin/masari-gen-trusted-multisig"
    install -Dm755 "./build/bin/masari-wallet-cli" \
        "${pkgdir}/usr/bin/masari-wallet-cli"
    install -Dm755 "./build/bin/masari-wallet-rpc" \
        "${pkgdir}/usr/bin/masari-wallet-rpc"
    install -Dm644 ./utils/conf/masarid.conf \
        "${pkgdir}/etc/masarid.conf"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
