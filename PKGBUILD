# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jacob Bang <julemand101@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Kesara Rathnayake <kesara@kesara.lk>

pkgname=bb
pkgver=1.3rc1
pkgrel=13
pkgdesc='ASCII-art demo that uses AAlib'
arch=('x86_64' 'i686')
url='http://aa-project.sourceforge.net/bb/'
license=('GPL')
makedepends=('aalib' 'allegro')
depends=('aalib' 'glibc' 'libx11' 'ncurses' 'libmikmod' 'libxau' 'libxdmcp' 'allegro')
source=("http://ftp.debian.org/debian/pool/main/b/bb/${pkgname}_$pkgver.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/b/bb/${pkgname}_$pkgver-8.diff.gz"
        'http://downloads.sourceforge.net/sourceforge/xaos/xaos-3.5.tar.gz'
        'xaos-3.5-libpng15.patch'
        'xaos-3.5-build-fix-i686.patch')
sha256sums=('9355b9e0e73863aa473d312b40bb4b071e1d50a8f1c3db553ddf31e814e296c8'
            '918bed052b438e1b81f2f8dd960659d5ea73626254b530efe1dc8679b9b76df5'
            '471fa752154a8e4c4687797fe1241df1b3f82400b2ef4e6a603969a27cd74842'
            '177ac125fe109a8326df3326df5b50f3a416fa8b9e9703202aefaf7e50bcbe8e'
            'f17252481e9f59d8a599321a7a48d0a336702112c5f1c4cb173e592b87448475')

prepare() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    # patch bb
    patch -Np1 -i "../${pkgname}_$pkgver-8.diff"

    # patch xaos
    cd "$srcdir/xaos-3.5"
    patch -p0 -i ../xaos-3.5-libpng15.patch
    if [[ $CARCH == "i686" ]]; then
        patch -p1 -i ../xaos-3.5-build-fix-i686.patch
    fi

    # use timers.h and timers.c from xaos
    cd "$srcdir/$pkgname-$pkgver.orig"
    cp -vf "$srcdir/xaos-3.5/src/include/timers.h" .
    cp -vf "$srcdir/xaos-3.5/src/util/timers.c" .
    ln -sf "$srcdir/xaos-3.5/src/include" ..
}

build() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    autoconf
    ./configure --prefix=/usr

    # enabling allegro or using clang doesn't help, ie CC='clang -D USE_ALLEGRO'
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    make DESTDIR="$pkgdir" install
}
