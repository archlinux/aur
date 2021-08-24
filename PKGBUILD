pkgname=terminus-font-gq2-ll2-td1
_pkgname=terminus-font
pkgver=4.49.1
pkgrel=1
pkgdesc="Terminus patched with gq2, ll2, and td1."
arch=('any')
url="http://terminus-font.sourceforge.net/"
license=('GPL2' 'custom:OFL')
makedepends=('xorg-bdftopcf' 'python')
conflicts=('terminus-font')
provides=('terminus-font')
source=("https://downloads.sourceforge.net/project/$_pkgname/$_pkgname-${pkgver%.1}/$_pkgname-$pkgver.tar.gz"
        fix-75-yes-terminus.patch)
sha512sums=('2e3a99960c459a453b5879bebbebeb653f0a22060177bf75c67bbeb7d32cfe1acce9e74a88fdc42e299b6dc402e0708552487abd26e80e985c7d6059b0d445a8'
            '6cd68262e92ef227f5018c4f3ddc9dd1c95dd74ce04ad2b0c7d24562bf5f5ced3f9500116b2ac0beb0f54f7efef40441cf46db23113d8529ce6dacf2dcd4c5f5')

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
