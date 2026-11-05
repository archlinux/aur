# Maintainer: Mvkweb <https://github.com/Mvkweb>
# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=zinc-term-git
pkgver=0.2.0.r0.g5a20e87
pkgrel=1
pkgdesc='A terminal emulator written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/Mvkweb/zinc'
license=('MIT')
depends=(
	'wayland'
	'libxkbcommon'
	'freetype2'
	'fontconfig'
	'hicolor-icon-theme'
)
# Requires Zig 0.17.x (see build.zig.zon minimum_zig_version).
makedepends=(
	'git'
	'zig>=0.17'
	'pkgconf'
)
conflicts=('zinc-term')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"

    # Baseline CPU so the package runs anywhere, not just the build host.
    # Staging prefix: package() copies the tree into $pkgdir.
    zig build \
		-Doptimize=ReleaseSafe \
        -Dcpu=baseline \
        -Dversion="$pkgver" \
        --prefix "$srcdir/stage"
}

package() {
	cd "$srcdir/$pkgname"

	cp -a "$srcdir/stage/." "$pkgdir/usr/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
