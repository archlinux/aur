# Maintainer: Darkest Medium <darkestmedium@gmail.com>

# Package reference:
#  https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=visual-studio-code-bin
#  https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=vscodium-git
#  https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=code-git

pkgname=void-git
_pkgname=void
pkgver=1.94.0
pkgrel=1
pkgdesc="Void is the open-source Cursor alternative. This repo contains the full sourcecode for Void. We have a waitlist for downloading the official release, but you can build and develop Void right now. https://voideditor.com/"
url="https://voideditor.com/"
arch=('x86_64' 'aarch64' 'armv7h')
license=("MIT")
provides=('void')
options=(!strip !debug)
# lsof: needed for terminal splitting, see https://github.com/Microsoft/vscode/issues/62991
# xdg-utils: needed for opening web links with xdg-open
depends=(
	libx11
	libxkbfile
	libsecret
	gnupg
	gtk3
	nss
	gcc-libs
	libnotify
	libxss
	glibc
	lsof
	shared-mime-info
	xdg-utils
	alsa-lib
)
optdepends=(
	'glib2: Needed for move to trash functionality'
	'gvfs: For move to trash functionality'
	'libdbusmenu-glib: For KDE global menu'
	'org.freedesktop.secrets: Needed for settings sync'
	# See https://github.com/MicrosoftDocs/live-share/issues/4650
	'icu69: Needed for live share'
)
makedepends=(
	'base-devel'
	'libx11'
	'libxkbfile'
	'libsecret'
	'npm'
	'nodejs'
	'pkg-config'
)
source=(
	"git+https://github.com/voideditor/void.git"
	# "code.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code.desktop"
	# "code-url-handler.desktop.in::https://raw.githubusercontent.com/microsoft/vscode/${pkgver}/resources/linux/code-url-handler.desktop"
	# "code-workspace.xml.in::https://raw.githubusercontent.com/microsoft/vscode/1.94.0/resources/linux/code-workspace.xml"
)
sha256sums=("SKIP")

###############################################################################
# Even though we don't officially support other archs, let's allow the
# user to use this PKGBUILD to compile the package for their architecture.
case "$CARCH" in
	i686)
		_vscode_arch=ia32
		_electron_arch=ia32
		;;
	x86_64)
		_vscode_arch=x64
		_electron_arch=x64
		;;
	armv7h)
		_vscode_arch=arm
		_electron_arch=armv7l
		;;
	riscv64)
		_vscode_arch=riscv64
		_electron_arch=riscv64
		;;
	*)
		# Needed for mksrcinfo
		_vscode_arch=DUMMY
		_electron_arch=DUMMY
		;;
esac


_set_meta_info() {
	sed 's/@@NAME_LONG@@/Void/g' "$1" |\
	sed 's/@@NAME_SHORT@@/Void/g' |\
	sed 's/@@NAME@@/void/g' |\
	sed 's#@@EXEC@@#/usr/bin/void#g' |\
	sed 's/@@ICON@@/void/g' |\
	sed 's/@@URLPROTOCOL@@/vscode/g'
}

_pkg() {
	if [ "${CARCH}" = "aarch64" ]; then
		echo 'VSCode-linux-arm64'
	elif [ "${CARCH}" = "armv7h" ]; then
		echo 'VSCode-linux-armhf'
	elif [ "${CARCH}" = "i686" ]; then
		echo 'VSCode-linux-ia32'
	else
		echo 'VSCode-linux-x64'
	fi
}

# Automatically update pkgver based on latest Git commit
pkgver() {
	cd "${srcdir}/${_pkgname}"
	# People love to complain, so here's a complex version that still
	# increases monotonically by commit but also has the package.json
	# version instead of the most recent tag...
	printf "%s.r%s.g%s" \
		"$(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

	# Just return the version from package.json (major.minor.patch)
	# awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json
}

