# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgbase=taigikeyboard-git
pkgname=(fcitx5-taigikeyboard-git ibus-taigikeyboard-git taigikeyboard-common-git)
pkgver=3.9.0.r460.e161c40
pkgrel=1
arch=('x86_64')
url="https://taigikeyboard.tw"
license=('Apache-2.0')
depends=(
	'libgcc' 'glibc'
	'hicolor-icon-theme' # to allow putting our icons in there
	'glib2' 'gtk4' 'pango' 'libadwaita'
)
optdepends=(
	'ttf-jf-openhuninn: font with more support for Taigi'
	'ttf-iansui-git: font with more support for Taigi'
)
makedepends=(
	'make'
	'cargo'
	'pkgconf'
	'protobuf-c'
	'cmake'
	'extra-cmake-modules'
	'ibus'
	'fcitx5'
)
source=("git+https://github.com/taigikeyboard/taigikeyboard.git")
sha512sums=('SKIP')
# Unbundling libsqlite3-sys while using LTO for C still leads to errors. Disable
# it instead.
options=(!lto)

pkgver() {
	cd "${pkgbase%-git}"
	printf "%s" "$(
		git describe --long --tags --abbrev=7 \
			--match="desktop-*" |
			sed 's/^desktop-//; s/\([^-]*-\)g/r\1/; s/-/./g'
	)"
}

build() {
	# The way some protobuf stuff is included ends up putting references to the
	# home and $srcdir paths into the executables and shared libraries.
	# Work around that and fix makepkg's warning about this.
	RUSTFLAGS="--remap-path-prefix $HOME=~/ $RUSTFLAGS"
	RUSTFLAGS="--remap-path-prefix ${srcdir}/${pkgbase%-git}=${pkgbase%-git} $RUSTFLAGS"
	cd "${pkgbase%-git}/linux"
	make build
	make component
	make build-fcitx5
}

package_taigikeyboard-common-git() {
	pkgdesc='Common files for Taigi Keyboard'
	optdepends=()
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "${pkgbase%-git}/linux"
	make DESTDIR="$pkgdir" INSTALL_FONTS=0 install-common
}

package_ibus-taigikeyboard-git() {
	pkgdesc='Taigi input method for IBus'
	depends=('ibus' 'taigikeyboard-common')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "${pkgbase%-git}/linux"
	make DESTDIR="$pkgdir" install-ibus
}

package_fcitx5-taigikeyboard-git() {
	pkgdesc='Taigi input method for Fcitx5'
	depends=('fcitx5' 'taigikeyboard-common')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	# I don't think it is necessary to list libtaigikeyboard.so in provided=
	# since fcitx5-rime doesn't do it either
	cd "${pkgbase%-git}/linux"
	make DESTDIR="$pkgdir" install-fcitx5
}
