# Maintainer: David Čuček <observ33r@gmail.com>

pkgname="code-translucent"
pkgver=1.71.2
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
	"1115cd219b855241270191c0b1e03fd567a5bfa7d77041bdeb70bd0ed6a08b01cfbdf7f45cda0153eada4f49429300bd8e09611f5ce185d0d4718a3dadf09263"
	"2a466f530c78dd498d7af9aa7ced8057468283682912368c5a0d4e694feffe1079e345882a64fe9d2849a5da5d00b5d262e8b5c5d45f77965d1c6e9edadad512"
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
	declare -g _tag="$(git describe --tags ${_commit})"
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

	gulp compile-build
	gulp vscode-linux-${_vscode_arch}-min

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

	install -m 644 "${_appdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/code-oss.png"

	install -Dm 644 "${_appdir}/resources/completions/bash/code-oss" "${pkgdir}/usr/share/bash-completion/completions/code-oss"
	install -Dm 644 "${_appdir}/resources/completions/zsh/_code-oss" "${pkgdir}/usr/share/zsh/site-functions/_code-oss"

	cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${_appdir}/"* "${pkgdir}/opt/${pkgname}" -R

	ln -sf "/opt/${pkgname}/bin/code-oss" "${pkgdir}/usr/bin/code-oss"

}
