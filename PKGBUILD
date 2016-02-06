# Maintainer: Dan Printzell <me@vild.io>

pkgname=('dwin-git')
pkgver=r68.820e610
pkgrel=1
pkgdesc="A window manager written in D"
arch=('i686' 'x86_64')
url="https://github.com/vild/dwin"
license=("MIT")
groups=('dlang')
makedepends=('dmd' 'git' 'dub' 'libxcb')
depends=('libphobos' 'dub')
provides=('dwin')
conflicts=('dwin')

source=(
	"git+https://github.com/vild/dwin"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd $srcdir/dwin
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/dwin
	git submodule update --init --recursive
}

build() {
	cd $srcdir/dwin
	dub build --cache=local
	strip dwin
}

package() {
	cd $srcdir/dwin

	# binaries
	mkdir -p $pkgdir/usr/bin
	install -D -m755 dwin "${pkgdir}/usr/bin/dwin"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -d -m644 scripts "${pkgdir}/usr/share/dwin/scripts"
}
