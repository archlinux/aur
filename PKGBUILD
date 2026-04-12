# Maintainer: Martin Rys <https://rys.rs/contact>
pkgname=tts-mod-vault
pkgver=2.0.0
pkgrel=2
pkgdesc='Cross-platform Tabletop Simulator mod backup & download tool'
arch=('x86_64')
url='https://github.com/markomijic/TTS-Mod-Vault'
license=('GPL-3.0-only')
depends=('gtk3')
makedepends=(
	'flutter'
	'git'
	'imagemagick'
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

	# We only have 1024x1024 PNG source and DEs generally need less smaller sizes than that
	magick convert assets/icon/tts_mod_vault_icon.png -resize 512x512 assets/icon/tts_mod_vault_512.png
	magick convert assets/icon/tts_mod_vault_icon.png -resize 256x256 assets/icon/tts_mod_vault_256.png
	magick convert assets/icon/tts_mod_vault_icon.png -resize 128x128 assets/icon/tts_mod_vault_128.png
}

package() {
	cd "${srcdir}/${pkgname}"

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a build/linux/x64/release/bundle/. "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/tts_mod_vault" "${pkgdir}/usr/bin/${pkgname}"

	# Install the icon
	install -Dm644 "assets/icon/tts_mod_vault_icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/tts_mod_vault.png"
	install -Dm644 "assets/icon/tts_mod_vault_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tts_mod_vault.png"
	install -Dm644 "assets/icon/tts_mod_vault_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/tts_mod_vault.png"
	install -Dm644 "assets/icon/tts_mod_vault_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/tts_mod_vault.png"
	# Install desktop entry
	install -Dm644 "${srcdir}/tts-mod-vault.desktop" "${pkgdir}/usr/share/applications/tts-mod-vault.desktop"
}
