# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: rich_o <aurua@riseup.net>

pkgname=ncmpcpp-git
pkgver=0.10.r5.g440e9a57
pkgrel=1
epoch=2
pkgdesc='An almost exact clone of ncmpc with some new features (git version)'
arch=('x86_64')
url='https://rybczak.net/ncmpcpp/'
license=('GPL-2.0-or-later')
depends=('curl' 'boost-libs' 'fftw' 'icu' 'libmpdclient' 'ncurses' 'readline' 'taglib')
makedepends=('git' 'boost')
provides=('ncmpcpp')
conflicts=('ncmpcpp')
source=('git+https://github.com/arybczak/ncmpcpp.git'
        '010-ncmpcpp-use-arch-flags.patch')
sha256sums=('SKIP'
            '1907468f83dbd733e20e5d56b633eeee58a507f0767789fd0583e55d8761d0e7')

prepare() {
    patch -d ncmpcpp -Np1 -i "${srcdir}/010-ncmpcpp-use-arch-flags.patch"
    autoreconf -fi ncmpcpp
}

pkgver() {
    git -C ncmpcpp describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd ncmpcpp
    export BOOST_LIB_SUFFIX=''
    
    # http://site.icu-project.org/download/61#TOC-Migration-Issues
    export CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
    
    ./configure \
        --prefix='/usr' \
        --enable-clock \
        --enable-outputs \
        --enable-visualizer \
        --with-fftw \
        --with-taglib
    make
    make -C extras
}

package() {
    make -C ncmpcpp DESTDIR="$pkgdir" install
    install -D -m755 ncmpcpp/extras/artist_to_albumartist -t "${pkgdir}/usr/bin"
}
