# Maintainer oech3
# Contributor: Darkest Medium <darkestmedium at gmail dot com>

pkgname=void-git
_pkgname=void
pkgver=1.99.3.r2519.g906502f6
pkgrel=1
pkgdesc="The Cursor alternative"
url="https://voideditor.com/"
arch=('x86_64')
license=("MIT")
provides=('void')
conflicts=('void')
_elnum=34 #35+ will fail
depends=( electron${_elnum} ripgrep xdg-utils # replacements
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
  'glib2: Move to trash functionality'
  'gvfs: Move to trash functionality'
  'libdbusmenu-glib: KDE global menu'
  'lsof: Terminal splitting'
  'org.freedesktop.secrets: Settings sync'
)
makedepends=(
  git
  npm
  nodejs-lts-iron # see .nvmrc
  pkgconf
  python
)
source=("git+https://github.com/voideditor/void.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.r%s.g%s" $(awk 'match($0,/"version":\s*"([^"]+)"/,v) {print v[1]}' package.json) \
    $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  # Do not tain user dir by cache
  export XDG_CACHE_HOME="${srcdir}/xdgcache" HOME="${srcdir}/home"
  cd "${_pkgname}"
  # Clean npm cache and remove existing node_modules
  npm cache clean --force
  rm -rf node_modules
  # Set version of electron
  _elver=$(cat /usr/lib/electron${_elnum}/version)
  echo Replacing $(rg -m 1 '"electron":\s*"[0-9]+' package.json) with ${_elver}
  echo 'Fix if major version is wrong.'
  npm pkg set devDependencies.electron=${_elver}
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  # Build
  npm install --legacy-peer-deps # to handle dependency conflicts
  npm run buildreact # needed by unknown reason
  # Rebuilding modules for bumped electron will fail
  # npm install -D electron-rebuild
  # npx electron-rebuild -f
  npm run gulp vscode-linux-x64 #-min # minify cause OOM
}

package() {
  _pkg=VSCode-linux-x64
  _app=/usr/share/void/resources/app
  # Licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svf "${_app}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svf "${_app}/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
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
  sed -e "s|exec /usr|ELECTRON_RUN_AS_NODE=1 exec /usr|" \
      -e "s|flags=()|flags=(${_app}/out/cli.js --app=${_app})|" \
      /usr/bin/electron${_elnum} > run.sh # should be supported by electron$_elnum
  install -Dm755 run.sh "${pkgdir}/usr/bin/void"
  # Install editor on /usr/share for compability with void-bin
  install -d "${pkgdir}/usr/share/void"
  cp -r --reflink=auto "${_pkg}/resources" "${pkgdir}/usr/share/void/resources"
  # system-wide tools
  ln -svf /usr/bin/rg "${pkgdir}${_app}"/node_modules/@vscode/ripgrep/bin/rg
  ln -svf /usr/bin/xdg-open "${pkgdir}${_app}"/node_modules/open/xdg-open
}
