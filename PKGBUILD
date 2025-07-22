# Maintainer: Ian Stanistreet <public+aur at nistree dot uk>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=piler-git
_pkgname="${pkgname%-git}"
pkgver=1.4.7.r18.gb6d34c5
pkgrel=1
pkgdesc="Open source email archiving solution with all the necessary features for your enterprise"
arch=('i686' 'x86_64')
url="http://www.mailpiler.org/"
license=('GPL')
depends=('tre' 'libzip' 'mariadb-libs' 'python-sphinx' 'python-mysqlclient' 'python-mysql-connector' 'manticore')
makedepends=('git' 'mariadb' 'poppler' 'catdoc' 'php' 'sysstat' 'openssl')
optdepends=('poppler: for reading attachments'
            'catdoc: for reading attachments'
            'tnef: for reading attachments'
            'unrtf: for reading attachments')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/piler/config-site.php'
        'etc/piler/manticore.conf'
        'etc/piler/piler.conf')
options=('!emptydirs')
source=('git+https://github.com/jsuto/piler.git'
        'piler-tmpfile.conf'
        'piler-user.conf')
sha256sums=('SKIP'
            '0fef02e3a716596b129a575c9a5450e24769b177abe325616ee5a9f2763c298d'
            '78e33088c1d0be9b5a04d85cdd4f593dd6c91e48b7241065e2dc7ee15d8c0a64')

pkgver() {
        cd "$srcdir/$_pkgname"
	# Cut off 'piler-' prefix in git tags
	git describe --long --tags --abbrev=7 | sed 's/^piler-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd "$srcdir/$_pkgname"
	patch -Np1 -i ../../fix-paths.patch
	patch -Np1 -i ../../fix-shebang.patch
	patch -Np1 -i ../../systemd.patch
}

build() {
        cd "$srcdir/$_pkgname"
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
        cd "$srcdir/$_pkgname"
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

        install -Dm644 -t usr/lib/systemd/system/ "$srcdir/$_pkgname"/systemd/*.service
	install -Dm644 "$srcdir"/piler-user.conf usr/lib/sysusers.d/piler.conf
	install -Dm644 "$srcdir"/piler-tmpfile.conf usr/lib/tmpfiles.d/piler.conf
}
