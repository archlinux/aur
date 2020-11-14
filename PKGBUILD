# Maintainer: Kevin Puertas <kevinpr@jkanetwork.com>
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=piler
pkgver=1.3.9
pkgrel=1
pkgdesc="Open source email archiving solution with all the necessary features for your enterprise"
arch=('i686' 'x86_64')
url="http://www.mailpiler.org/"
license=('GPL')
depends=('tre' 'libzip' 'mariadb-libs' 'python-sphinx' 'unrtf' 'python-mysqlclient' 'python-mysql-connector')
makedepends=('mariadb' 'poppler' 'catdoc' 'php' 'sysstat' 'openssl')
optdepends=('poppler: for reading attachments'
            'catdoc: for reading attachments'
            'tnef: for reading attachments')
options=('!emptydirs')
source=(https://bitbucket.org/jsuto/piler/downloads/$pkgname-$pkgver.tar.gz
        piler-user.conf
        piler-tmpfile.conf)
sha256sums=('eed041507fd9b16f59002570fde34b004980be70362efdec6f90b5f05face867'
            '78e33088c1d0be9b5a04d85cdd4f593dd6c91e48b7241065e2dc7ee15d8c0a64'
            '40fd91c33118d6104c721db5efa4ab5cc577aa8e3311648fb1c10a6d49678d3e')
backup=('etc/piler/piler.conf')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--localstatedir=/var \
		--libexecdir=/usr/share \
		--with-database=mysql \
		--with-piler-user=root \
		--enable-memcached
		# --enable-clamd \

	#Alert! It's needed to make as single thread, multithread have problems at build.
	make -j1
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make installdirs DESTDIR="$pkgdir"
	make install DESTDIR="$pkgdir"

	cd "$pkgdir"
	chmod -R a-s usr/bin

	install -dm755 usr/share/doc/$pkgname
	#mv etc/*.dist usr/share/doc/$pkgname

	rm -rf etc/init.d
	cd "$pkgdir"
	cp etc/piler/piler.conf.dist etc/piler/piler.conf
	cp etc/piler/sphinx.conf.dist etc/piler/sphinx.conf
	sed -ir 's#pidfile=.*#pidfile=/run/piler/piler.pid#' etc/piler/piler.conf
	rm -rf etc/piler/piler.confr
	chmod 644 etc/piler/*

	mkdir -p usr/lib/systemd/system/
	install -Dm644 "$srcdir"/piler-$pkgver/systemd/*.service usr/lib/systemd/system/
	sed -ir 's#PIDFile=/var/run/#PIDFile=/run/#' usr/lib/systemd/system/*.service
	rm -rf usr/lib/systemd/system/*.servicer
	install -Dm644 "$srcdir"/piler-user.conf usr/lib/sysusers.d/piler.conf
	install -Dm644 "$srcdir"/piler-tmpfile.conf usr/lib/tmpfiles.d/piler.conf
}
