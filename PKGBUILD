# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxengine-git
pkgver=r1794.a9e8267
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

# Because the build system is a bit idiosyncratic, and there is no install target.
_targets=(fluxengine fluxengine-gui brother120tool brother240tool upgrade-flux-file)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# Workaround bug https://github.com/davidgiven/fluxengine/issues/531
	CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
	cd "$srcdir/${pkgname%-git}"
	# Make all depends on tests, but we want to run them in check() instead.
	make "${_targets[@]}"
}

check() {
	# Workaround bug https://github.com/davidgiven/fluxengine/issues/531
	CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
	cd "$srcdir/${pkgname%-git}"
	make tests
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/bin/"

	local target
	for target in "${_targets[@]}"; do
		install "${target}" "$pkgdir/usr/bin/${target}"
	done

	install -Dm 644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"

	# Installing docs is not yet supported in a reasonable way by upstream.
}
