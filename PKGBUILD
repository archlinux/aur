# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2241.cb9b5872
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
            '159c2f56f9617a97ecbe2b1ab94c98beb798fa575463bdcfba281a023202df481714c16536e213e859468b50cdd9f339224d8a3b3d57e139a58412b3efba6d84')
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

