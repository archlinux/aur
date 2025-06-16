# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
# Co-Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=v2.5.0
pkgrel=2
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/ninjadev64/OpenDeck"
license=('GPL-3.0')
makedepends=(git deno-init cargo dpkg hidapi)
depends=(libappindicator-gtk3 webkit2gtk-4.1)
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!lto')
source=(
	"${pkgname}::git+https://github.com/ninjadev64/OpenDeck#tag=${pkgver//_/-}"
)

sha256sums=('1c668969e3280d99e879eb1e87fb3da84ee3cc64f315768e15d1211527c47cee')

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
