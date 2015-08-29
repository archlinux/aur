# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=postgresql-1c
pkgver=9.4.2
pkgrel=2
pkgdesc="Custom version of PostgreSQL 9.4 for 1C system"
arch=('i686' 'x86_64')
url="http://v8.1c.ru/overview/postgres_patches_notes.htm"
license=('Custom')
depends=('libxml2' 'libxslt' 'icu' 'openssl')
makedepends=('rpmextract' 'gcc' 'make' 'flex' 'bison')
#checkdepends=()
#optdepends=()
#provides=()
conflicts=('postgresql' 'postgresql-libs')
replaces=('postgresql' 'postgresql-libs')
source=("http://v8.1c.ru/overview/postgresql_patches/9-4-2/postgresql94-9.4.2-1.1c.src.rpm"
"postgresql.conf" "postgresql.service" "postgresql.install")
md5sums=('1b673a15fed9df8ca058bb8674dfd88a'
         '7a510b5bcd4a5acb394a5dbf4286bb41'
         '285c8d5ad993b5ec5c1383251cccf262'
         'febdfca7e698211aa1ecf529e9a3140c')
install=postgresql.install

prepare() {
	tar xfj "postgresql-9.4.2.tar.bz2"
	cd "postgresql-9.4.2"
	patch -p1 < ../1c_FULL_94-0.23
	patch -p1 < ../applock-1c-9.4.patch
	patch -p1 < ../online_analyze-9.4.patch
	patch -p1 < ../plantuner.patch
	patch -p1 < ../postgresql-1c-9.4.patch
	patch -p1 < ../postgresql-logging.patch
	patch -p1 < ../postgresql-perl-rpath.patch
	patch -p1 < ../postgresql-prefer-ncurses.patch
	patch -p1 < ../rpm-pgsql.patch
}

build() {
	cd "postgresql-9.4.2"
	./configure --disable-rpath --prefix=/usr --libdir=/usr/lib/postgresql/ --with-openssl --with-libxml --with-libxslt --enable-nls
	make all
	make -C contrib all
}

package() {
	cd "postgresql-9.4.2"
	make DESTDIR="$pkgdir/" install
	make -C contrib DESTDIR="$pkgdir/" install
	install -D -c -m 0644 "$srcdir/postgresql.conf" "$pkgdir/etc/ld.so.conf.d/postgresql.conf"
	install -D -c -m 0644 "$srcdir/postgresql.service" "$pkgdir/usr/lib/systemd/system/postgresql.service"
}
