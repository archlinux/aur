# Maintainer: Ian Stanistreet <public+aur at nistree dot uk>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=piler
pkgver=1.4.7
pkgrel=1
pkgdesc="Open source email archiving solution with all the necessary features for your enterprise"
arch=('i686' 'x86_64')
url="http://www.mailpiler.org/"
license=('GPL')
depends=('tre' 'libzip' 'mariadb-libs' 'python-sphinx' 'python-mysqlclient' 'python-mysql-connector' 'manticore')
makedepends=('mariadb' 'poppler' 'catdoc' 'php' 'sysstat' 'openssl')
optdepends=('poppler: for reading attachments'
            'catdoc: for reading attachments'
            'tnef: for reading attachments'
            'unrtf: for reading attachments')
backup=('etc/piler/config-site.php'
        'etc/piler/manticore.conf'
        'etc/piler/piler.conf')
options=('!emptydirs')
source=('https://github.com/jsuto/piler/archive/refs/tags/$pkgname-$pkgver.tar.gz'
        'piler-tmpfile.conf'
        'piler-user.conf')
sha256sums=('54e831eba290376c81f580afd1449b86a1eab0ae3c87711e12f453682835f508'
            '0fef02e3a716596b129a575c9a5450e24769b177abe325616ee5a9f2763c298d'
            '78e33088c1d0be9b5a04d85cdd4f593dd6c91e48b7241065e2dc7ee15d8c0a64')

prepare() {
	cd "$srcdir"/$pkgname-$pkgname-$pkgver
	patch -Np1 -i ../../fix-paths.patch
	patch -Np1 -i ../../fix-shebang.patch
	patch -Np1 -i ../../systemd.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgname-$pkgver
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--localstatedir=/var/lib \
		--runstatedir=/run \
		--libexecdir=/usr/share \
		--with-piler-user=root \
		--enable-memcached
		# --enable-clamd \

	#Alert! It's needed to make as single thread, multithread have problems at build.
	make -j1
}

package() {
	cd "$srcdir"/$pkgname-$pkgname-$pkgver
	make installdirs DESTDIR="$pkgdir"
	make install DESTDIR="$pkgdir"

	cd "$pkgdir"
	chmod -R a-s usr/bin

	rm -rf etc/init.d

	mv etc/piler/piler.conf.dist etc/piler/piler.conf
	mv etc/piler/manticore.conf.dist etc/piler/manticore.conf
	rm etc/piler/sphinx.conf.dist
	touch etc/piler/MANTICORE
	chmod 644 etc/piler/*

	install -Dm644 -t usr/lib/systemd/system/ "$srcdir"/$pkgname-$pkgname-$pkgver/systemd/*.service
	install -Dm644 "$srcdir"/piler-user.conf usr/lib/sysusers.d/piler.conf
	install -Dm644 "$srcdir"/piler-tmpfile.conf usr/lib/tmpfiles.d/piler.conf
}
