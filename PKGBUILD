# Maintainer: Timur Sattarov <tim.helloworld@gmail.com>
# Contributor: Benjamin Robin <dev@benjarobin.fr>
# Contributor: Taylor Hedberg <t@tmh.cc>
# Contributor: Pablo Lluch <pablo.lluch@gmail.com>

pkgname=ike
pkgver=2.2.1
pkgrel=10
pkgdesc='Shrew Soft VPN client for Linux'
arch=(i686 x86_64 aarch64)
url='http://www.shrew.net'
license=(BSD)
depends=(openssl ncurses libedit)
makedepends=(cmake)
optdepends=(openldap)
backup=(etc/iked.conf)
source=("http://www.shrew.net/download/ike/ike-$pkgver-release.tgz"
        iked.service
        openssl-1.1.0.patch
        cmake-threadlib.patch
        fix_double_free.patch
        fix_file_eof.patch
        deprecating_udp_encap_espinudp_non_ike.patch
        cmake_4.patch)
md5sums=('3dac18a2da5809ccb38c50cd4a455897'
         '3cb3ff3b663805f76be1efd527ae436c'
         '57348fe9112555c0204709c1716e5fff'
         '4c823bae9e006cf7bfb11fa633a59837'
         '57f7f50b68020b5df6d54288757249c1'
         '05e75984d6e8982859339fd2a42d43a1'
         '8cd9d8abf4f270186531afe6dc55c644'
         '30de7a63d0d55cece4ea53bd6ff0471c')

prepare () {
    cd "$srcdir/ike"
    patch -p1 -i "$srcdir/openssl-1.1.0.patch"
    patch -p1 -i "$srcdir/cmake-threadlib.patch"
    patch -p1 -i "$srcdir/fix_double_free.patch"
    patch -p1 -i "$srcdir/fix_file_eof.patch"
    patch -p1 -i "$srcdir/deprecating_udp_encap_espinudp_non_ike.patch"
    patch -p1 -i "$srcdir/cmake_4.patch"
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
