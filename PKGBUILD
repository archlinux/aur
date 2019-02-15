# Maintainer: Timur Sattarov <tim.helloworld@gmail.com>
# Contributor: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Taylor Hedberg <t@tmh.cc>
# Contributor: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=ike
pkgver=2.2.1
pkgrel=5
pkgdesc='Shrew Soft VPN client for Linux'
arch=(i686 x86_64)
url='http://www.shrew.net'
license=(BSD)
depends=(openssl libedit)
makedepends=(cmake)
optdepends=(openldap)
backup=(etc/iked.conf)
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tgz" iked.service openssl-1.1.0.patch)
md5sums=('3dac18a2da5809ccb38c50cd4a455897'
         '3cb3ff3b663805f76be1efd527ae436c'
         '57348fe9112555c0204709c1716e5fff')

prepare () {
    cd "$srcdir/ike"
    patch -p1 -i "$srcdir/openssl-1.1.0.patch"
}

build () {
    cd "$srcdir/ike"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=NO -DETCDIR=/etc -DNATT=YES \
        -DMANDIR=/usr/share/man -DSBINDIR=/usr/bin
    make
}

package () {
    cd "$srcdir/ike"
    make DESTDIR="$pkgdir/" install
    install -Dm 755 $srcdir/iked.service $pkgdir/usr/lib/systemd/system/iked.service
    mv $pkgdir/etc/iked.conf{.sample,}
}
