# Maintainer: Joel Grunbaum <joel@joelg.net>
_pkgname=pappl
pkgname=$_pkgname-git
pkgver=r914.d42115a
pkgrel=1
pkgdesc="a simple C-based framework/library for developing CUPS Printer Applications"
arch=('x86_64')
url="https://www.msweet.org/pappl/"
license=('Apache' 'custom')
depends=('libcups' 'libjpeg-turbo' 'pam')
makedepends=('git')
provides=('pappl')
conflicts=('pappl')
source=('git+https://github.com/michaelrsweet/pappl.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	export DSOFLAGS=${LDFLAGS}
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install

	install -Dm755 testsuite/testpappl -t "$pkgdir/usr/bin"
	install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,NOTICE}
}
