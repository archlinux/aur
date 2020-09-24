# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=ffbtools-git
pkgver=r58.8e03880
pkgrel=1
pkgdesc="Set of tools for FFB testing and debugging on GNU/Linux"
arch=('x86_64')
url="https://github.com/berarma/ffbtools"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'make') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	"${pkgname%-git}::git+https://github.com/berarma/ffbtools.git#branch=master"
	0001-makefile-clean-up-anti-patterns.patch
	0002-ffbwrap-Use-global-install-paths-for-arch.patch
)
noextract=()
sha512sums=('SKIP'
            'c61f52b12398d1063bdab25452d70210de990cc65e92159596d6e35a13f395d42914a9c666101d18c34c499a6be1cd25e7046bd04c2cd8fc6f951b6aeef0a6a1'
            'c440104013dc21bf1a23b18b4e35c907902ed21e40ae4e3ca07e9b5b132680d273496822ffdde0935bda2f88bc0ef3b7bc1654e76f7dbff730d5aecce2151ff7')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	local f
	for f in ${source[@]}; do
		f="${f%%::*}"
		f="${f##*/}"
		[[ $f = *.patch ]] || continue
		msg2 "Applying patch $f..."
		patch -Np1 < "$srcdir/$f"
	done
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 -T build/libffbwrapper-x86_64.so "$pkgdir/usr/lib/libffbwrapper.so"
	install -Dm 755 -T build/libffbwrapper-i386.so "$pkgdir/usr/lib32/libffbwrapper.so"
	local f
	for f in build/ffbplay bin/ffbwrap; do
		install -Dm 755 -t "$pkgdir/usr/bin" "$f"
	done
}
