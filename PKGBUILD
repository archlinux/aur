pkgname=suphp
pkgver=0.7.2
pkgrel=4
pkgdesc="A tool for executing PHP scripts with the permissions of their owners."
arch=('i686' 'x86_64')
depends=("apr-util" "apache")
url="http://www.suphp.org/"
license=('GPL')
backup=('etc/suphp/suphp.conf')
source=(http://www.suphp.org/download/$pkgname-$pkgver.tar.gz
        suphp.conf
        suphp.patch)
md5sums=('852793953eec97f4ae992e366b517e81'
         'a5a2279d41630ca2de1ee559dab00467'
         '48da8dee2f0fa24536cea825b4ead7bf')

build() {
    patch -Np1 -d "$srcdir/$pkgname-$pkgver" < suphp.patch
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -if
	./configure --prefix=/usr --sbindir=/usr/bin --with-apr=/usr/bin/apr-1-config --sysconfdir=/etc/suphp --with-apache-user=http --with-setid-mode=owner --with-min-uid=33 --with-min-gid=33
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	make DESTDIR="$pkgdir" install
	
	install -D -m644 "$srcdir/suphp.conf" "$pkgdir/etc/suphp/suphp.conf"
	install -D -m644 "$srcdir/$pkgname-$pkgver/doc/suphp.conf-example" "$pkgdir/etc/suphp/suphp.conf.example"
}
