# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=piler
pkgver=1.1.1
pkgrel=1
pkgdesc="Open source email archiving solution with all the necessary features for your enterprise"
arch=('i686' 'x86_64')
url="http://www.mailpiler.org/"
license=('GPL')
depends=('tre' 'libzip' 'libmariadbclient')
makedepends=('mariadb' 'poppler' 'catdoc' 'unrtf' 'tnef')
optdepends=('sphinx: for indexing emails'
            'poppler: for reading attachments'
            'catdoc: for reading attachments'
            'unrtf: for reading attachments'
            'tnef: for reading attachments')
options=('!emptydirs')
source=(https://bitbucket.org/jsuto/piler/downloads/$pkgname-$pkgver.tar.gz
        piler.service
        piler-user.conf
        piler-tmpfile.conf)
sha256sums=('41555e208fec4a979e7429687b980e69b88065dd020791dd6682dc16336947b7'
            'a552d39f949888d14106b64946e20d565e290d4dea93a2562f2a0644ae2a92d6'
            '78e33088c1d0be9b5a04d85cdd4f593dd6c91e48b7241065e2dc7ee15d8c0a64'
            '40fd91c33118d6104c721db5efa4ab5cc577aa8e3311648fb1c10a6d49678d3e')
backup=('etc/piler.conf')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--localstatedir=/var/lib \
		--libexecdir=/usr/share \
		--enable-starttls \
		--with-database=mysql \
		--with-piler-user=root \
		# --enable-clamd \
		# --enable-memcached \

	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make installdirs DESTDIR="$pkgdir"
	make install DESTDIR="$pkgdir"

	cd "$pkgdir"
	chmod -R a-s usr/bin
	chmod 644 etc/*.conf*

	install -dm755 usr/share/doc/$pkgname
	mv etc/*.dist usr/share/doc/$pkgname

	rm -rf etc/init.d

	sed -r 's#pidfile=.*#pidfile=/run/piler/piler.pid#' etc/piler.conf

	install -Dm644 "$srcdir"/piler.service usr/lib/systemd/system/piler.service
	install -Dm644 "$srcdir"/piler-user.conf usr/lib/sysusers.d/piler.conf
	install -Dm644 "$srcdir"/piler-tmpfile.conf usr/lib/tmpfiles.d/piler.conf
}
