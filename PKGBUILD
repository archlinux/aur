# Maintainer: Zanny <lordzanny at gmail dot com>

# Replace the current working directory (.) with the path to your Heretic 2 disk. 
# Requires the Loki release CD.

# High-res icon made by Exhumed of iconarchive.com and released under CC BY-NC-ND 4.0.

_cdpath="/run/media/zanny/Heretic 2 Linux1"

pkgname=heretic2
pkgver=1.06c
pkgrel=1
pkgdesc="Heretic 2 from Raven Software, Linux version by Loki. Update PKGBUILD with path to CD for the data files."
arch=('i686' 'x86_64')
url="http://www.lokigames.com/products/heretic2/"
license=('custom')
if [ "$CARCH" = 'x86_64' ]; then
    depends=('lib32-libxext' 'hicolor-icon-theme')
else
    depends=('libxext' 'hicolor-icon-theme')
fi
optdepends=('libpulse: sound support')
install=$pkgname.install
source=('https://github.com/liflg/heretic.2_1.06c-english_x86/raw/master/data/patch-1.06c.tar.xz'
        'heretic2.sh'
        'heretic2.desktop'
        'heretic2.png'
        'LICENSE')
sha256sums=('d334491d8543204d80d4d8f1b7dc78f34fe2d7920d7135daea4e68eb2823a475'
            '20ba71a754b22e32a9aaa798dd4b19d89c00abf886f9fc29227f4c1a36627691'
            'ca2ea84817ba63cc5f96f8513d476503c3d9a9341bae2d3c99fac149e1d83c54'
            '4f0fbbce4f46e901049f2052a6c44c4499dbdf3fa8075ae7b30eb836f77b3f48'
            '29936ae6adcbefa3a580ee5875213154750ef0fdde4292f663c47805cce8342d')
PKGEXT='.pkg.tar'

prepare() {
    tar -xzf "$_cdpath/data.tar.gz" -C "$srcdir"
    tar -xJf "$srcdir/patch-1.06c.tar.xz" -C "$srcdir"
}

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    rm -rf "$srcdir/base/"{art,cinematics,demos,models,spanish-1.pak}
    mv "$srcdir/"{base,heretic2,ref_glx.so,README-1.06b,README-1.06c} "$pkgdir/opt/$pkgname"

    # Copy video files from the CD so they play even without the CD available.
    for mpg in 'bumper.mpg' 'intro.mpg' 'outro.mpg'; do
        install -D -m 0644 "$_cdpath/base/video/$mpg" "$pkgdir/opt/$pkgname/base/video/$mpg"
    done

    install -D -m 0755 "$srcdir/heretic2.sh" "$pkgdir/usr/bin/$pkgname"
    install -D -m 0644 "$srcdir/heretic2.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -D -m 0644 "$srcdir/heretic2.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D -m 0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
