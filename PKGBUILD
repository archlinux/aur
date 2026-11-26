# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-atlas
pkgver=2.0.1
pkgrel=1
pkgdesc='Fast, lightweight Material Design 3 file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/AstraSuite/Atlas'
license=('GPL-3.0-only')
depends=(
	'gcc-libs'
	'glibc'
	'qt6-base'
	'qt6-declarative'
	'qt6-multimedia'
	'qt6-svg'
)
makedepends=('cargo')
optdepends=(
	'caelestia-cli: dynamic color scheme syncing with Caelestia'
	'exiv2: editing the EXIF comment of a photo'
	'ffmpeg: integrated video and audio manipulation'
	'gvfs: remote network filesystem mounting'
	'git: inline repository status and branch tracking'
	'imagemagick: integrated image conversion and manipulation'
	'papirus-folders: dynamic folder color'
	'papirus-icon-theme: dynamic folder color'
	'udisks2: external drive management'
	'xdg-desktop-portal: desktop portal integration'
	'xdg-utils: default application launching'
	'bzip2: archive extraction and compression'
	'gzip: archive extraction and compression'
	'p7zip: archive extraction and compression'
	'tar: archive extraction and compression'
	'unzip: archive extraction and compression'
	'xz: archive extraction and compression'
	'zip: archive extraction and compression'
)
conflicts=('astra-atlas-bin' 'astra-atlas-git')
options=('!lto')
source=("https://github.com/AstraSuite/Atlas/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d50c86ffd74ffe6a20844cd35e43e0fddb07e2573c215f391f461002ef40d04f')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# The release tarball has no git history to read the version from
	export ATLAS_VERSION="${pkgver}"
	cargo build --frozen --release
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export ATLAS_VERSION="${pkgver}"
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
