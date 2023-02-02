# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=haredump-git
_pkgname=haredump
pkgver=r7.6f5378e
pkgrel=1
license=("custom:WTFPL")
pkgdesc="Command line tool that dumps data as hare code."
makedepends=(
	"hare"
	"git"
)

arch=("x86_64" "aarch64")
url="https://git.sr.ht/~autumnull/haredump"
source=("${pkgname%-*}::git+https://git.sr.ht/~autumnull/haredump")

sha512sums=('SKIP')

provides=("haredump")
conflicts=("haredump")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"

	# remove '-Wl,' prefix if present, since it is only required when the
	# linker is invoked indirectly. Keeping it will cause the linker to
	# fail.
	make LDFLAGS=${LDFLAGS#"-Wl,"}
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	make PREFIX="$pkgdir/usr" install
}

