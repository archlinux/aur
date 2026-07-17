# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: diomekes <goodmans at protonmail dot com>
# Contributor: mutlu_inek <mutlu_inek at <yahoo dot de>
# Contributor: jnbek
pkgname=ttf-vista-fonts
pkgver=1
pkgrel=12
pkgdesc="Microsoft Vista and Office 2007 True Type Fonts"
url="https://docs.microsoft.com/en-us/typography/fonts/font-faq"
license=('custom:microsoft')
arch=('any')
depends=()
makedepends=('fontforge' 'fontconfig' 'cabextract')
replaces=('vista-fonts')
install=$pkgname.install
source=("${pkgname}.cab::https://archive.org/download/PowerPointViewer_201801/PowerPointViewer.exe")
sha256sums=('249473568eba7a1e4f95498acba594e0f42e6581add4dead70c1dfb908a09423')

package() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cabextract --lowercase "$srcdir/${pkgname}.cab" -d "$srcdir/$pkgname-$pkgver"
    cabextract --lowercase -F '*.tt[fc]' "$srcdir/$pkgname-$pkgver/ppviewer.cab" -d "$srcdir/$pkgname-$pkgver"

    # cambria.ttc is a TrueType Collection (TTC) which causes problems with
    # LibreOffice (Cambria Regular cannot be selected) so we need to convert
    # the TTC into a TrueType Font (TTF).
    cd "$srcdir/$pkgname-$pkgver"
    FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc"); Generate("cambria.ttf")'
    FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc(Cambria Math)"); Generate("cambria-math.ttf")' 
    rm cambria.ttc

    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir"/$pkgname-$pkgver/*.{ttf,ttc} "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "$srcdir/$pkgname-$pkgver/eula" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
