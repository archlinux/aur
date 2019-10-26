# Maintainer: Chris Magyar <c.magyar.ec@gmail.com>

pkgname=masari
pkgver=0.3.1.2
pkgrel=1
_gitrepo=masari
_gituser=masari-project
_gitver=v0.3.1.2
pkgdesc="Masari: cryptonote currency daemon and wallet"
arch=('x86_64')
url="https://github.com/$_gituser/$_gitrepo"
license=('custom:Cryptonote')
makedepends=('boost' 'cmake' 'git' 'openssl')
depends=('boost-libs' 'libsodium' 'libunwind' 'miniupnpc'
    'openssl' 'readline' 'unbound' 'zeromq')
optdepends=('doxygen: documentation'
    'expat: XML parsing'
    'graphviz: documentation'
    'ldns: SSL toolkit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz"
    'CMakeLists.txt.patch')
md5sums=('deb1679c8f8c051242aa13e18b696ceb'
    'de1a927fa3d54babf66cb7cc3d0e2fd6')

prepare() {
	cd "$pkgname-$pkgver"
    patch -p1 -i ../CMakeLists.txt.patch
}

build() {
    cd "$pkgname-$pkgver"
    mkdir build
    cd build
    CXXFLAGS="-Wno-error=class-memaccess"
    cmake ..
    make
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 ./build/bin/masari-blockchain-blackball \
        "$pkgdir/usr/bin/masari-blockchain-blackball"
    install -Dm755 ./build/bin/masari-blockchain-export \
        "$pkgdir/usr/bin/masari-blockchain-export"
    install -Dm755 ./build/bin/masari-blockchain-import \
        "$pkgdir/usr/bin/masari-blockchain-import"
    install -Dm755 ./build/bin/masari-blockchain-usage \
        "$pkgdir/usr/bin/masari-blockchain-usage"
    install -Dm755 ./build/bin/masarid "$pkgdir/usr/bin/masarid"
    install -Dm755 ./build/bin/masari-gen-trusted-multisig \
        "$pkgdir/usr/bin/masari-gen-trusted-multisig"
    install -Dm755 ./build/bin/masari-wallet-cli \
        "$pkgdir/usr/bin/masari-wallet-cli"
    install -Dm755 ./build/bin/masari-wallet-rpc \
        "$pkgdir/usr/bin/masari-wallet-rpc"
    install -Dm644 ./utils/conf/masarid.conf "$pkgdir/etc/masarid.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
