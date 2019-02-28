# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='extrae'
pkgdesc='Instrumentation framework to generate execution traces of the most used parallel runtimes (from BSC).'
pkgver='3.6.1'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(openmpi libunwind papi dyninst libelf libdwarf)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2"
        build-fix-dyninst-api.patch)
sha512sums=(e88435364c31e6de051965a2f23c49be8fdb2afe7542a962c23a35ced3520cfdec308823c4a28f8276ee30eab34708d7e4e7ee8f412740a37e1252d85ea8b356
            3b4ec3fc71fabb6d1f57a0ccb30cb4ccfa89ec26c062204fbd77fdd0c0f526893938ec37d6e8e6fe86892c2e05dd259f0fb84d45663475fb60084a8237e1b53d)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/build-fix-dyninst-api.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure \
        --prefix=/usr \
        --with-mpi=/usr \
        --with-mpi-libs=/usr/lib/openmpi \
        --with-mpi-headers=/usr/include/openmpi \
        --with-unwind=/usr \
        --with-unwind-headers=/usr/include \
        --with-unwind-libs=/usr/lib \
        --with-dyninst=/usr \
        --with-dyninst-headers=/usr/include \
        --with-dyninst-libs=/usr/lib \
        --with-papi=/usr \
        --with-papi-headers=/usr/include \
        --with-papi-libs=/usr/lib \
        --with-dwarf=/usr \
        --with-dwarf-headers=/usr/include \
        --with-dwarf-libs=/usr/lib \
        --with-elf=/usr \
        --with-elf-headers=/usr/include \
        --with-elf-libs=/usr/lib

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}