# Maintainer oech3
# Contributor: Darkest Medium <darkestmedium at gmail dot com>

pkgname=void-git
_pkgname=void
pkgver=.r2771.g17e7a5b1
pkgrel=1
pkgdesc="The Cursor alternative AI code editor"
url="https://github.com/voideditor/void"
arch=('x86_64')
license=("MIT")
provides=('void')
conflicts=('void')
options=(!strip) # for sign of ext
_electron=electron
depends=( ${_electron} ripgrep xdg-utils
	alsa-lib gnupg libnotify libsecret libxkbfile libxss shared-mime-info
)
optdepends=(
  'glib2: Move to trash functionality'
  'gvfs: Move to trash functionality'
  'libdbusmenu-glib: KDE global menu'
  'lsof: Terminal splitting'
  'org.freedesktop.secrets: Settings sync'
)
makedepends=( nodejs-lts-iron # sync with .npmrc
  git npm python
  libarchive make pkgconf) # base base-devel

source=(
	"git+${url}.git"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh"
)
sha256sums=(
	'SKIP'
	'5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.g%s" \
    "$(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}/${_pkgname}"
  # Drop this patch for electron35+ at code 1.101, app.dock is for macOS
  sed -i '/app\.dock\.setMenu/i\// @ts-ignore' src/vs/platform/menubar/electron-main/menubar.ts

  # Fix upstream TS union mismatch (Electron adds 'memory-eviction' reason)
  sed -i "s/'integrity-failure';/'integrity-failure' | 'memory-eviction';/" \
  	src/vs/platform/utilityProcess/electron-main/utilityProcess.ts
}

build() {
  # Don't put broken files on user dir
  export XDG_CACHE_HOME="${srcdir}/xdgcache" TMPDIR="$srcdir"/tmp HOME="${srcdir}/home"
  cd "${srcdir}/${_pkgname}"

  # electron version
  _elver=$(npm pkg get devDependencies.electron)
  _elver=$(cat /usr/lib/${_electron}/version)
  npm pkg set devDependencies.electron=${_elver} # needed ?
  sed -i "s/^target=.*/target=\"${_elver}\"/" .npmrc # native modules
  rg -N 'target' .npmrc

  # Don't DL ripgrep
  _vsrgver=$(npm pkg get dependencies.@vscode/ripgrep | sed 's/[\"^]//g')
  _rgver=13.0.0-10
  mkdir -p "$TMPDIR"/vscode-ripgrep-cache-$_vsrgver
  touch rg # Archived symlink is replaced
  bsdtar -czf "$TMPDIR"/vscode-ripgrep-cache-${_vsrgver}/ripgrep-v${_rgver}-x86_64-unknown-linux-musl.tar.gz rg
  _vsrgver2=1.15.10 # Why DL twice?
  mkdir -p "$TMPDIR"/vscode-ripgrep-cache-$_vsrgver2
  ln -sf "$TMPDIR"/vscode-ripgrep-cache-{${_vsrgver},${_vsrgver2}}/ripgrep-v${_rgver}-x86_64-unknown-linux-musl.tar.gz

  # Don't DL electron
  _cachedir="${XDG_CACHE_HOME}"/electron/$(echo -n "https://github.com/electron/electron/releases/download/v${_elver}" | sha256sum | cut -d ' ' -f 1)
  _zip="electron-v${_elver}-linux-x64.zip"
  mkdir -p "${_cachedir}"
  bsdtar --format zip -cf "${_cachedir}/${_zip}" /dev/null 2> /dev/null
  echo $(sha256sum "${_cachedir}/${_zip}" | cut -d " " -f 1) *${_zip} > build/checksums/electron.txt
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

  # Build
  npm install
  npm run buildreact # needed by unknown reason
  npm run gulp vscode-linux-x64 #-min # minify cause OOM
}

package() {
  _pkg=VSCode-linux-x64
  _app=/usr/share/void/resources/app
  # appdata and desktop files
  install -Dm644 "${_pkg}/resources/app/resources/linux/code.png" \
  	"${pkgdir}/usr/share/icons/hicolor/256x256/apps/void.png"
  install -Dm644 "${srcdir}/${_pkgname}/scripts/appimage/void.desktop" "${pkgdir}/usr/share/applications/void.desktop"
  install -Dm644 "${srcdir}/${_pkgname}/scripts/appimage/void-url-handler.desktop" "${pkgdir}/usr/share/applications/void-url-handler.desktop"
  mkdir -p "${pkgdir}/usr/share/mime/packages"
  sed -e s/@@NAME@@/void/ -e s/@@NAME_LONG@@/Void/g \
  	"${srcdir}/${_pkgname}/resources/linux/code-workspace.xml" > "${pkgdir}/usr/share/mime/packages/void-workspace.xml"
  # shell completions
  install -Dm644 "${_pkg}/resources/completions/bash/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkg}/resources/completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  # launcher (code-oss style): ~/.config/void-flags.conf
  sed -e "s#code-flags#void-flags#" \
  	-e "s#/usr/lib/code/out/cli.js#${_app}/out/cli.js#" \
  	-e "s#/usr/lib/code/code.mjs#--app=${_app}#" code.sh > run.sh
  install -Dm755 run.sh "${pkgdir}/usr/bin/void"
  # Install editor on /usr/share for compability with void-bin
  install -d "${pkgdir}/usr/share/void"
  cp -r --reflink=auto "${_pkg}/resources" "${pkgdir}/usr/share/void/resources"
  ln -sf /usr/bin/void "${pkgdir}/usr/share/void/void"

  # Avoid packaging warnings: strip build path from bundled extension output
  sed -i "s|${srcdir}|/usr/share/void/resources/app|g" \
  	"${pkgdir}/usr/share/void/resources/app/extensions/microsoft-authentication/dist/extension.js"
  # system-wide tools
  ln -svf /usr/bin/rg "${pkgdir}${_app}"/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open "${pkgdir}${_app}"/node_modules/open/xdg-open
  # Licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  mv -v "${pkgdir}${_app}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv -v "${pkgdir}${_app}/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
