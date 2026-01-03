# Maintainer: tuftedocelot <tuftedocelot@fastmail.fm>
_pkgname=mcabber
pkgname=${_pkgname}-git
pkgver=2368
pkgrel=1
pkgdesc="A small Jabber console client, includes features: SSL, PGP, MUC, UTF8, and OTR"
arch=('i686' 'x86_64')
provides=('mcabber=1.0.0')
conflicts=(mcabber mcabber-hg mcabber-lm-hg mcabber-crew-hg)
url="http://www.mcabber.com"
license=('GPL')
depends=('ncurses' 'glib2' 'openssl' 'gpgme' 'libotr' 'aspell' 'loudmouth')
makedepends=('pkgconfig' 'mercurial')
source=("git+https://github.com/McKael/${_pkgname}"
"fix-compat-glib.diff")
md5sums=('SKIP' 'a34ac665872d5d8a278c350ba5cee0dc'
)
#_hgrepo="hg"


build() {
    cd ${srcdir}

    cp -a ${srcdir}/mcabber ${srcdir}/mcabber-build || return 1
    cd ${srcdir}/mcabber-build/mcabber
    pwd
    patch -p2 -i ../../../fix-compat-glib.diff
    ./autogen.sh
    ./configure --with-libotr-inc-prefix=/usr/include/libotr --prefix=/usr --enable-hgcset \
        --mandir=/usr/share/man \
        --enable-aspell --enable-modules --enable-otr
    
    make || return 1
}

package() {
    cd ${srcdir}/mcabber-build/mcabber
    make DESTDIR=$pkgdir install || return 1
    mkdir -p $pkgdir/usr/share/mcabber/example
    msg "Copying mcabberrc.example to usr/share/mcabber/example/mcabberrc"
    cp -a $srcdir/mcabber-build/mcabber/mcabberrc.example \
  	$pkgdir/usr/share/mcabber/example/mcabberrc
    
    mkdir -p $pkgdir/usr/share/mcabber/doc
    install -D -m 0644 $srcdir/mcabber-build/mcabber/doc/HOWTO_modules.txt \
        $pkgdir/usr/share/mcabber/doc/HOWTO_modules.txt
    mkdir -p $pkgdir/usr/include/mcabber/
    install -D -m 0644 $srcdir/mcabber-build/mcabber/mcabber/*.h \
        $pkgdir/usr/include/mcabber/ ||return 1
}


