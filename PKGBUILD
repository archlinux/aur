# Maintainer: Mvkweb <https://github.com/Mvkweb>
# Maintainer: Dan Griffiths <me at evertiro dot com>

_pkgname=zinc
pkgname=zinc-term
pkgver=0.2.0
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
	'zig>=0.17'
	'pkgconf'
)
conflicts=('zinc-term-git')
source=("https://github.com/Mvkweb/zinc/releases/download/v$pkgver/zinc-v$pkgver.tar.gz")
sha256sums=('61da16714982cf263f42afadb9ce4be772abdbd8a5edb21cf2931c5ab6bbb204')

build() {
	cd "$srcdir/$_pkgname-v$pkgver"

    # Baseline CPU so the package runs anywhere, not just the build host.
    # Staging prefix: package() copies the tree into $pkgdir.
    zig build \
		-Doptimize=ReleaseSafe \
        -Dcpu=baseline \
        -Dversion="$pkgver" \
        --prefix "$srcdir/stage"
}

package() {
	cd "$srcdir/$_pkgname-v$pkgver"

	cp -a "$srcdir/stage/." "$pkgdir/usr/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
