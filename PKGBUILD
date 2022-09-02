# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2658.f86f8229
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
	config.x86_64.mk
    config.aarch64.mk)
sha512sums=('SKIP'
            '829da5837216f6d90af61757fdd6af99c0fa5a6168089bf34cd4c10b1d8506539ff38f1d77d5524eb376fa0bc8f7afa801d279fc44caa7e448a40b0fca6670da'
            '4c81f345dd820f0b6efd0b3e22a379bb60076a141275f0e54766670bbee4b6ab6c90d1ea36f2b5532f1b5cb6492053e738a82b579a6a0895343e7e441a6a8409')
provides=("hare")
conflicts=("hare")
# options=(debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cp "$srcdir/config.$CARCH.mk" config.mk
	export VERSION="dev+$(echo "$_commit" | cut -c-7)"
	export LOCALVER=arch
	make -j1 # XXX: parallel build driver builds are broken
}

check () {
	cd "$srcdir/$_pkgname"
	make check
#	.bin/hare test
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

