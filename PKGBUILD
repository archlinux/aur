# Maintainer: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Taylor Hedberg <t@tmh.cc>
# Contributor: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=ike
pkgver=2.2.1
pkgrel=4
pkgdesc='Shrew Soft VPN client for Linux'
arch=(i686 x86_64)
url='http://www.shrew.net'
license=(BSD)
depends=(openssl-1.0 qt4 libedit)
makedepends=(cmake)
optdepends=(openldap)
backup=(etc/iked.conf)
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tgz" iked.service fix-openssl.patch)
md5sums=('3dac18a2da5809ccb38c50cd4a455897'
         '3cb3ff3b663805f76be1efd527ae436c'
         'c1f793c174db5d7f5c11c8009a967a4d')

prepare () {
    cd "$srcdir/ike"
    patch -p1 -i "$srcdir/fix-openssl.patch"
}

build () {
    cd "$srcdir/ike"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 -DMANDIR=/usr/share/man -DSBINDIR=/usr/bin
    make
}

package () {
    cd "$srcdir/ike"
    make DESTDIR="$pkgdir/" install
    install -Dm 755 $srcdir/iked.service $pkgdir/usr/lib/systemd/system/iked.service
    mv $pkgdir/etc/iked.conf{.sample,}
}
