# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Stunts <f.pinamartins@gmail.com>
# Contributor: LoneWolf <lonewolf@xs4all.nl> 

pkgname=staden
pkgver=2.0.0b10
pkgrel=1
pkgdesc="Tools for DNA sequence assembly (Gap4/5), editing and analysis (Spin)"
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('staden-io_lib' 'tklib')
optdepends=('iwidgets: gap5 prefinish' 'xz: better gap5 compression' 
'libpng: gap5 Report Mutations')
source=("http://sourceforge.net/projects/staden/files/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz")
options=('!emptydirs')
md5sums=('81ad0b840253774e41d3089fca7af688')

prepare() {
    cd "$srcdir/$pkgname-$pkgver-src/"
    sed -i 's:-DSVN_VERSION=$(SVNVERS)::' system.mk.in
    sed -i 's:/usr/local/tklib:/usr/lib/tklib0.5:g' configure
    sed -i 's:png_ptr->jmpbuf:png_jmpbuf(png_ptr):' tk_utils/tkTrace.c
    sed -i "s/gzFile\ \*gz/gzFile\ gz/" gap5/zfio.h
}

build() {
    cd "$srcdir/$pkgname-$pkgver-src/"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-src/"
    make DESTDIR="$pkgdir" install
}
