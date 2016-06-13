# Maintainer: catwell <catwell@archlinux.us>

pkgname=mksend
pkgver=0.5.6
pkgrel=3
pkgdesc="Tool to redirect, modify and send frames from a traffic active link."
arch=(i686 x86_64)
url="https://bitbucket.org/radare/mksend"
license=(GPL)
depends=(libpcap)
makedepends=(mercurial)
source=()

_hgroot="https://bitbucket.org/radare"
_hgrepo=mksend
_hgrev="14984eb"

build() {
    cd "$srcdir"
    rm -rf "$_hgrepo"
    hg clone "$_hgroot/$_hgrepo" -r "$_hgrev"
    cd "$_hgrepo"
    chmod +x configure
    export LDFLAGS="${LDFLAGS//,--as-needed}"
    export CFLAGS="${CFLAGS} -std=gnu89"
    export CPPFLAGS=
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_hgrepo"
    install -d "$pkgdir/usr/share/mksend/db" "$pkgdir/usr/share/mksend/scripts"
    install -m0644 db/*.xml "$pkgdir/usr/share/mksend/db/"
    install -m0755 scripts/*.sh "$pkgdir/usr/share/mksend/scripts/"
    install -Ds src/mksend "$pkgdir/usr/bin/mksend"
    install -Ds pcaptool/pcaptool "$pkgdir/usr/bin/pcaptool"
    install -Dm0444 doc/man/man1/pcaptool.1 \
        "$pkgdir/usr/share/man/man1/pcaptool.1"
}
