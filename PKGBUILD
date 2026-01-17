# Maintainer: terrorwolf <jan.jr03+aur@gmail.com>
# Co-Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=opendeck
pkgver=2.8.1
pkgrel=2
pkgdesc="A cross-platform desktop application that provides functionality for stream controller devices."
arch=('x86_64')
url="https://github.com/nekename/OpenDeck"
license=('GPL-3.0-or-later')
makedepends=(git deno cargo dpkg hidapi)
depends=(libappindicator-gtk3 webkit2gtk-4.1)
optdepends=('wine: For most Windows only Plugins support needed')
options=('!lto')
source=(
	"${pkgname}::git+https://github.com/nekename/OpenDeck#tag=v${pkgver//_/-}"
)

sha256sums=('8153300cc3ae2296815b3ac1799ea56e36d47b9ff1ffe3395828334b011e17d1')

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
