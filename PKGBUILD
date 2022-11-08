# Maintainer: Timur Sattarov <tim.helloworld@gmail.com>
# Contributor: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Taylor Hedberg <t@tmh.cc>
# Contributor: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=ike
pkgver=2.2.1
pkgrel=7
pkgdesc='Shrew Soft VPN client for Linux'
arch=(i686 x86_64)
url='http://www.shrew.net'
license=(BSD)
depends=(openssl ncurses libedit)
makedepends=(cmake)
optdepends=(openldap)
backup=(etc/iked.conf)
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tgz" iked.service openssl-1.1.0.patch cmake-threadlib.patch)
md5sums=('3dac18a2da5809ccb38c50cd4a455897'
         '3cb3ff3b663805f76be1efd527ae436c'
         '57348fe9112555c0204709c1716e5fff'
         '4c823bae9e006cf7bfb11fa633a59837'
         )

prepare () {
    cd "$srcdir/ike"
    patch -p1 -i "$srcdir/openssl-1.1.0.patch"
    patch -p1 -i "$srcdir/cmake-threadlib.patch"
    sed -i 's/define "parser_class_name"/define parser_class_name/' ./source/iked/conf.parse.yy
}

build () {
    cd "$srcdir/ike"
    CXXFLAGS="-fpermissive" CFLAGS="-fpermissive" cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=NO -DETCDIR=/etc -DNATT=YES \
        -DMANDIR=/usr/share/man -DSBINDIR=/usr/bin
    make
}

package () {
    cd "$srcdir/ike"
    make DESTDIR="$pkgdir/" install
    install -Dm 755 $srcdir/iked.service $pkgdir/usr/lib/systemd/system/iked.service
    mv $pkgdir/etc/iked.conf{.sample,}
}
