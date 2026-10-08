# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgbase=taigikeyboard
pkgname=(fcitx5-taigikeyboard ibus-taigikeyboard taigikeyboard-common)
pkgver=3.7.0
_tag="desktop-${pkgver}"
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
	'fcitx5'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/taigikeyboard/taigikeyboard/archive/refs/tags/${_tag}.tar.gz")
sha512sums=('066aae3ff15b94a776762667fd6d15e62744367b6ff01f97b141183178fe25c110fecdfbcee32f420836fd24a3c3ac1013cdcf38f7cf9e45bfbbafb3f6349194')
# Unbundling libsqlite3-sys while using LTO for C still leads to errors. Disable
# it instead.
options=(!lto)

build() {
	# The way some protobuf stuff is included ends up putting references to the
	# home and $srcdir paths into the executables and shared libraries.
	# Work around that and fix makepkg's warning about this.
	RUSTFLAGS="--remap-path-prefix $HOME=~/ $RUSTFLAGS"
	RUSTFLAGS="--remap-path-prefix ${srcdir}/${pkgbase}-${_tag}=${pkgbase} $RUSTFLAGS"
	cd "${pkgbase}-${_tag}/linux"
	make build
	make component
	make build-fcitx5
}

# split from the original amalgamation that installs all of them all at once
# installing an ibus input method should not pull in fcitx5 itself or the
# corresponding fcitx5 input method, and vice versa
# fonts are not installed, this pulls from the aur instead
package_taigikeyboard-common() {
	pkgdesc='Common files for Taigi Keyboard'
	optdepends=()
	cd "${pkgbase}-${_tag}/linux"
	make DESTDIR="$pkgdir" INSTALL_FONTS=0 install-common
}

package_ibus-taigikeyboard() {
	pkgdesc='Taigi input method for IBus'
	depends=('ibus' 'taigikeyboard-common')
	cd "${pkgbase}-${_tag}/linux"
	make DESTDIR="$pkgdir" install-ibus
}

package_fcitx5-taigikeyboard() {
	pkgdesc='Taigi input method for Fcitx5'
	depends=('fcitx5' 'taigikeyboard-common')
	# I don't think it is necessary to list libtaigikeyboard.so in provided=
	# since fcitx5-rime doesn't do it either
	cd "${pkgbase}-${_tag}/linux"
	make DESTDIR="$pkgdir" install-fcitx5
}
