# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-git
_pkgname=hare
pkgver=r4316.940f4062
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

provides=("hare")
conflicts=("hare")

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
	HAREPATH=. .bin/hare test
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP'
            '9ddf2334ace2073d83babfe0eb33dd440e318b75f6b5e9ced6a54824455a75b2'
            'f329421c6335123ed03d5b5e3d717d45aacd6621ddc81c5e3b257012fce2d17b')
