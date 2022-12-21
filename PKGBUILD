# Maintainer: David Čuček <observ33r@gmail.com>

pkgname="code-translucent"
pkgver=1.74.2
pkgrel=1
pkgdesc="The Open Source build of Visual Studio Code (vscode) editor with translucent window and official marketplace support!"

arch=(
	"x86_64"
	"i686"
	"aarch64"
	"armv7h"
)

url="https://github.com/microsoft/vscode"
license=("MIT")

conflicts=("code-oss")
provides=("code-oss")

depends=(
	"libxkbfile"
	"gnupg"
	"gtk3"
	"libsecret"
	"nss"
	"alsa-lib"
	"gcc-libs"
	"libnotify"
	"libxss"
	"glibc"
	"lsof"
	"shared-mime-info"
	"xdg-utils"
)

optdepends=(
	"glib2: Needed for move to trash functionality"
	"libdbusmenu-glib: Needed for KDE global menu"
	"org.freedesktop.secrets: Needed for settings sync"
	"icu69: Needed for live share"
)

makedepends=(
	"git"
	"gulp"
	"npm"
	"python"
	"yarn"
	"nodejs-lts-gallium"
)

source=(
	"${pkgname}::git+${url}.git#branch=main"
	"build-with-chroot.sh"
	"translucent.patch"
)

sha512sums=(
	"SKIP"
	"59f8d08395e384966fb1825bf0b043ec99334e0562d651b3a06f07647e91989bff6800dd857095a5279a5f457acde5be67ff70b878ae9418d5b821dc81b999af"
	"51d20135335ee28c69b917a92a4c5893702cb50d306b6a527eb6dc5c01360810b1332e7e501bf95ef2d014f8caf358f329976ec91c7f38c32f413b38c4574f14"
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
	*)
		_vscode_arch="DUMMY"
		;;
esac

pkgver() {

	echo "${_tag}"

}

prepare() {

	cd "${pkgname}"

	# Checkout git to latest release
	git fetch --tags
	local _commit="$(git rev-list --tags --max-count=1)"
	declare -g _tag="$(git describe --tags "${_commit}")"
	git checkout "${_tag}"

	# Apply patch to source
	patch -p1 < "../translucent.patch"

	# Set the commit and build date
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

}

build() {

	cd "${pkgname}"

	yarn install --arch="${_vscode_arch}"

	gulp --max_old_space_size=8192 --openssl-legacy-provider vscode-linux-${_vscode_arch}-min

}

package() {

	local _appdir="VSCode-linux-${_vscode_arch}"

	install -d "${pkgdir}/usr/share/"{licenses/${pkgname},metainfo,mime/packages,applications,icons}
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/bin"

	install -m 644 "${_appdir}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -m 644 "${_appdir}/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"

	install -m 644 "${pkgname}/resources/linux/code.appdata.xml" "${pkgdir}/usr/share/metainfo/code-oss.appdata.xml"
	install -m 644 "${pkgname}/resources/linux/code-workspace.xml" "${pkgdir}/usr/share/mime/packages/code-oss-workspace.xml"
	install -m 644 "${pkgname}/resources/linux/code.desktop" "${pkgdir}/usr/share/applications/code-oss.desktop"
	install -m 644 "${pkgname}/resources/linux/code-url-handler.desktop" "${pkgdir}/usr/share/applications/code-oss-url-handler.desktop"

	install -m 644 "${_appdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/code.png"

	install -Dm 644 "${_appdir}/resources/completions/bash/code-oss" "${pkgdir}/usr/share/bash-completion/completions/code-oss"
	install -Dm 644 "${_appdir}/resources/completions/zsh/_code-oss" "${pkgdir}/usr/share/zsh/site-functions/_code-oss"

	cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_appdir}/"* "${pkgdir}/opt/${pkgname}" -R

	ln -sf "/opt/${pkgname}/bin/code-oss" "${pkgdir}/usr/bin/code-oss"

}
