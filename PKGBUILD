# Maintainer: Martin Rys <https://rys.rs/contact>
pkgname=tts-mod-vault
pkgver=2.0.0
pkgrel=1
pkgdesc='Cross-platform Tabletop Simulator mod backup & download tool'
arch=('x86_64')
url='https://github.com/markomijic/TTS-Mod-Vault'
license=('GPL-3.0-only') # TODO(Martin): https://github.com/markomijic/TTS-Mod-Vault/issues/42
depends=('gtk3')
makedepends=('flutter' 'git')
options=('!strip')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('3f43e9e0a5f2f099f8f6f5a235e3d94fe728e390b554a23012c7acb86b8be9cb')

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
	ln -s "/opt/${pkgname}/tts_mod_vault" "${pkgdir}/usr/bin/${pkgname}"
}
