# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
# Co-Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
pkgname=opendeck-git
pkgver=r266.1d9ca83
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0')
makedepends=(git deno cargo dpkg hidapi)
depends=(webkit2gtk-4.1 libappindicator-gtk3)
optdepends=(
'wine: Needed to support Windows-only plugins'
'wine-mono: Needed to support some Windows-only plugins'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=(
	"${pkgname%-git}::git+https://github.com/nekename/OpenDeck"
)

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	git submodule update --init
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	export DENO_DIR="${srcdir}/deno-cache"
	deno install || (echo "please run 'sudo deno upgrade' before installing the package again" && exit 0)
}

build() {
	cd "$srcdir/${pkgname%-git}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export DENO_DIR="${srcdir}/deno-cache"
	deno task tauri build --ci -b deb -- --frozen
}

package() {
	cd "$srcdir/${pkgname%-git}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
