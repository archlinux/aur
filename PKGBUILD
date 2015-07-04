# Maintainer: tuftedocelot <tuftedocelot@fastmail.fm>
_pkgname=mcabber
pkgname=${_pkgname}-hg
pkgver=2088
pkgrel=4
pkgdesc="A small Jabber console client, includes features: SSL, PGP, MUC, UTF8, and OTR"
arch=('i686' 'x86_64')
provides=('mcabber=0.10.1')
conflicts=(mcabber mcabber-lm-hg mcabber-crew-hg)
url="http://www.mcabber.com"
license=('GPL')
depends=('ncurses' 'glib2' 'openssl' 'gpgme' 'libotr' 'aspell' 'loudmouth')
makedepends=('pkgconfig' 'mercurial')
source=("hg+http://${_pkgname}.com/hg/")
md5sums=('SKIP')
_hgrepo="hg"

pkgver() {
    cd "${srcdir}/${_hgrepo}"
    hg identify -n
}

build() {
    cp -a ${srcdir}/${_hgrepo}/mcabber ${srcdir}/mcabber-build || return 1
    cd ${srcdir}/mcabber-build
    
    ./autogen.sh
    ./configure --with-libotr-inc-prefix=/usr/include/libotr --prefix=/usr --enable-hgcset \
        --mandir=/usr/share/man \
        --enable-aspell --enable-modules --enable-otr
    make || return 1
}

package() {
    cd ${srcdir}/mcabber-build
    make DESTDIR=$pkgdir install || return 1
    mkdir -p $pkgdir/usr/share/mcabber/example
    msg "Copying mcabberrc.example to usr/share/mcabber/example/mcabberrc"
    cp -a $srcdir/mcabber-build/mcabberrc.example \
  	$pkgdir/usr/share/mcabber/example/mcabberrc
    
    mkdir -p $pkgdir/usr/share/mcabber/doc
    install -D -m 0644 $srcdir/$_hgrepo/mcabber/doc/HOWTO_modules.txt \
        $pkgdir/usr/share/mcabber/doc/HOWTO_modules.txt
    mkdir -p $pkgdir/usr/include/mcabber/
    install -D -m 0644 $srcdir/mcabber-build/mcabber/*.h \
        $pkgdir/usr/include/mcabber/ ||return 1
}


