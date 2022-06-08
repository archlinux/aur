# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxengine-git
pkgver=r1718.d7ce100
pkgrel=1
pkgdesc="PSOC5 floppy disk imaging interface"
arch=('x86_64')
url="http://cowlark.com/fluxengine/"
license=('MIT')
depends=('wxgtk2' 'libudev.so' 'zlib' 'sqlite3' 'protobuf')
makedepends=('git' 'ninja' 'xxd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/davidgiven/fluxengine.git'
        '01-flags.patch')
sha256sums=('SKIP'
            'f5f2ab1d50c975eded17c49ae72ea6183d4637a9bdfae22b2e8d995d7526639f')

_targets=(fluxengine fluxengine-gui brother120tool upgrade-flux-file)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/01-flags.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make .obj/build.ninja
	ninja -f .obj/build.ninja "${_targets[@]/%/-unstripped}"
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# There are unit tests. Or tests at least? I have no idea who to run them...
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/bin/"

	local target
	for target in "${_targets[@]/%/-unstripped}"; do
		install "$target" "$pkgdir/usr/bin/${target/%-unstripped/}"
	done

	install -Dm 644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"

	# I have no idea how to build and install docs.
}
