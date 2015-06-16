# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Maintainer: jnbek print "<",join('', qw(j n b e k 1 9 7 2),"_AT_ geeee mail __DOT__ com",">\n";
pkgname=ttf-vista-fonts
pkgver=1
pkgrel=8
pkgdesc="Microsoft Vista True Type Fonts"
url="http://www.microsoft.com/en-us/download/confirmation.aspx?id=13"
license=('custom')
arch=('any')
depends=()
makedepends=('fontforge' 'fontconfig' 'xorg-font-utils' 'cabextract')
conflicts=('ttf-ms-extrafonts')
provides=()
replaces=('vista-fonts')
install=$pkgname.install
source=('http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe')
md5sums=('35ff8ebbea457ba426b47ff6d8377284')

package() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cabextract --lowercase "$srcdir/PowerPointViewer.exe" -d "$srcdir/$pkgname-$pkgver"
    cabextract --lowercase -F '*.tt[fc]' "$srcdir/$pkgname-$pkgver/ppviewer.cab" -d "$srcdir/$pkgname-$pkgver"

    # cambria.ttc is a TrueType Collection (TTC) which causes problems with
    # LibreOffice (Cambria Regular cannot be selected) so we need to convert
    # the TTC into a TrueType Font (TTF).
    cd "$srcdir/$pkgname-$pkgver"
    FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc"); Generate("cambria.ttf")'
    rm cambria.ttc

    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir"/$pkgname-$pkgver/*.{ttf,ttc} "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "$srcdir/$pkgname-$pkgver/eula" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
