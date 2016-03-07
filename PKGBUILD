# Maintainer: K. Hampf <khampf@users.sourceforge.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=gsdjvu
pkgver=1.9
_gsver=9.18
_fontsver=8.11
pkgrel=1
pkgdesc="Very efficient way of converting PostScript and PDF documents into DjVu"
arch=(i686 x86_64)
# This program mixes GPL and CPL licensed codes, so the binaries are not redistributable.
license=('custom:unredistributable')
depends=('libcups>=1.3.9-3' 'cairo' 'libpng12>=1.2.6' 'zlib>=1.2.1')
optdepends=('djvulibre') # for the djvudigital converter
url="http://djvu.sourceforge.net/gsdjvu.html"
source=("http://downloads.sourceforge.net/sourceforge/djvu/gsdjvu-$pkgver.tar.gz" 
	"http://downloads.ghostscript.com/public/ghostscript-${_gsver}.tar.bz2" 
	"http://downloads.sourceforge.net/ghostscript/ghostscript-fonts-std-${_fontsver}.tar.gz" )
noextract=("ghostscript-${_gsver}.tar.bz2"
	"ghostscript-fonts-std-${_fontsver}.tar.gz")
options=('!libtool' '!makeflags')
sha1sums=('f98eed58ecc161ade57a5c067277b2e9d631b2b3'
          '388fea50a38e422a4c6ff27c184491bf5ecb96e1'
          '2a7198e8178b2e7dba87cb5794da515200b568f5')

build() {
    cd "$pkgname-$pkgver"

    mkdir -p BUILD
    ln -sf "$srcdir/ghostscript-${_gsver}.tar.bz2" BUILD
    ln -sf "$srcdir/ghostscript-fonts-std-${_fontsver}.tar.gz" BUILD

    echo -e 'YES\n\n' | "$srcdir/gsdjvu-$pkgver/build-gsdjvu" || return 1
}

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/lib" || return 1
    cp -a BUILD/INST/gsdjvu "$pkgdir/usr/lib" || return 1
    install -dm755 "$pkgdir/usr/bin" || return 1
    ln -s "/usr/lib/gsdjvu/gsdjvu" "$pkgdir/usr/bin/gsdjvu" || return 1
    sed -i -e 's,/usr/bin/gs,/usr/lib/gsdjvu/bin/gs,' "$pkgdir/usr/lib/gsdjvu/gsdjvu" || return 1
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname" || return 1
    install -m644 COPYING* "$pkgdir/usr/share/licenses/$pkgname" || return 1
}