prepare() {
# Generate our own entries for now - we need to align it like this cause it will output the tabs too
echo '[Desktop Entry]
Name=@@NAME_LONG@@
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=@@EXEC@@ %F
Icon=@@ICON@@
Type=Application
StartupNotify=false
StartupWMClass=@@NAME_SHORT@@
Categories=TextEditor;Development;IDE;
MimeType=application/x-@@NAME@@-workspace;
Actions=new-empty-window;
Keywords=vscode;

[Desktop Action new-empty-window]
Name=New Empty Window
Name[de]=Neues leeres Fenster
Name[es]=Nueva ventana vacía
Name[fr]=Nouvelle fenêtre vide
Name[it]=Nuova finestra vuota
Name[ja]=新しい空のウィンドウ
Name[ko]=새 빈 창
Name[ru]=Новое пустое окно
Name[zh_CN]=新建空窗口
Name[zh_TW]=開新空視窗
Exec=@@EXEC@@ --new-window %F
Icon=@@ICON@@' | tee "${srcdir}/${_pkgname}.desktop.in"

echo '[Desktop Entry]
Name=@@NAME_LONG@@ - URL Handler
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=@@EXEC@@ --open-url %U
Icon=@@ICON@@
Type=Application
NoDisplay=true
StartupNotify=true
Categories=Utility;TextEditor;Development;IDE;
MimeType=x-scheme-handler/@@URLPROTOCOL@@;
Keywords=vscode;' | tee "${srcdir}/${_pkgname}-url-handler.desktop.in"

echo '<?xml version="1.0" encoding="utf-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-@@NAME@@-workspace">
    <comment>@@NAME_LONG@@ Workspace</comment>
    <glob pattern="*.code-workspace"/>
  </mime-type>
</mime-info>' | tee "${srcdir}/${_pkgname}-workspace.xml.in"

_set_meta_info "${srcdir}/${_pkgname}.desktop.in" > "${srcdir}/${_pkgname}.desktop"
_set_meta_info "${srcdir}/${_pkgname}-url-handler.desktop.in" > "${srcdir}/${_pkgname}-url-handler.desktop"
_set_meta_info "${srcdir}/${_pkgname}-workspace.xml.in" > "${srcdir}/${_pkgname}-workspace.xml"

# Generate launcher
echo '#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/void-flags.conf ]]; then
   CODE_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/void-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/void/bin/void "$@" $CODE_USER_FLAGS' | tee "${srcdir}/${_pkgname}/${_pkgname}"

}

build() {
	cd "${srcdir}/${_pkgname}"

	# Remove old build - do we need this?
	if [ -d "vscode" ]; then
		rm -rf vscode* VSCode*
	fi
	# Clean npm cache and remove existing node_modules
	npm cache clean --force
	rm -rf node_modules package-lock.json

	# Install dependencies with legacy peer deps flag to handle dependency conflicts
	npm install --arch=$_vscode_arch --legacy-peer-deps
	npm install ajv@latest ajv-keywords@latest --legacy-peer-deps

	# Build react because it fails for some reason
	npm run buildreact

	# Bundle it
	npm run gulp vscode-linux-$_vscode_arch
}

package() {
	_pkg=VSCode-linux-x64
	if [ "${CARCH}" = "aarch64" ]; then
		_pkg=VSCode-linux-arm64
	fi
	if [ "${CARCH}" = "armv7h" ]; then
		_pkg=VSCode-linux-armhf
	fi
	if [ "${CARCH}" = "i686" ]; then
		_pkg=VSCode-linux-ia32
	fi

	# Create directories
  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -d "${pkgdir}/usr/share/mime/packages"

	# Install license files
  install -m644 "${srcdir}/$(_pkg)/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
	install -m644 "${srcdir}/$(_pkg)/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/ThirdPartyNotices.txt"

	# Install appdata and desktop files
  install -m644 "${srcdir}/$(_pkg)/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/${_pkgname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
  install -m644 "${srcdir}/${_pkgname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}-workspace.xml"

	# Install bash and zsh completions
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/bash/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm 644 "${srcdir}/$(_pkg)/resources/completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

	# Install app files and binaries
  cp -r "${srcdir}/$(_pkg)/"* "${pkgdir}/opt/${_pkgname}"

  # Install launcher
  cp "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	# ln -sf "${pkgdir}/opt/${_pkgname}/bin/code-oss" "${pkgdir}/usr/bin/${_pkgname}"

	# Permissions for executable files
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/bin/${_pkgname}"
}


post_install() {
	update-desktop-database -q
	xdg-icon-resource forceupdate
}
