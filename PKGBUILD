# Maintainer: aksr <aksr at t-com dot me>
pkgname=libixp-git
pkgver=r159.39bc91a
pkgrel=1
pkgdesc="Portable, simple C-language 9P client and server libary."
arch=('i686' 'x86_64')
url="https://github.com/0intro/libixp"
license=('MIT')
makedepends=('git' 'txt2tags')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
source=("$pkgname::git+$url")
md5sums=('SKIP')
options=('!strip')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/egrep/grep -E/g' Makefile util/{link,compile}
	sed -i 's/-O0/-O2/g' mk/gcc.mk
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
