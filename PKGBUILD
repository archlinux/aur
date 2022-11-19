# Maintainer: Jack Kamm <jackkamm at gmail dot com>
# Contributor: Jonathan Gruber <gruberjonathan at gmail dot com>
# Contributor: Yamakaky <yamakaky at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

pkgname=mbpfan-git
pkgver=2.3.0.r3.g71d72cf
pkgrel=2
pkgdesc="A simple daemon to control fan speed on all MacBook/MacBook Pros"
arch=('x86_64' 'i686')
url="https://github.com/linux-on-mac/mbpfan"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('mbpfan')
source=("$pkgname"::'git+https://github.com/linux-on-mac/mbpfan.git' "create-modules-load-d.patch")
md5sums=('SKIP'
         '48fbe2ae06a9db03e9621ef39eae4ee9')
backup=('etc/mbpfan.conf')

prepare(){
    cd "$srcdir/$pkgname"
    patch --strip=1 --input=../create-modules-load-d.patch
    sed -i 's|\$(DESTDIR)/usr/sbin|$(DESTDIR)/usr/bin|g' Makefile
    sed -i 's|\$(DESTDIR)/lib/|$(DESTDIR)/usr/lib/|g' Makefile
}

pkgver(){
    cd "$srcdir/$pkgname"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="$pkgdir" make install
    install -Dm644 "mbpfan.service" "$pkgdir/usr/lib/systemd/system/mbpfan.service"
}
