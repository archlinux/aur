# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=ffbtools-git
pkgver=r51.117153c
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
sha256sums=('SKIP'
            '3699c92397c56854bed93a5c0740aa7fa5da3f278a71d139ff111c19d62a1d5e'
            '461f881b6fde3d14c2d5fcbedd13569f7261a6110b32fab88d8502d5d8f8f5b7')

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
