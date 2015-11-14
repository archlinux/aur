# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=istanbul
pkgver=0.2.2
pkgrel=10
pkgdesc="Desktop Session Recorder"
arch=("i686" "x86_64")
url="https://wiki.gnome.org/Projects/Istanbul"
license=("GPL2")
depends=(gnome-python-extras gstreamer0.10-base-plugins gstreamer0.10-good-plugins
    gstreamer0.10-python python2-gconf python2-xlib)
makedepends=(intltool)
options=(!libtool)
install="$pkgname.install"
source=("http://zaheer.merali.org/$pkgname-$pkgver.tar.bz2" "$pkgname.patch")
sha256sums=('3baa2462ecf1b13d0d95cd035fe0f0fc0fcc3df8cb04a3b7f237e90e9a40acd5'
            '9ed6fc1893e34d073db7408ba94e2660d5383599ef369e01b681c40e7a48ff56')
sha512sums=('b7d5b99cb3860414f4139fd1fa887e4d58f99fc5c94f9d24d7a96f03e82ec7338d733e3ab7d8b8db6ae2c00f69aa48a099b957a23e3827c7d6505ab92bbb5c60'
            'd7e3bd2380e96583b47c46c27a8459aa37b4e6ff164d46cfe216e1ea4490bf3f115b774c2ecf5e10ead96b5ed466735fa39c966d5fe33005a874e45bd4ce1dc0')

prepare() {
    shopt -s nullglob
    cd $pkgname-$pkgver/
    sed -i 's:^#!/usr/bin/python$:&2:' bin/istanbul.in
    patch -p1 -i ../$pkgname.patch
}

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr \
        --sysconfdir=/etc  \
        --disable-schemas-install \
        --with-gconf-schema-file-dir=/usr/share/gconf/schemas
    make
}

package() {
    cd $pkgname-$pkgver/
    # fix crazy python module compiling
    cp py-compile common/py-compile-destdir
    make DESTDIR="$pkgdir" install

    install -d "$pkgdir"/usr/share/gconf/schemas
    gconf-merge-schema "$pkgdir"/usr/share/gconf/schemas/$pkgname.schemas "$pkgdir"/usr/etc/gconf/schemas/*.schemas
    rm -f "$pkgdir"/usr/etc/gconf/schemas/*.schemas
}
