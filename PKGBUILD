# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jacob Bang <julemand101@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Kesara Rathnayake <kesara@kesara.lk>

pkgname=bb
pkgver=1.3rc1
pkgrel=16
pkgdesc='ASCII-art demo that uses AAlib'
arch=('x86_64' 'i686')
url='http://aa-project.sourceforge.net/bb/'
license=('GPL')
makedepends=('aalib'
             'allegro')
depends=('aalib'
         'allegro'
         'glibc'
         'libx11'
         'libmikmod'
         'libxau'
         'libxdmcp'
         'ncurses'
         'xorg-fonts-encodings'
         'xorg-fonts-misc')
source=("http://ftp.debian.org/debian/pool/main/b/bb/${pkgname}_$pkgver.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/b/bb/${pkgname}_$pkgver-13.debian.tar.xz"
        'https://github.com/xaos-project/XaoS/archive/release-3.5.tar.gz'
        'xaos-3.5-libpng15.patch'
        'xaos-3.5-build-fix-i686.patch')
sha256sums=('9355b9e0e73863aa473d312b40bb4b071e1d50a8f1c3db553ddf31e814e296c8'
            'a811c5b808fdc72e70045f60523463ab459ad464057d71b876722092758d477e'
            'e5246a748e040740f754e035bafd5cae6af57202764f7bbb01dcb81e74116d76'
            '177ac125fe109a8326df3326df5b50f3a416fa8b9e9703202aefaf7e50bcbe8e'
            'f17252481e9f59d8a599321a7a48d0a336702112c5f1c4cb173e592b87448475')

prepare() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    # patch bb
    find "$srcdir/debian/patches/" -type f -maxdepth 1 -exec patch --verbose -Np1 -i {} \;

    # patch xaos
    cd "$srcdir/XaoS-release-3.5"
    patch -p0 -i ../xaos-3.5-libpng15.patch
    if [[ $CARCH == "i686" ]]; then
        patch -p1 -i ../xaos-3.5-build-fix-i686.patch
    fi

    # use timers.h and timers.c from xaos
    cd "$srcdir/$pkgname-$pkgver.orig"
    cp -vf "$srcdir/XaoS-release-3.5/src/include/timers.h" .
    cp -vf "$srcdir/XaoS-release-3.5/src/util/timers.c" .
    ln -sf "$srcdir/XaoS-release-3.5/src/include" ..
}

build() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    autoreconf -fisv
    ./configure --prefix=/usr

    # enabling allegro or using clang doesn't help, ie CC='clang -D USE_ALLEGRO'
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver.orig"

    make DESTDIR="$pkgdir" install
}
