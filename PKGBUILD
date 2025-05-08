# Contributor: Darkest Medium <darkestmedium at gmail dot com>

pkgname=void-git
_pkgname=void
pkgver=1.99.3.r2381.g77d174ed
pkgrel=1
pkgdesc="The open-source Cursor alternative"
url="https://voideditor.com/"
arch=('x86_64')
license=("MIT")
provides=('void')
options=(!debug)
_elnum=34
depends=( electron${_elnum} ripgrep # replacements
  libx11
  libxkbfile
  libsecret
  gnupg
  libnotify
  libxss
  shared-mime-info
  alsa-lib
)
optdepends=(
  'electron: /usr/share/void/void-latestron'
  'glib2: Move to trash functionality'
  'gvfs: Move to trash functionality'
  'libdbusmenu-glib: KDE global menu'
  'lsof: Terminal splitting'
  'xdg-utils: Opening web links'
  'org.freedesktop.secrets: Settings sync'
)
makedepends=(
  npm
  nodejs-lts-iron # see .nvmrc
  pkgconf
)
source=("git+https://github.com/voideditor/void.git"
"https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('SKIP'
'5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')

pkgver() {
  cd "${_pkgname}"
  printf "%s.r%s.g%s" $(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json) \
    $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${_pkgname}"
  # Clean npm cache and remove existing node_modules
  npm cache clean --force
  rm -rf node_modules
  # Use version of system electron
  npm install electron@$(cat /usr/lib/electron${_elnum}/version) --save-dev
  # Install dependencies with legacy peer deps flag to handle dependency conflicts
  npm install --legacy-peer-deps
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
  mkdir -p "${pkgdir}/usr/share/"{applications,mime/packages}
  #todo cleanup
  sed -e s/@@NAME@@/void/ -e s/@@EXEC@@/void/g -e s/@@ICON@@/void/g -e s/@@NAME_SHORT@@/Void/g -e s/@@NAME_LONG@@/Void/g \
  	void/resources/linux/code.desktop > "${pkgdir}/usr/share/applications/void.desktop"
  sed -e s/@@NAME_LONG@@/Void/ -e s/@@EXEC@@/void/ -e s/@@ICON@@/void/ -e s/@@URLPROTOCOL@@/vscode/ \
    void/resources/linux/code-url-handler.desktop > "${pkgdir}/usr/share/applications/void-url-handler.desktop"
  sed -e s/@@NAME@@/void/ -e s/@@NAME_LONG@@/Void/g \
  	void/resources/linux/code-workspace.xml > "${pkgdir}/usr/share/mime/packages/void-workspace.xml"
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
  # ripgrep
  ln -svf /usr/bin/rg "${pkgdir}"/usr/share/void/resources/app/node_modules/@vscode/ripgrep/bin/rg
}
