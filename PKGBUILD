# Maintainer: Larry Hajali <larryhaja[at]gmail[dot]com>
# Contributor: nofxx <x@nofxx.com>
# Contributor: sergeantspoon <sergeant.spoon@gmail.com>

pkgname=airpwn
pkgver=1.4
pkgrel=6
pkgdesc="A generic packet injection tool for 802.11 networks."
arch=('i686' 'x86_64')
url="http://airpwn.sourceforge.net"
license=('GPL')
depends=('pcre' 'libpcap' 'openssl' 'libnet' 'python2' 'libnl1')
makedepends=('sed')
optdepends=('net-tools: to put wireless interfaces into monitor mode'
            'iw: for mac80211 monitor-mode support'
            'madwifi-utils: for madwifi monitor-mode support')
provides=('lorcon-old-svn')
options=('!libtool')
source=("http://downloads.sourceforge.net/airpwn/$pkgname-$pkgver.tgz")
md5sums=('c5538f5eadc2afa0bf3e873c4bfa2513')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Delete some directories.
    find . -type d -iname "CVS" | xargs rm -rf 

    # First we need to build lorcon
    tar -xvf lorcon-current.tgz
    cd lorcon
        # Get rid of ownership changes. fakeroot doesn't like it.
        sed -i 's|-o root||' Makefile.in

        CFLAGS="${CFLAGS}" \
        ./configure \
            --prefix=/usr \
            --libdir=/usr/lib \
            --mandir=/usr/share/man \
            --enable-static=no

        make
        make install DESTDIR="$pkgdir"
        # Don't conflict with lorcon package man page
        mv "$pkgdir"/usr/share/man/man3/lorcon.3 "$pkgdir"/usr/share/man/man3/lorcon-old.3
    cd ..

    # Fix airpwn files so we can use it with a Python version other than 2.4.
    PYVER=$(python2 -c "import sys;print sys.version[:3]")
    sed -i "s|python2.4|python${PYVER}|" conf.h configure.ac

    autoreconf -ivf

    CFLAGS="${CFLAGS}" \
    CPPFLAGS="-I${pkgdir}/usr/include" \
    LDFLAGS="-L${pkgdir}/usr/lib" \
    LIBS="-lcrypto" \
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make install DESTDIR="$pkgdir"

    install -m 0755 mac80211_prep.sh "$pkgdir/usr/sbin"
    install -m 0755 madwifing_prep.sh "$pkgdir/usr/sbin"
    install -m 0755 madwifiold_prep.sh "$pkgdir/usr/sbin"

    install -d 0755 "$pkgdir"/usr/share/$pkgname
    cp -a conf content pyscripts "$pkgdir"/usr/share/$pkgname
}
