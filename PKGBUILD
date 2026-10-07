# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgbase=taigikeyboard-git
# split from the original amalgamation that installs all of them all at once
# installing an ibus input method should not pull in fcitx5 itself or the
# corresponding fcitx5 input method, and vice versa
# fonts are not installed, this recommends them from the aur instead
pkgname=(fcitx5-taigikeyboard-git ibus-taigikeyboard-git taigikeyboard-common-git)
# > To use pkgver(), you still need to declare the pkgver variable with the most
# > recent value. makepkg will invoke function pkgver(), and update variable
# > pkgver accordingly.
pkgver=3.6.10.r918.0b2c45c
pkgrel=2
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
	'fcitx5'
)
source=(
	"git+https://github.com/taigikeyboard/taigikeyboard.git"
	"0001-build-linux-allow-skipping-font-install-or-splitting.patch"
)
sha512sums=('SKIP'
	'd4d829e520f880cf8a8be6cb596a4fe9f77bb45f102abfe3b6bc51a93ba071214c5c828d9460ca802059aec7b3e6e188359f747f1b40f9fd55147ee828dfc484')
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

prepare() {
	cd "${pkgbase%-git}"
	patch -p1 -i ../0001-build-linux-allow-skipping-font-install-or-splitting.patch
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

# We need to use our own install commands because upstream install them all at
# once. That works for RPM or .deb since they install everything then declare
# files afterwards, but that's not the case here.
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
