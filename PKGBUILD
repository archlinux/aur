pkgname=terminus-font-gq2-ll2-td1
_pkgname=terminus-font
pkgver=4.48
pkgrel=1
pkgdesc="Terminus patched with gq2, ll2, and td1."
arch=('any')
url="http://terminus-font.sourceforge.net/"
license=('custom:SIL Open Font License, Version 1.1')
makedepends=('xorg-bdftopcf' 'fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir' 'python3')
optdepends=('xorg-fonts-alias')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('terminus-font')
provides=('terminus-font')
source=("https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz"
        fix-75-yes-terminus.patch)
md5sums=('a2cb88f6cf174f3d07de93b91e115a8d'
         'dd9fe762af012c731c866ee9d29e09f0')

prepare() {

    cd "$_pkgname-$pkgver"

    chmod +x configure

    patch -p1 < "$srcdir"/fix-75-yes-terminus.patch

    patch < alt/gq2.diff
    patch < alt/ll2.diff
    patch < alt/td1.diff

}

build() { 

    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure --prefix=/usr --x11dir=/usr/share/fonts/misc --psfdir=/usr/share/kbd/consolefonts

    make

}

package() {

    make -C "terminus-font-$pkgver" DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/terminus-font-$pkgver/75-yes-terminus.conf" "$pkgdir/etc/fonts/conf.avail/75-yes-terminus.conf"

    install -Dm644 "$srcdir/terminus-font-$pkgver/OFL.TXT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

    install -d "$pkgdir/etc/fonts/conf.d"


    cd "$pkgdir/etc/fonts/conf.d"

    ln -s ../conf.avail/75-yes-terminus.conf .

}
