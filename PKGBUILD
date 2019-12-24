# Maintainer: Marcos López <feirlane@gmail.com>

pkgname=tinyfugue-git
pkgver=r78.5314fe1
pkgrel=1
pkgdesc='TinyFugue, aka "tf", is a flexible, screen-oriented MUD client, for use with any type of text MUD. Git version with support for ATCP, GMCP and telnet option 102.'
arch=('i686' 'x86_64')
url="https://github.com/ingwarsw/tinyfugue"
license=('GPL')
groups=()
depends=('ncurses' 'python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}"::'git+https://github.com/ingwarsw/tinyfugue.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	patch --forward --strip=1 --input="${srcdir}/../force_configura_to_embed_python.patch"
	patch --forward --strip=1 --input="${srcdir}/../rename_interactive_macro.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	./configure \
		--prefix=/usr \
		--enable-python \
		--enable-termcap=ncurses \
		--enable-atcp \
		--enable-gmcp \
		--enable-option102

	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share"
	install -m755 src/tf "${pkgdir}/usr/bin"
	cp -r lib/tf "${pkgdir}/usr/share/tf-lib"
}
