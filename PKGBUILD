# Contributor: Abir-Tx <abirtx@yandex.com>

pkgname=appnotex
pkgver=1.1.0
pkgrel=2
pkgdesc="Quick terminal based note keeper for Linux Apps"
arch=(x86_64)
url="https://github.com/Abir-Tx/AppNotEx.git"
license=('AGPL-3.0-or-later')
depends=(sqlite python)
makedepends=(git cmake)
source=("git+$url#tag=v$pkgver"
	"git+https://github.com/gabime/spdlog"
	"git+https://github.com/Abir-Tx/ALib.git"
	"git+https://github.com/open-source-parsers/jsoncpp.git"
)
sha256sums=('eee633264286188b4a34d0f5d1b3c7709d01a4b0ec8786d0fd77f2363848aa5a'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd AppNotEx
	git submodule init
	git config submodule.lib/spdlog.url "$srcdir/spdlog"
	git config submodule.lib/ALib.url "$srcdir/ALib"
	git config submodule.lib/jsoncpp.url "$srcdir/jsoncpp"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S AppNotEx -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	# clean useless stuff
	rm -rf "$pkgdir"/usr/{lib,include}

	cd AppNotEx
	install -Dm644 -v docs/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 -v docs/appnotex.1 "${pkgdir}/usr/local/man/man1/appnotex.1"
}
