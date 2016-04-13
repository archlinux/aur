# Maintainer: Chris Andrews <christophersimonandrews [at] gmail [dot] com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Serge Victor <arch@random.re>
# Contributor: Krzysztof Wloch <wloszekk [at] gmail [dot] com>
# Contributor: Luke McCarthy <luke@iogopro.co.uk>

pkgname=fasm
pkgver=1.71.51
pkgrel=1
pkgdesc="Fast and efficient self-assembling x86 assembler for DOS, Windows and Linux operating systems"
arch=('i686' 'x86_64')
url="http://www.flatassembler.net/"
license=('custom')
source=("${pkgname}-${pkgver}.tgz::http://www.flatassembler.net/${pkgname}-${pkgver}.tgz")
sha256sums=('1852870aa87a8c0aa2144f96ff0f3c5e66234f1b68c643eb918354cfbfb3b84d')
makedepends=('gcc')

if test "$CARCH" == x86_64; then
  makedepends=('gcc-multilib' 'libtool-multilib')
  depends=('lib32-glibc')
fi

build() {
    cd "$srcdir/fasm"

    # compile fasm with itself
    ./fasm source/libc/$pkgname.asm
    gcc -m32 -L/usr/lib32 source/libc/$pkgname.o -o source/libc/$pkgname

    # tools
    local s
    for s in listing prepsrc symbols; do
        ./source/libc/$pkgname tools/libc/$s.asm $s.o
    gcc -m32 -o $s $s.o
    done

}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/elfexe/dynamic
    mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/libcdemo
    mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/elfobj
    install -m755 source/libc/$pkgname $pkgdir/usr/bin
    install -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # tools
    local s
        for s in listing prepsrc symbols; do
        install -D $s $pkgdir/usr/bin/$pkgname-$s
    done

    # docs
    cp $pkgname.txt whatsnew.txt $pkgdir/usr/share/doc/$pkgname
    cp examples/elfexe/*.asm $pkgdir/usr/share/doc/$pkgname/examples/elfexe/
    cp examples/elfexe/dynamic/*.asm $pkgdir/usr/share/doc/$pkgname/examples/elfexe/dynamic
    cp examples/elfexe/dynamic/*.inc $pkgdir/usr/share/doc/$pkgname/examples/elfexe/dynamic
    cp examples/elfobj/*.asm $pkgdir/usr/share/doc/$pkgname/examples/elfobj/
    cp examples/libcdemo/*.asm $pkgdir/usr/share/doc/$pkgname/examples/libcdemo/
    cp examples/libcdemo/*.inc $pkgdir/usr/share/doc/$pkgname/examples/libcdemo/
}
