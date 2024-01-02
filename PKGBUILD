<<<<<<< HEAD
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Stewart Starbuck <stewart@stewartstarbuck.co.uk>

_pkgname=merecat
pkgname=merecat-git
pkgver=20161106.53a355f
pkgrel=1
pkgdesc='Simple, small and fast HTTP server'
url='http://merecat.troglobit.com/'
license=('custom:BSD')
arch=('i686' 'x86_64')
backup=('etc/merecat.conf')
depends=('confuse')
makedepends=('git')
source=('git+https://github.com/troglobit/merecat'
        'service'
        'conf')
sha1sums=('SKIP'
          '381cd341de5a5062f9ce85323b41c61a59ef59b6'
          '54971b00300b6a3e8516ccaa55742ad7b5dca1e9')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed \
		-e '/cfg_free/d' \
		-e 's/"dir"/"directory"/g' \
		-e 's/"cfg-limit"/"cgi-limit"/g' \
		-e 's/"data-dir"/"data-directory"/g' \
		-e 's/HAVE_LIBCONFUSE/HAVE_FORK/g' \
		-i src/merecat.c
	sed \
		-e 's/<img .* alt=\\"\([^"]*\)\\">/\1/g' \
		-e 's/, icon//g' \
		-e '/<address>/d' \
		-i src/libhttpd.c
	./autogen.sh
}

build() {
	cd "${srcdir}/${_pkgname}"
	export WEBDIR=/srv/http
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install

	install -Dm644 ../conf "${pkgdir}/etc/merecat.conf"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/merecat.service"

	# Avoid conflicts with other packages
	mv "${pkgdir}"/usr/bin/htpasswd{,-merecat}
	mv "${pkgdir}"/usr/share/man/man1/htpasswd{,-merecat}.1

	rm "${pkgdir}"/usr/bin/{in.,}httpd
	rm "${pkgdir}"/usr/share/man/man8/{in.,}httpd.8

	rm -fr "${pkgdir}/srv/http"
	rm "${pkgdir}"/usr/share/man/man8/{ssi,redirect}.8
=======
# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>
pkgname=merecat-git
pkgver=r999.606774e
pkgrel=1
pkgdesc="Small and made-easy HTTP/HTTPS server based on Jef Poskanzer's thttpd"
arch=(x86_64)
url=""
license=('custom:2BSD')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname"::git+https://github.com/troglobit/merecat
	$pkgname.no-php-cgi.patch)
noextract=()
sha256sums=('SKIP'
            fa06dbec48572849d3c488b594229154179ed89667a044528ec3fdece6816f99)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	if ! type php-cgi; then
		patch -p1 -i "$srcdir/$pkgname.no-php-cgi.patch"
	fi
}

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	WEBDIR=/usr/share/merecat/www ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc 
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k check
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install

	install -dm755 "$pkgdir/usr/share/licenses/merecat"
	ln -s ../../doc/merecat/LICENSE "$pkgdir/usr/share/licenses/merecat/LICENSE"
>>>>>>> 3d20af3 (Hello.)
}
