pkgname=terminus-font-gq2-ll2-td1
_pkgname=terminus-font
pkgver=4.48
pkgrel=2
pkgdesc="Terminus patched with gq2, ll2, and td1."
arch=('any')
url="http://terminus-font.sourceforge.net/"
license=('GPL2' 'custom:OFL')
makedepends=('xorg-bdftopcf' 'python')
conflicts=('terminus-font')
provides=('terminus-font')
source=("https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz"
        fix-75-yes-terminus.patch)
sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af'
            'ddd86485cf6d54e020e36f1c38c56e8b21b57c23a5d76250e15c1d16fed9caa5')

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
