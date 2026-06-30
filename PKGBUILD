# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Niklas <dev@n1klas.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_pkgname=vo-amrwbenc
pkgname=${_pkgname}-llvm
pkgver=0.1.3
pkgrel=2
pkgdesc='Library for the VisualOn Adaptive Multi Rate Wideband (AMR-WB) audio encoder — built with Clang and LLVM lld'
arch=('x86_64')
url='http://sourceforge.net/projects/opencore-amr/'
license=('APACHE')
depends=('glibc')
makedepends=('clang' 'lld' 'llvm')
provides=('vo-amrwbenc')
conflicts=('vo-amrwbenc')
source=("http://downloads.sourceforge.net/project/opencore-amr/vo-amrwbenc/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e')

build() {
    cd "${_pkgname}-${pkgver}"
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD=/usr/bin/ld.lld
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"
    ./configure --prefix='/usr'
    make
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
