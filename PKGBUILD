# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2557.0f7b539e
pkgrel=1
license=("MPL2")
pkgdesc="The Hare systems programming language"
makedepends=(
	"scdoc"
	"git"
)

depends=(
	"qbe-git"
	"harec-git"
)

arch=("x86_64")
url="https://harelang.org"
source=("${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/hare"
	config.x86_64.mk)
sha512sums=('SKIP'
            '70efd406abd2b6a96fd67bec18602810a91aed0a3adac9f1fcc0d6103dacc1abe0e20d3c13c1f56d76728bb3cb8f46c448fc580110a85f761e4a228db116a111')
provides=("hare")
conflicts=("hare")
# options=(debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cp "$srcdir/config.$arch.mk" config.mk
	export VERSION="dev+$(echo "$_commit" | cut -c-7)"
	export LOCALVER=arch
	make -j1 # XXX: parallel build driver builds are broken
}

check () {
	cd "$srcdir/$_pkgname"
	make check
	.bin/hare test
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

