# Maintainer: wispr-flow-linux <https://github.com/wispr-flow-linux>
#
# Canonical PKGBUILD template for the `wispr-flow-appimage` AUR package. The
# release pipeline (.github/workflows/ci.yml, update-aur-repo job) copies this
# into the AUR checkout and fills the placeholders with sed:
#   1.0.3+wispr1.5.789          -> <repoVer>+wispr<wisprVer>   (the tag minus its 'v')
#   wispr-flow-1.5.789-1.0.3-x86_64.AppImage   -> wispr-flow-<wisprVer>-<repoVer>-x86_64.AppImage
#   5baceee1c31ba4512f7ac5e3e5165567a724bf612ad81f14fdcc20b488fe5e76 -> sha256 of that AppImage
#
# This packages the prebuilt AppImage (which bundles the proprietary Wispr Flow
# app); it is not built from source.

pkgname=wispr-flow-appimage
pkgver=1.0.3+wispr1.5.789
pkgrel=1
pkgdesc="Wispr Flow voice dictation for Linux (unofficial AppImage build)"
arch=('x86_64')
url="https://github.com/wispr-flow-linux/wispr-flow-linux"
license=('LicenseRef-proprietary')
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=('wl-clipboard: clipboard paste-injection on Wayland')
provides=('wispr-flow')
conflicts=('wispr-flow')
options=(!strip)

_appimage=wispr-flow-1.5.789-1.0.3-x86_64.AppImage
source=("${_appimage}::https://github.com/wispr-flow-linux/wispr-flow-linux/releases/download/v${pkgver}/${_appimage}")
sha256sums=('5baceee1c31ba4512f7ac5e3e5165567a724bf612ad81f14fdcc20b488fe5e76')
noextract=("${_appimage}")

package() {
	cd "${srcdir}"
	chmod +x "${_appimage}"
	# Extract rather than depend on FUSE at runtime.
	"./${_appimage}" --appimage-extract >/dev/null

	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/wispr-flow"

	# Desktop entry (rewrite Exec/Icon to the installed names).
	local desktop
	desktop=$(find squashfs-root -maxdepth 1 -name '*.desktop' | head -1)
	if [[ -n "${desktop}" ]]; then
		install -Dm644 "${desktop}" \
			"${pkgdir}/usr/share/applications/${pkgname}.desktop"
		sed -i \
			-e 's|^Exec=.*|Exec=wispr-flow %U|' \
			-e 's|^Icon=.*|Icon=wispr-flow|' \
			"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	fi

	# Icon (best-effort: take the largest PNG the AppDir ships).
	local icon
	icon=$(find squashfs-root -name '*.png' | sort | tail -1)
	if [[ -n "${icon}" ]]; then
		install -Dm644 "${icon}" \
			"${pkgdir}/usr/share/icons/hicolor/512x512/apps/wispr-flow.png"
	fi
}
