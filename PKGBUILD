# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
# Co-Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=v2.7.0
pkgrel=1
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0')
makedepends=(git deno cargo dpkg hidapi)
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=('wine: For most Windows only Plugins support needed')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"${pkgname}::git+https://github.com/nekename/OpenDeck#tag=${pkgver//_/-}"
)

sha256sums=('aca0b58eb43c0b381509f71e8f0563d99722062e4fc86fdb158001fb0f946baa')

prepare() {
	cd "$srcdir/${pkgname}/src-tauri"
	git submodule update --init
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	cd ..
	export DENO_DIR="${srcdir}/deno-cache"
	deno install || (echo "please run 'sudo deno upgrade' before installing the package again" && exit 0)
}

build() {
	cd "$srcdir/${pkgname}/src-tauri"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export DENO_DIR="${srcdir}/deno-cache"
	OPENDECK_DISABLE_UPDATE_CHECK=1 deno task tauri build --ci -b deb -- --frozen
}

package() {
	cd "$srcdir/${pkgname}"
	dpkg-deb -R $(find . -type f -name "*.deb") $pkgdir
	rm -rf $pkgdir/DEBIAN
}
