# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-atlas-git
_pkgname=Atlas
pkgver=2.0.0.r0.ge5e5867
pkgrel=1
pkgdesc='Fast, lightweight Material Design 3 file manager (git version)'
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
makedepends=('cargo' 'git')
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
provides=('astra-atlas')
conflicts=('astra-atlas' 'astra-atlas-bin')
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
