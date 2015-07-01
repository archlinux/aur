# Maintainer: K. Hampf <khampf@users.sourceforge.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=gsdjvu
pkgver=1.7
_gsver=9.14
_fontsver=8.11
pkgrel=4
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
md5sums=('e0e278b6a99cde6634a2f5f4ee7a7eca'
         '75f2e8ab8891d052ade9b64eb4eb5294'
         '6865682b095f8c4500c54b285ff05ef6')

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
