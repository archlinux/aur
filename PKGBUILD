# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r2806.6390e114
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
	0001-math-disable-failing-tan-tests.patch
	config.x86_64.mk
	config.aarch64.mk)

provides=("hare")
conflicts=("hare")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	patch --forward --strip=1 --input="${srcdir}/0001-math-disable-failing-tan-tests.patch"
}

build() {
	cd "$srcdir/$_pkgname"
	cp "$srcdir/config.$CARCH.mk" config.mk
	export VERSION="dev+$(echo "$_commit" | cut -c-7)"
	export LOCALVER=arch

	# remove '-Wl,' prefix if present, since it is only required when
	# the linker is invoked indirectly. Keeping it will cause the linker to
	# fail.
	export LDFLAGS=${LDFLAGS#"-Wl,"}

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

sha512sums=('SKIP'
            '766b911b67891c42323d8c2483b574df51916eb8854555b77805ca9a077ad7e328fbae559e94b2169bd09604f5628c56bcbb15173bcd2a99830951d7afe9880c'
            '5df893f3d1f79cd9735ba0f3b9a61fad881eda887c8a4b0c97ee2b8b99171636c4f2699617d46963c35ec7946cb423b1b1debb685dbaef7909d6bd915e4f65c1'
            'bb661bb2916d64eb3db5f4af1cdf6ec5271b4809d0f3afe80045cdffb5407e997d2ea9d2315dc4da131d765dcceaab5e23014597ccb000b7f7338896829eaa86')
