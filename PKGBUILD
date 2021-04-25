# Maintainer: K. Hampf <khampf@users.sourceforge.net>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=gsdjvu
pkgver=1.10
_gsver=9.22
_fontsver=8.11
pkgrel=1
pkgdesc="Very efficient way of converting PostScript and PDF documents into DjVu"
arch=(i686 x86_64)
# This program mixes GPL and CPL licensed codes, so the binaries are not redistributable.
license=('custom:unredistributable')
depends=('libcups>=1.3.9-3' 'cairo' 'libpng12>=1.2.6' 'zlib>=1.2.1')
optdepends=('djvulibre') # for the djvudigital converter
url="http://djvu.sourceforge.net/gsdjvu.html"
source=("http://downloads.sourceforge.net/sourceforge/djvu/gsdjvu-${pkgver}.tar.gz" 
        "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${_gsver/./}/ghostpdl-${_gsver}.tar.gz"
        "https://downloads.sourceforge.net/gs-fonts/ghostscript-fonts-std-${_fontsver}.tar.gz")
noextract=("ghostscript-${_gsver}.tar.bz2"
	"ghostscript-fonts-std-${_fontsver}.tar.gz")
options=('!libtool' '!makeflags')
sha1sums=('0ce418b0a06c807c2010458694a09a9fbf847a0b'
          '59ac602416468dca63ddca5154cd51e5116b3481'
          '2a7198e8178b2e7dba87cb5794da515200b568f5')


prepare() {
    cd "$pkgname-$pkgver"

    mkdir -p BUILD
    ln -sf "$srcdir/ghostpdl-${_gsver}.tar.gz" BUILD
    ln -sf "$srcdir/ghostscript-fonts-std-${_fontsver}.tar.gz" BUILD
}

build() {
    cd "$pkgname-$pkgver"

    echo -e 'YES\n\n' | "$srcdir/gsdjvu-$pkgver/build-gsdjvu"
}

package() {
    cd "$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/lib"
    cp -a BUILD/INST/gsdjvu "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/lib/gsdjvu/gsdjvu" "$pkgdir/usr/bin/gsdjvu"
    sed -i -e 's,/usr/bin/gs,/usr/lib/gsdjvu/bin/gs,' "$pkgdir/usr/lib/gsdjvu/gsdjvu"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYING* "$pkgdir/usr/share/licenses/$pkgname"
}
