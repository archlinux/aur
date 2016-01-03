# Maintainer: jellysheep <max.mail@dameweb.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net>

_pkgname=librsync
pkgname=librsync-git
pkgver=2.0.0.r97.g9b9efb0
pkgrel=1
pkgdesc="A free software library that implements the rsync remote-delta algorithm (rdiff) - development version"
arch=('i686' 'x86_64' 'armv7h')
url="http://librsync.sourceforge.net/"
license=('LGPL')
depends=('popt' 'zlib' 'bzip2')
makedepends=('cmake')
provides=('librsync.so' 'librsync')
conflicts=('librsync')
source=("git://github.com/$_pkgname/$_pkgname"
        'https://github.com/librsync/librsync/pull/53.patch')
sha256sums=('SKIP'
            '12bc09630ae1703f7a56830c6c314e91716abe1b2fbc527f8ea405374acb7fb8')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch -f -p1 < "$srcdir/53.patch" || true
    mkdir build
}

build() {
    cd "$srcdir/$_pkgname/build"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
    make
}

check() {
    cd "$srcdir/$_pkgname/build"
    make -k test
}

package() {
  cd "$srcdir/$_pkgname"

  make -C build DESTDIR="$pkgdir" install

  install -Dm644 doc/rdiff.1 "$pkgdir/usr/share/man/man1/rdiff.1"
  install -Dm644 doc/librsync.3 "$pkgdir/usr/share/man/man3/librsync.3"
}

# vim:set ts=2 sw=2 et:
