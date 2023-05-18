# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider
pkgver=1.6.1
pkgrel=6
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Compiled from the GitHub repositories ${_pkgbranch} branch."
arch=("armv7h" "i686" "x86_64")

_repo="Cider"
_author="CiderApp"
_branch="main"

url="https://github.com/${_author}/${_repo}"
license=('GPL')
optdepends=('libnotify: Playback notifications')
makedepends=('npm' 'nvm' 'fontconfig' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+https://github.com/${_author}/${_repo}.git#branch=${_branch}"
    "${pkgname%-git}.desktop"
)
sha256sums=('SKIP'
            'c41e9b1019411019fce8509e32f770edf33c9e864bf707c30ffe2e3f2dcf1571')

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${pkgname}-core-${pkgver}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s.r%s.%s" "$(awk -F'"' '/"version": ".+"/{ print $4; exit; }' package.json)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  _ensure_local_nvm
  cd "${srcdir}/${pkgname%-git}"
  nvm install
}

build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}"
    git submodule update --init
    npm run bootstrap
    npm run dist
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    # Desktop File
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    # Install the icon
    install -Dm644 "${srcdir}/${pkgname%-git}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    # Install the build files
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"

    cd ${srcdir}/${pkgname%-git}/dist/linux-unpacked/
    mkdir "${pkgdir}/opt/${pkgname%-git}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"

    # License and Readme
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${pkgname%-git}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
