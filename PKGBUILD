# Maintainer: Evert "Diamond" Prants <evert@lunasqu.ee>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: kevku <kevku@msn.com>
# Contributor: Andrew Rembrandt <andrew@rembrandt.me.uk>

_pkgname=OpenSC
pkgname=opensc-git
pkgver=0.21.0+196+g991bb8a14
pkgrel=1
pkgdesc='Tools and libraries for smart cards'
arch=('x86_64')
url='https://github.com/OpenSC/OpenSC/wiki'
license=('LGPL')
backup=('etc/opensc.conf')
makedepends=('docbook-xsl' 'git' 'bash-completion')
depends=('pcsclite' 'libltdl' 'glib2')
options=('!emptydirs')
conflicts=('opensc')
provides=('opensc')
source=("git+https://github.com/OpenSC/OpenSC.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/^opensc-//;s/-/+/g'
}

build() {
    cd "$srcdir/$_pkgname"
    _sheetdir=(/usr/share/xml/docbook/xsl-stylesheets-*)
    ./bootstrap
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-man \
        --enable-doc \
        --enable-readline \
        --enable-openssl \
        --enable-pcsc \
        --enable-zlib \
        --enable-sm \
        --with-xsl-stylesheetsdir="$_sheetdir"
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package(){
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install
    install -D -m644 etc/opensc.conf "$pkgdir/etc/opensc.conf"
}
