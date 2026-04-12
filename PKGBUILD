# Maintainer: Martin Rys <https://rys.rs/contact>
pkgname=tts-mod-vault
pkgver=2.0.0
pkgrel=4
pkgdesc='Cross-platform Tabletop Simulator mod backup & download tool'
arch=('x86_64')
url='https://github.com/markomijic/TTS-Mod-Vault'
license=('GPL-3.0-only')
depends=('gtk3')
makedepends=(
	'flutter'
	'git'
)
options=('!strip')
source=(
	"${pkgname}::git+${url}.git#tag=v${pkgver}"
	"tts-mod-vault.desktop"
)
sha256sums=('3f43e9e0a5f2f099f8f6f5a235e3d94fe728e390b554a23012c7acb86b8be9cb'
            '5ae442a4340d41dc464defcf460121f84a58523a087b27e78768057aac17adbe')

# https://github.com/markomijic/TTS-Mod-Vault/issues/43
prepare() {
	cd "${srcdir}/${pkgname}"
	printf '%s\n' '# packaged build' > .env
}

build() {
	cd "${srcdir}/${pkgname}"

	export FLUTTER_SUPPRESS_ANALYTICS=true

	flutter config --enable-linux-desktop
	flutter pub get
	flutter build linux --release
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a build/linux/x64/release/bundle/. "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/tts_mod_vault" "${pkgdir}/usr/bin/tts_mod_vault"

	# Install the icons
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png"  "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_256.png"  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_128.png"  "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_64.png"   "${pkgdir}/usr/share/icons/hicolor/64x64/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_32.png"   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/tts_mod_vault.png"
	install -Dm644 "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png"   "${pkgdir}/usr/share/icons/hicolor/16x16/apps/tts_mod_vault.png"
	# Install desktop entry
	install -Dm644 "${srcdir}/tts-mod-vault.desktop" "${pkgdir}/usr/share/applications/tts-mod-vault.desktop"
}
