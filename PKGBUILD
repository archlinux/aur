# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2577.259c1176
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

optdepends=(
	"aarch64-linux-gnu-gcc: aarch64 cross compilation support"
	"aarch64-linux-gnu-binutils: aarch64 cross compilation support"
	"riscv64-linux-gnu-gcc: riscv64 cross compilation support"
	"riscv64-linux-gnu-binutils: riscv64 cross compilation support"
)

arch=("x86_64")
url="https://harelang.org"
source=("${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/hare"
	config.x86_64.mk)
sha512sums=('SKIP'
            'bf0f1985de8ae414352b2a5c542c7c5f3ede8cdf4af5e22753226dc7d5192695fa55ef495bb10d9be682858533bdd771d38990d3271d9a4fa955fb15509b384f')
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
#	make check
#	.bin/hare test
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

