_pkgname=dwm
pkgname=$_pkgname-syntax-git
pkgver=6.3.r44.37a0da8
pkgrel=1
pkgdesc="FromSyntax's personal build of dwm"
url=https://code.syntax.lol/dwm
arch=(i686 x86_64)
license=(MIT)
makedepends=(git)
depends=(freetype2 libx11 libxft)
optdepends=(
	'libxft-git: if dwm crashes when displaying emojis'
	'dmenu: program launcher'
	'st: terminal emulator')
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://code.syntax.lol/dwm/archive/refs/heads/main.zip)
sha256sums=('SKIP')

pkgver() {
	cd dwm-main
    echo "$(awk '/^VERSION =/ {print $3}' config.mk)".r"$(cat head_tag.txt)"
}

prepare() {
    ls
	cd "$_pkgname"
	echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
	echo "CFLAGS+=${CFLAGS}" >> config.mk
	echo "LDFLAGS+=${LDFLAGS}" >> config.mk
	# to use a custom config.h, place it in the package directory
	if [[ -f ${SRCDEST}/config.h ]]; then
		cp "${SRCDEST}/config.h" .
	fi
}

build() {
	cd "$_pkgname"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
