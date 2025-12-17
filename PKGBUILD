# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Harrison <contact@htv04.com>
# Contributor: Jack Kamm <jackkamm at gmail dot com>
# Contributor: Jonathan Gruber <gruberjonathan at gmail dot com>
# Contributor: Yamakaky <yamakaky at gmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>

pkgname=mbpfan
pkgver=2.4.0
pkgrel=5
pkgdesc='A simple daemon to control fan speed on all MacBook/MacBook Pros'
arch=('x86_64' 'i686')
url='https://github.com/linux-on-mac/mbpfan'
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('glibc')
provides=('mbpfan')
conflicts=('mbpfan')
source=("$pkgname::git+https://github.com/linux-on-mac/mbpfan.git#tag=v$pkgver")
md5sums=('SKIP')
backup=('etc/mbpfan.conf')

latestver() {
	curl -s "https://api.github.com/repos/linux-on-mac/mbpfan/releases/latest" | 
	jq -r '.tag_name' | sed 's/^v//'
}

prepare(){
    cd "$srcdir/$pkgname"
    sed -i 's|\$(DESTDIR)/usr/sbin|$(DESTDIR)/usr/bin|g' 'Makefile'
    sed -i 's|\$(DESTDIR)/lib/|$(DESTDIR)/usr/lib/|g' 'Makefile'
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
