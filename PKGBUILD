# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2873.b76e834c
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

arch=("x86_64" "aarch64")
url="https://harelang.org"
source=("${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/hare"
	0001-Comment-out-assertions-that-fail-on-aarch64.patch
	config.x86_64.mk
	config.aarch64.mk)

provides=("hare")
conflicts=("hare")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	if [ "$CARCH" = "aarch64" ]; then
		cd "$srcdir/$_pkgname"
		patch --forward --strip=1 --input="${srcdir}/0001-Comment-out-assertions-that-fail-on-aarch64.patch"
	fi
}

build() {
	cd "$srcdir/$_pkgname"
	cp "$srcdir/config.$CARCH.mk" config.mk
	export VERSION="dev+$(echo "$_commit" | cut -c-7)"
	export LOCALVER=arch

	# remove '-Wl,' prefix if present as hare requires direct link flags
	export LDLINKFLAGS=${LDFLAGS#"-Wl,"}

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

sha256sums=('SKIP'
            '3511a8499adbd53cf18379aeda3ef739a90e70fb2fe2f02477b5652d7ad63d06'
            '9c339eeb042ce00641cea4eed5403ca204d6f4f9cd5f709be286a252db47a034'
            'c82db335b70c03d3d656128fbb0be2cc552219b3e7c93b15d1e6afd1b0e9ba7e')
