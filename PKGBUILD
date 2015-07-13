# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: kfgz <kfgz@interia.pl>

_pkgname=glib2
pkgname=$_pkgname-git
pkgver=2.43.92.46.gcc287a2
pkgrel=1
pkgdesc="Common C routines used by GTK+ 2.4 and other libs"
arch=(i686 x86_64)
url=http://git.gnome.org/browse/glib/tree/README.in
license=(GPL2)
depends=(elfutils python)
makedepends=(gtk-doc git)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
options=(!emptydirs !libtool)
source=($pkgname::git://git.gnome.org/glib
        $_pkgname.sh
        $_pkgname.csh)
sha256sums=('SKIP'
            '9456872cdedcc639fb679448d74b85b0facf81033e27157d2861b991823b5a2a'
            '8d5626ffa361304ad3696493c0ef041d0ab10c857f6ef32116b3e2878ecf89e3')
sha512sums=('SKIP'
            'dca2bc74d2013fcb24145ac794eef457aa3213c039e40a1a26ca5017694930768e7c80e334e17a56834549dff6549c781ddd91fae6c7bbb26fdd6a083ad8217a'
            'c3899eb7fa5482ce8a35fe02db90fd0f928d50aa7e4365a9529ef35a2dcd1ed86d5a24f6bc5c635ef5b2d95a0ebfebc2bb6bc90404c99f6fb7484ed2fa032c06')

pkgver() {
    cd $pkgname/
    git describe | sed 's/-/./g'
}

prepare() {
    cd $pkgname/
    touch gtk-doc.make
    sed -i '1i\EXTRA_DIST=""\nCLEANFILES=""\n' docs/reference/{gio{,/gdbus-object-manager-example},gobject,glib}/Makefile.am
}

build() {
    cd $pkgname/
    touch README
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --sysconfdir=/etc \
        --with-pcre=system \
        --disable-fam
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    for i in $_pkgname.{,c}sh; do
        install -Dm755 $i "$pkgdir"/etc/profile.d/$i
    done
    find "$pkgdir"/usr/share/bash-completion/completions/ -type f -exec chmod -x '{}' \;
    sed -i 's:^#!/usr/bin/env python$:&2:g' "$pkgdir"/usr/bin/gdbus-codegen
}
