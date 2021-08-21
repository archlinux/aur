# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=x265-hg
pkgver=3.4.r25404.e31211b2f00c
pkgrel=1
pkgdesc='Open source H.265/HEVC video encoder (mercurial version)'
arch=('x86_64')
url='https://www.videolan.org/developers/x265.html'
license=('GPL')
depends=('gcc-libs')
makedepends=('mercurial' 'cmake' 'nasm')
provides=('x265' 'libx265.so')
conflicts=('x265')
source=('hg+http://hg.videolan.org/x265')
sha256sums=('SKIP')

pkgver() {
    printf '%s.r%s.%s' "$(hg -R x265 tags | sed '/_RC/d;/tip/d' | sort -rV | awk 'NR==1 { print $1 }')" \
                       "$(hg -R x265 identify -n)" \
                       "$(hg -R x265 log -r. --template '{node|short}')"
}

build() {
    cmake -S x265/source -B build-12 \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
        -DMAIN12='ON' \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
        -Wno-dev
    make -C build-12
    
    cmake -S x265/source -B build-10 \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DHIGH_BIT_DEPTH='ON' \
        -DEXPORT_C_API='OFF' \
        -DENABLE_CLI='OFF' \
        -DENABLE_SHARED='OFF' \
        -Wno-dev
    make -C build-10
    
    cmake -S x265/source -B build \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_SHARED='ON' \
        -DENABLE_HDR10_PLUS='ON' \
        -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
        -DEXTRA_LINK_FLAGS='-L.' \
        -DLINKED_10BIT='ON' \
        -DLINKED_12BIT='ON' \
        -Wno-dev
    ln -s ../build-10/libx265.a build/libx265_main10.a
    ln -s ../build-12/libx265.a build/libx265_main12.a
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
