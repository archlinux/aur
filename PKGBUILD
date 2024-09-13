# Maintainer: Tpaefawzen <960klo@gmail.com>
pkgname=merecat-git
pkgver=r1001.1d946ed
pkgrel=1
pkgdesc="Small and made-easy HTTP/HTTPS server based on Jef Poskanzer's thttpd"
arch=(x86_64)
url="https://github.com/troglobit/merecat"
license=('custom:2BSD')
groups=()
depends=('confuse')
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
}
