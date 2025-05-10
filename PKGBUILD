# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-git
_pkgname=${pkgname%-*}
pkgver=0.11.r1.g243d642
pkgrel=1
pkgdesc='w3m-like browser for Gemini'
arch=('x86_64')
url='https://www.telescope-browser.org/'
license=('ISC')
depends=('libbsd' 'libgrapheme' 'libretls' 'ncurses') #'imsg-compat'
makedepends=('git')
provides=('telescope')
conflicts=('telescope')
source=("git+https://github.com/$_pkgname-browser/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkgname"
	./autogen.sh
}

build() {
	cd "$_pkgname"
	./configure --prefix='/usr' --with-libbsd #--with-libimsg
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 ChangeLog -t "$pkgdir/usr/share/doc/$_pkgname"

	# Install contrib
	cp -dpr --no-preserve=ownership contrib/ "$pkgdir/usr/share/doc/$_pkgname/"
}
