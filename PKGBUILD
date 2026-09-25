# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>

pkgbase=taigikeyboard
pkgname=(fcitx5-taigikeyboard ibus-taigikeyboard taigikeyboard-common)
pkgver=3.6.10
pkgrel=1
arch=('x86_64')
url="https://github.com/taigikeyboard/taigikeyboard"
license=('Apache-2.0')
depends=(gtk4 libadwaita)
makedepends=(git cargo
	cmake ninja extra-cmake-modules
	fcitx5
	pkgconf unzip rust protobuf-c)
source=("git+https://github.com/taigikeyboard/taigikeyboard.git#tag=desktop-$pkgver")
sha512sums=('b7f8ef357318670fe7040f5686d96ba9ae0a1226ede90c75381b104920fac657b22b63859a1d4b308b32a8aae30c15ad9390a86ab2e32e2054752583dcc87d1a')
# This package uses the sqlite bundled in rusqlite, which would fail to be
# linked if LTO is enabled
options=(!lto)

build() {
	cd "$pkgbase/linux"
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
	depends=(gtk4 libadwaita ttf-jf-openhuninn ttf-iansui)
	cd "$pkgbase/linux"
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
	depends=(taigikeyboard-common ibus)
	cd "$pkgbase/linux"
	install -Dm755 target/release/ibus-engine-taigikeyboard "$pkgdir"/usr/lib/ibus/ibus-engine-taigikeyboard
	install -Dm644 target/taigikeyboard.xml "$pkgdir"/usr/share/ibus/component/taigikeyboard.xml
}

package_fcitx5-taigikeyboard() {
	pkgdesc='Taigi input method for Fcitx5'
	depends=(taigikeyboard-common fcitx5)
	cd "$pkgbase/linux"
	DESTDIR="$pkgdir" cmake --install target/fcitx5-build
}
