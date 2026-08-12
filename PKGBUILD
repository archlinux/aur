_basepkg=kyanite

pkgname="${_basepkg}-git"
pkgver=r263.dbe87df
pkgrel=1
pkgdesc='A lightweight, graphical text editor'
arch=('x86_64' 'i686' 'aarch64' 'armv7')
url='https://codeberg.org/pastthepixels/kyanite'
provides=("${_basepkg}")
conflicts=("${_basepkg}")
source=("${_basepkg}::git+${url}.git")
makedepends=(
	# For building
	'cargo'
	'clang'
	'git'
)
depends=(
	'libadwaita'
	'blueprint-compiler'
	'libpanel'
	'vte4'
	'gtksourceview5'
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_basepkg}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${_basepkg}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "${srcdir}/${_basepkg}"
	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${_basepkg}"
	# Install app
	install -Dm 0755 target/release/ky "${pkgdir}/usr/bin/ky"

	# Copy Desktop Entry
	install -Dm 0644 resources/metadata/ca.potatoe.Kyanite.desktop "${pkgdir}/usr/share/applications/ca.potatoe.Kyanite.desktop"

	# Copy Icons (thanks Spike!)
	cd resources/icons/hicolor
	find . -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/share/icons/hicolor/{}" \;
}
