# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgbase=taigikeyboard
pkgname=(fcitx5-taigikeyboard ibus-taigikeyboard taigikeyboard-common)
pkgver=3.6.10
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
	'ttf-iansui: font with more support for Taigi'
)
makedepends=(
	'git'
	'cargo'
	'cmake'
	'ninja'
	'extra-cmake-modules'
	'pkgconf'
	'unzip'
	'protobuf-c'
	'fcitx5'
	'ibus'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/taigikeyboard/taigikeyboard/archive/refs/tags/${_tag}.tar.gz")
sha512sums=('c98ba4034218ffccc24698a613f309c3677a604747fa7f187de6e09bda83d064514fc945a939bd63825b13ab981815a5c706def286ad528982276271bc320519')
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
	install -d "$pkgdir"/usr/share/taigikeyboard/dictionaries
	install -m644 \
		../dictionaries/dictionary.fst ../dictionaries/dictionary.bin ../dictionaries/association.bin ../dictionaries/syllables.fst \
		"$pkgdir"/usr/share/taigikeyboard/dictionaries/
	for size in 16 22 24 32 48 64 128 256; do
		install -Dm644 \
			data/icons/hicolor/"$size"x"$size"/apps/taigikeyboard.png \
			"$pkgdir"/usr/share/icons/hicolor/"$size"x"$size"/apps/taigikeyboard.png
	done
	install -Dm755 target/release/taigikeyboard-settings "$pkgdir"/usr/bin/taigikeyboard-settings
	install -Dm644 data/tw.taigikeyboard.Settings.desktop "$pkgdir"/usr/share/applications/tw.taigikeyboard.Settings.desktop
}

package_ibus-taigikeyboard() {
	pkgdesc='Taigi input method for IBus'
	depends=('ibus' 'taigikeyboard-common')
	cd "${pkgbase}-${_tag}/linux"
	install -Dm755 target/release/ibus-engine-taigikeyboard "$pkgdir"/usr/lib/ibus/ibus-engine-taigikeyboard
	install -Dm644 target/taigikeyboard.xml "$pkgdir"/usr/share/ibus/component/taigikeyboard.xml
}

package_fcitx5-taigikeyboard() {
	pkgdesc='Taigi input method for Fcitx5'
	depends=('fcitx5' 'taigikeyboard-common')
	# I don't think it is necessary to list libtaigikeyboard.so in provided=
	# since fcitx5-rime doesn't do it either
	cd "${pkgbase}-${_tag}/linux"
	DESTDIR="$pkgdir" cmake --install target/fcitx5-build
}
