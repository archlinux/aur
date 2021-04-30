# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=nsfminer-cuda
_pkgname=nsfminer
pkgver=1.3.13
pkgrel=2
pkgdesc='No Fee Ethash miner for AMD and Nvidia'
url='https://github.com/no-fee-ethereum-mining/nsfminer'
license=('GPL3')
arch=('x86_64')
depends=('cuda' 'opencl-mesa' 'mesa' 'ethash-lib')
makedepends=('cmake')
conflicts=('ethminer-cuda' 'nsfminer-cuda-opencl')
provides=('nsfminer')
source=(https://github.com/no-fee-ethereum-mining/$_pkgname/archive/refs/tags/v$pkgver.tar.gz
        https://github.com/ethereum/cable/archive/refs/tags/v0.2.14.tar.gz)
sha256sums=('a692628346301f7c3d56d19f50a973405dc0d2142a82a132d7c3367c9505f675'
            'f7f0e042cfccb42fe9c432d85ec1ec1a7ded038f4ad23bc4bc26e6331870fbfc')

prepare() {
    rm -rf "$srcdir"/$_pkgname-$pkgver/cmake/cable
    mv "$srcdir"/cable-0.2.14 "$srcdir"/$_pkgname-$pkgver/cmake/cable
}
            
build() {
    cmake \
        -B "$_pkgname-$pkgver"/build \
        -S "$_pkgname-$pkgver" \
        -DAPICORE:BOOL='OFF' \
        -DBINKERN:BOOL='ON' \
        -DETHASHCL:BOOL='ON' \
        -DETHASHCPU:BOOL='OFF' \
        -DETHASHCUDA:BOOL='ON' \
        -DETHDBUS:BOOL='OFF' \
        -DHUNTER_ENABLED:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C "$_pkgname-$pkgver"/build
}

package() {
    make -C $_pkgname-$pkgver/build DESTDIR="$pkgdir" install
}
