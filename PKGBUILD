# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=hashclash-git
pkgver=r46.d833657
pkgrel=1
pkgdesc="Project HashClash - MD5 & SHA-1 cryptanalysis "
arch=(x86_64)
url="https://github.com/cr-marcstevens/hashclash"
license=('MIT')
depends=(boost-libs)
makedepends=('git' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/cr-marcstevens/hashclash")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -D "$srcdir/${pkgname%-git}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/${pkgname%-git}/scripts"
	install -Dt "$pkgdir/usr/share/${pkgname%-git}/scripts" -m755 scripts/*
}
