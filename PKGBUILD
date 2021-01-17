# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=rsync-git
pkgver=3.2.3.r47.gec1d5d56
pkgrel=1
pkgdesc='A fast and versatile file copying tool for remote and local files - git checkout'
arch=('i686' 'x86_64')
url='https://rsync.samba.org/'
license=('GPL3')
depends=('acl' 'libacl.so' 'lz4' 'openssl' 'perl' 'popt' 'xxhash' 'libxxhash.so'
         'zlib' 'zstd')
makedepends=('git' 'python-commonmark')
provides=('rsync')
conflicts=('rsync')
backup=('etc/rsyncd.conf'
        'etc/xinetd.d/rsync')
source=("git+https://github.com/WayneD/rsync"
        'rsyncd.conf')
sha256sums=('SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b')

pkgver() {
	cd "$srcdir/rsync"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$srcdir/rsync"

	./configure \
		--prefix=/usr \
		--disable-debug \
		--with-included-popt=no \
		--with-included-zlib=no
	make
}

check() {
	cd "$srcdir/rsync"

	make test
}


package() {
	cd "$srcdir/rsync"

	make DESTDIR="${pkgdir}" install

	make DESTDIR="$pkgdir" install
	install -Dm0644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
	install -Dm0644 packaging/lsb/rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
	install -Dm0644 packaging/systemd/rsync.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
	install -Dm0644 packaging/systemd/rsync.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
	install -Dm0644 packaging/systemd/rsync@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
	install -Dm0755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"	
}

