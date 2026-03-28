# Maintainer: Jonathon Fernyhough <jonathon_at m2x dot dev>
# Contributor: John Trengrove
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=tccx-git
pkgver=0.9.27.r1348.gfada98b1
pkgrel=1
pkgdesc='Tiny C Compiler, cross compile support'
arch=('x86_64' 'i686')
url='https://bellard.org/tcc/'
license=('LGPL2.1')
makedepends=('texi2html' 'git')
provides=('tcc')
conflicts=('tcc')
options=('staticlibs' '!lto')
source=('git+https://repo.or.cz/tinycc.git')
md5sums=('SKIP')

pkgver() {
  cd tinycc
  git describe --tags --long | sed 's/^release_//; s/_/./g; s/-/.r/; s/-/./'
}

build() {

    cd tinycc
    # must new mob branch
    # git reset --hard f8bd136d

    # 32bit
    mkdir -p buildx32
    ./configure --prefix=/usr --cpu=i386 --extra-ldflags="-m32" --extra-cflags="-m32 -O1" --crtprefix=/usr/lib32/ --libdir=/usr/lib32
    make
    make DESTDIR="buildx32" install
    make distclean

    # 64bit
    ./configure --prefix=/usr --extra-cflags=-O1 --enable-cross --config-bcheck=yes --config-backtrace=yes
    make
}

check() {
  cd tinycc
  make -j1 test
}

package() {
    make -C tinycc DESTDIR="$pkgdir" docdir="$pkgdir"/usr/share/doc/tcc install
    rm -fr tinycc/buildx32/usr/bin
    rm -fr tinycc/buildx32/usr/include
    rm -fr tinycc/buildx32/usr/lib32/tcc/include
    rm -fr tinycc/buildx32/usr/share

    cp -r tinycc/buildx32/usr/lib32 "$pkgdir/usr/"
    mkdir -p "$pkgdir/usr/i686-linux-gnu/lib"
    cp tinycc/buildx32/usr/lib32/tcc/bt-exe.o "$pkgdir/usr/i686-linux-gnu/lib/i386-bt-exe.o"
    cp tinycc/buildx32/usr/lib32/tcc/bt-log.o "$pkgdir/usr/i686-linux-gnu/lib/i386-bt-log.o"
    cp tinycc/buildx32/usr/lib32/tcc/bcheck.o "$pkgdir/usr/i686-linux-gnu/lib/i386-bcheck.o"
    cp tinycc/buildx32/usr/lib32/tcc/runmain.o "$pkgdir/usr/i686-linux-gnu/lib/i386-runmain.o"

}

# vim:set ts=2 sw=2 et:
