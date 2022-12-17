# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpad-mkfn-git
pkgver=r8.3ed3d3d
pkgrel=1
pkgdesc="Create fbpad font files."
arch=('i686' 'x86_64')
url="http://repo.or.cz/fbpad_mkfn.git"
url="http://litcave.rudi.ir/"
license=('ISC')
depends=('freetype2')
makedepends=('git')
provides=('ft2tf' 'fbpad-mkfn')
conflicts=('fbpad-mkfn')
source=("$pkgname::git+git://repo.or.cz/fbpad_mkfn.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	## gen.sh adjustments
	sed -i '4s@"/path/to/fonts"@"/usr/share/fonts/TTF" # path to fonts@g' gen.sh
	sed -i 's@./mkfn_ft@fbpad-mkfn-ft@g' gen.sh
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 mkfn_ft $pkgdir/usr/bin/fbpad-mkfn-ft
	#install -Dm755 mkfn_stb $pkgdir/usr/bin/fbpad-mkfn-stb
	install -Dm755 gen.sh $pkgdir/usr/share/doc/${pkgname%-*}/gen.sh
	install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
