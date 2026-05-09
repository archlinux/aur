# Maintainer: Kaydax <kaydax@kaydax.xyz>
# Contributor: David Čuček <observ33r@gmail.com>

pkgname="code-translucent"
pkgver=1.119.0
pkgrel=1
pkgdesc="The Open Source build of Visual Studio Code (vscode) editor with translucent window, official marketplace, unblocked proprietary features and wayland support!"

arch=(
	"x86_64"
	"i686"
	"aarch64"
	"armv7h"
	"riscv64"
)

url="https://github.com/microsoft/vscode"
license=("MIT")

conflicts=("code-oss")
provides=("code-oss")
options=('!strip' '!debug')

depends=(
	"libxkbfile"
	"gtk3"
	"nss"
	"libsecret"
	"alsa-lib"
	"gcc-libs"
	"libnotify"
	"libxss"
	"glibc"
)

optdepends=(
	"libdbusmenu-glib: Needed for KDE global menu"
	"x11-ssh-askpass: SSH authentication"
	"icu69: Needed for live share"
)

makedepends=(
	"git"
	"npm"
	"pnpm"
	"python"
	"nodejs-lts-jod"
)

source=(
	"${pkgname}::git+${url}.git#tag=${pkgver}"
	"build-with-chroot.sh"
	"translucent.patch"
	"product.json"
	"code-oss.sh"
)

sha512sums=(
	"SKIP"
	"9de3f195e711814e1e457e8ccb6383c6000bc83ee707f2bc138fe66c3cf6c35a6e9c755594afb5fbf8c4f05c3c87f7f3b8714e7947b62094ead6f5f1b81f5b24"
	"9deb0da4eb9fb989e892a5743b99c50acc64dddcd33d2a8517d0a48eb12476dac3a8c5238fa40b64c6c3e89fa3cc399135ebf1f795f9029871cf61d25418e2c6"
	"36c3ba2f04fb479968264ba65a952392dfa1792a0eb434b2f41ccc6eccce528d29749de00c37d802a1622064d22a2e6b2a01adb2b2c86f8007ee27094259a87b"
	"6234842d41d9cb6cdd27766e35804644c59a39b43a92f2243b18525dc69d954d1e9dcd4297538de3dfd26051c7035d1ebb04f849a69208afa8214e42160c18dd"
)

case "${CARCH}" in
 	"i686")
 		_vscode_arch="ia32"
 		;;
	"x86_64")
		_vscode_arch="x64"
		;;
	"aarch64")
		_vscode_arch="arm64"
		;;
	"armv7h")
		_vscode_arch="arm"
		;;
	"riscv64")
		_vscode_arch="riscv64"
		;;

	*)
		_vscode_arch="DUMMY"
		;;
esac

prepare() {

	cd "${srcdir}/${pkgname}"

	# Apply patch to source
	patch -p1 -i "../translucent.patch"

	# Replace product json
	cp --update=all "../product.json" "."

	# Add vsce-sign necessary for extensions' signature verification
	pnpm add @vscode/vsce-sign @vscode/vsce-sign-linux-"${_vscode_arch}"

	# Set the commit and build date
	local _commit="$(git rev-parse HEAD)"
	local _datestamp="$(date -u -Is | sed 's/\+00:00/Z/')"
	sed -e "s|@COMMIT@|${_commit}|" -e "s|@DATE@|${_datestamp}|" -i "product.json"

	# Patch appdata and desktop file
	sed -i 's|/usr/share/@@NAME@@/@@NAME@@|@@NAME@@|g
    		s|@@NAME_SHORT@@|Code|g
    		s|@@NAME_LONG@@|Code - OSS|g
    		s|@@NAME@@|code-oss|g
    		s|@@ICON@@|code|g
    		s|@@EXEC@@|/usr/bin/code-oss|g
    		s|@@LICENSE@@|MIT|g
    		s|@@URLPROTOCOL@@|vscode|g
    		s|inode/directory;||' "resources/linux/code"{.appdata.xml,-workspace.xml,.desktop,-url-handler.desktop}

	sed -i 's|MimeType=.*|MimeType=x-scheme-handler/code-oss;|' "resources/linux/code-url-handler.desktop"

	# Add completitions for code-oss
	cp "resources/completions/bash/code" "resources/completions/bash/code-oss"
	cp "resources/completions/zsh/_code" "resources/completions/zsh/_code-oss"

	# Patch completitions with correct names
	sed -i 's|@@APPNAME@@|code-oss|g' "resources/completions/"{bash/code-oss,zsh/_code-oss}

	# upstream has a compatibility issue with npm but it doesn't affect packaging
	# so remove the check
	sed -i '/Please use npm version < 11.2.0./{n;d}' build/npm/preinstall.ts
}

build() {

	cd "${srcdir}/${pkgname}"

	npm install --cpu="${_vscode_arch}"

	npm run gulp vscode-linux-"${_vscode_arch}"-min

}

package() {

	local _pkgdir="${srcdir}/${pkgname}"
	local _appdir="${srcdir}/VSCode-linux-${_vscode_arch}"

	install -Dm 644 "${_appdir}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm 644 "${_appdir}/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"

	install -Dm 644 "${_pkgdir}/resources/linux/code.appdata.xml" "${pkgdir}/usr/share/metainfo/code-oss.appdata.xml"
	install -Dm 644 "${_pkgdir}/resources/linux/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/code-oss-workspace.xml"
	install -Dm 644 "${_pkgdir}/resources/linux/code.desktop" "${pkgdir}/usr/share/applications/code-oss.desktop"
	install -Dm 644 "${_pkgdir}/resources/linux/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-oss-url-handler.desktop"
	install -Dm 644 "${_pkgdir}/resources/linux/code.png" "${pkgdir}/usr/share/icons/code.png"

	install -Dm 644 "${_appdir}/resources/completions/bash/code-oss" "${pkgdir}/usr/share/bash-completion/completions/code-oss"
	install -Dm 644 "${_appdir}/resources/completions/zsh/_code-oss" "${pkgdir}/usr/share/zsh/site-functions/_code-oss"

	install -dm 755 "${pkgdir}/opt/${pkgname}"

	cp --recursive --no-preserve=ownership --preserve=mode "${_appdir}/"* "${pkgdir}/opt/${pkgname}"

	install -Dm 755 "${srcdir}/code-oss.sh" "${pkgdir}/usr/bin/code-oss"

}
