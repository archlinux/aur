# Maintainer: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
pkgname=rtklib
pkgver=2.4.3b34
_pkgver=2.4.3-b34
_proname=RTKLIB-$_pkgver
pkgrel=2
pkgdesc="An Open Source Program Package for GNSS Positioning"
arch=('x86_64')
url="http://www.rtklib.com/"
license=('BSD-2')
groups=('GNSS')
depends=('glibc')
makedepends=('gcc-fortran')
source=("https://github.com/tomojitakasu/RTKLIB/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('a9ce13293ef71b028036cb98a114b9bba96bdd439a0aeebca8e9c73156e461cf')

build() {
    cd "$srcdir/${_proname}/lib/iers/gcc"
    make
    cd "$srcdir/${_proname}/app/consapp"
    make
}

package() {
    # install bin file
    install -Dm755 "$srcdir/${_proname}/app/consapp/pos2kml/gcc/pos2kml" "$pkgdir/usr/bin/pos2kml"
    install -Dm755 "$srcdir/${_proname}/app/consapp/str2str/gcc/str2str" "$pkgdir/usr/bin/str2str"
    install -Dm755 "$srcdir/${_proname}/app/consapp/rnx2rtkp/gcc/rnx2rtkp" "$pkgdir/usr/bin/rnx2rtkp"
    install -Dm755 "$srcdir/${_proname}/app/consapp/rtkrcv/gcc/rtkrcv" "$pkgdir/usr/bin/rtkrcv"
    install -Dm755 "$srcdir/${_proname}/app/consapp/convbin/gcc/convbin" "$pkgdir/usr/bin/convbin"

    # copy share file
    cd $srcdir/${_proname}/data/
    find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/${pkgname}/data/{}" \;

    mkdir -p "$pkgdir/usr/share/${pkgname}/rnx2rtkp/"
    for f in $srcdir/${_proname}/app/consapp/rnx2rtkp/gcc/*.conf;do
        install -m644 "$f" "$pkgdir/usr/share/${pkgname}/rnx2rtkp/"
    done
}
