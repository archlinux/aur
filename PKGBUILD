# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Arthur Titeica <arthur dot titeica at gmail dot com>

pkgname=ttfautohint-git
pkgver=1.8.3.r16.g701aa67
pkgrel=4
pkgdesc='Provides automated hinting process for web fonts'
arch=(x86_64 i686)
url="http://www.freetype.org/${pkgname%-git}"
license=(GPL custom)
depends=(freetype2
         harfbuzz
         qt5-base)
makedepends=(imagemagick
             inkscape
             noto-fonts
             pandoc
             texlive-core
             xorg-xwininfo)
conflicts=("${pkgname/%-git}")
provides=("${pkgname/%-git}=$pkgver")
source=("$pkgname::git://repo.or.cz/${pkgname/-/.}"
        "gnulib-git::git+https://git.savannah.gnu.org/git/gnulib.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "$pkgname"
	git submodule init
	git config submodule.gnulib.url "$srcdir/gnulib-git"
	git submodule update
	echo "GNULIB_URL='$srcdir/gnulib-git'" > bootstrap.conf
	./bootstrap --force
}

build() {
	cd "$pkgname"
	export QMAKE='/usr/bin/qmake'
	export MOC='/usr/bin/moc'
	export UIC='/usr/bin/uic'
	export RCC='/usr/bin/rcc'
	export TTFONTS='/usr/share/fonts/noto'
	./configure \
		--prefix=/usr \
		--with-qt=/usr/lib/qt \
		--with-freetype-config="pkg-config freetype2"
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING FTL.TXT
}
