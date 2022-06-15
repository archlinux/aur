# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxengine-git
pkgver=r1774.ff5d22a
pkgrel=1
pkgdesc="PSOC5 floppy disk imaging interface"
arch=('x86_64')
url="http://cowlark.com/fluxengine/"
license=('MIT')
depends=('wxgtk2' 'libudev.so' 'zlib' 'sqlite3' 'protobuf' 'fmt' 'libfmt.so' 'libprotobuf.so')
makedepends=('git' 'xxd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/davidgiven/fluxengine.git')
sha256sums=('SKIP')

_targets=(fluxengine fluxengine-gui brother120tool brother240tool upgrade-flux-file)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make "${_targets[@]/%/.exe}"
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# Currently broken, see https://github.com/davidgiven/fluxengine/issues/531
	#make tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/bin/"

	local target
	for target in "${_targets[@]}"; do
		install "${target}.exe" "$pkgdir/usr/bin/${target}"
	done

	install -Dm 644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"

	# Installing docs is not yet supported in a reasonable way by upstream.
}
