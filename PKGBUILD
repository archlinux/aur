# Maintainer oech3
# Contributor: Darkest Medium <darkestmedium at gmail dot com>

pkgname=void-git
_pkgname=void
pkgver=1.99.3.r2519.g906502f6
pkgrel=2
pkgdesc="The Cursor alternative AI code editor (electron36+)"
url="https://voideditor.com/"
arch=('x86_64')
license=("MIT")
provides=('void')
conflicts=('void')
depends=( ripgrep xdg-utils # replacements
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
makedepends=( electron nodejs-lts-jod
  git npm pkgconf python )
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
  # for electron35+ app.dock is only for macOS
  sed -i '/app\.dock\.setMenu/i\// @ts-ignore' src/vs/platform/menubar/electron-main/menubar.ts
  # Clean npm cache and remove existing node_modules
  npm cache clean --force
  rm -rf node_modules
  # Set version of electron
  _elver=$(cat /usr/lib/electron/version)
  _elorig=$(npm pkg get devDependencies.electron|sed 's/"//g')
  sed -i "s/^target=.*/target=\"${_elver}\"/" .npmrc # for native modules
  echo Replacing ${_elorig} with $(rg -N 'target' .npmrc)
  npm pkg set devDependencies.electron=${_elver}
  # Stop downloading 870MB+ bins
  _hash=$(echo -n "https://github.com/electron/electron/releases/download/v${_elver}" | sha256sum | cut -d ' ' -f 1)
  _cachedir="${XDG_CACHE_HOME}/electron/${_hash}"
  _zip="electron-v${_elver}-linux-x64.zip"
  mkdir -p "${_cachedir}"
  bsdtar --format zip -cf "${_cachedir}/${_zip}" /dev/null
  echo $(sha256sum "${_cachedir}/${_zip}" | cut -d " " -f 1) *${_zip} > build/checksums/electron.txt
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  # Build
  npm install
  npm run buildreact # needed by unknown reason
  npm run gulp vscode-linux-x64 #-min # minify cause OOM
}

package() {
  _elver=$(cat /usr/lib/electron/version) # for --repackage
  _elnum=${_elver%%.*}
  depends+=(electron${_elnum})
  _pkg=VSCode-linux-x64
  _app=/usr/share/void/resources/app
  # Licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svf "${_app}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svf "${_app}/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
  # appdata and desktop files
  install -Dm644 "${_pkg}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  #todo cleanup
  install -Dm644 void/scripts/appimage/void.desktop "${pkgdir}/usr/share/applications/void.desktop"
  install -Dm644 void/scripts/appimage/void-url-handler.desktop "${pkgdir}/usr/share/applications/void-url-handler.desktop"
  mkdir -p "${pkgdir}/usr/share/mime/packages"
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
