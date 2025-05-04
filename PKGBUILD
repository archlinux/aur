# Contributor: Darkest Medium <darkestmedium@gmail.com>

pkgname=void-git
_pkgname=void
pkgver=1.99.3.r2303.gcf0728f4
pkgrel=3
pkgdesc="The open-source Cursor alternative."
url="https://voideditor.com/"
arch=('x86_64')
license=("MIT")
provides=('void')
options=(!strip !debug)
_elnum=34
depends=(
	electron${_elnum}
	libx11
	libxkbfile
	libsecret
	gnupg
	libnotify
	libxss
	lsof #terminal splitting (https://github.com/Microsoft/vscode/issues/62991)
	shared-mime-info
	xdg-utils # opening web links
	alsa-lib
)
optdepends=(
	'electron: /usr/share/void/void-latestron'
	'glib2: Move to trash functionality'
	'gvfs: Move to trash functionality'
	'libdbusmenu-glib: KDE global menu'
	'org.freedesktop.secrets: Settings sync'
)
makedepends=(
	'libx11'
	'libxkbfile'
	'libsecret'
	'npm'
	'nodejs'
	'pkg-config'
)
source=(
	"git+https://github.com/voideditor/void.git"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh"
	void.desktop void-url-handler.desktop void-workspace.xml #Should be sed from somewhere
)
sha256sums=('SKIP'
            '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1'
            'c3de56aceff283c14fc0f759b720cf9d48fdef2d2a38f471c667c78e955018fe'
            'e2c84fc25e89512e3d8be73c289b65a40f7b7861738a4a77d7ac203e970c9f6d'
            'b58ae1868daaf93132ec8e51869b7fc1aa0b91e6e785bb73ce561babcd078b41')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.g%s" $(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json) \
		$(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
	#export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	cd "${_pkgname}"
	# Clean npm cache and remove existing node_modules
	npm cache clean --force
	rm -rf node_modules
	npm install electron@$(cat /usr/lib/electron${_elnum}/version) --save-dev
	# Install dependencies with legacy peer deps flag to handle dependency conflicts
	npm install --legacy-peer-deps
	npm install ajv@latest ajv-keywords@latest --legacy-peer-deps

	# Build react because it fails for some reason
	npm run buildreact

	# Bundle it
	npm run gulp vscode-linux-x64
}

package() {
  _pkg=VSCode-linux-x64
  # Licenses
  install -Dm644 "${_pkg}/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkg}/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/ThirdPartyNotices.txt"
  # appdata and desktop files
  install -Dm644 "${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -Dm644 void.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 void-url-handler.desktop "${pkgdir}/usr/share/applications/${_pkgname}-url-handler.desktop"
  install -Dm644 void-workspace.xml "${pkgdir}/usr/share/mime/packages/${_pkgname}-workspace.xml"
  # shell completions
  install -Dm644 "${_pkg}/resources/completions/bash/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkg}/resources/completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  # launcher
  _app=/usr/share/void/resources/app
  sed -e "s|code-flags|void-flags|" \
   -e "s|/usr/lib/code/out/cli.js|${_app}/out/cli.js|" \
   -e "s|/usr/lib/code/code.mjs|--app=${_app}|" code.sh > run.sh
  sed "s/name=electron/name=electron${_elnum}/" run.sh > run-safe.sh
  install -Dm755 run-safe.sh "${pkgdir}/usr/bin/void"
  install -Dm755 run.sh "${pkgdir}/usr/share/void/void-latestron"
  # resources
  cp -r --reflink=auto "${_pkg}/resources" "${pkgdir}/usr/share/void/resources"
}
