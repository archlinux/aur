pkgname='zshell'
pkgver=0.4.0.r77.g0486965
pkgrel=1
pkgdesc='ZShell desktop shell'
arch=('any')
url='https://git.zach-dev.cc/zach/z-bar-qt'
license=('GPL-3.0-only')
depends=('python' 'python-pillow' 'python-materialyoucolor' 'libnotify' 'swappy' 'dart-sass'
	'app2unit' 'wl-clipboard' 'dconf' 'cliphist' 'python-typer' 'qt6-canvaspainter')
makedepends=('python-build' 'python-installer' 'python-hatch' 'python-hatch-vcs' 'cargo' 'rust' 'cmake' 'ninja')
source=("$pkgname::git+$url.git#branch=main")
options=('!lto')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' |
		sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}/zshell-img-tools"
	cargo build --release

	cd "${srcdir}/${pkgname}"
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/ \
		-DENABLE_MODULES="plugin;shell;cli;m3shapes"
	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" cmake --install build

	install -Dm755 \
		"${srcdir}/${pkgname}/zshell-img-tools/target/release/zshell-img-tools" \
		"${pkgdir}/usr/bin/zshell-img-tools"
}
