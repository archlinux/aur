# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider-git
_pkgname=cider
pkgver=1.6.2
pkgrel=9
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Build from tar file on GitHub releases."
arch=(x86_64)
url="https://github.com/ciderapp/${_pkgname}.git"
license=(AGPL3)
depends=(gtk3 nss alsa-lib libxcrypt-compat)
optdepends=('libnotify: Playback notifications')
makedepends=(nvm fontconfig git)
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("${_pkgname}::git+https://github.com/ciderapp/${_pkgname}.git")
sha256sums_x86_64=('SKIP')

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${_pkgname}-core-${pkgver}/.nvm"
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
  cd "${srcdir}/${_pkgname}"
  _ensure_local_nvm
  nvm install
  corepack enable
  corepack prepare yarn@stable --activate
}

build() {
  cd "${srcdir}/${_pkgname}"
  _ensure_local_nvm
  npx -y check-engine && yarn install && yarn dist && mv dist/*.deb "${srcdir}/" && cd "${srcdir}"
  ar x ${_pkgname}_*_amd64.deb data.tar.xz
}
 
package() {
  # Extract package data
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  # mv "${pkgdir}/opt/${_pkgname^}" "${pkgdir}/opt/${pkgname}" # Disabled as breaks desktop file

  # Symlink the binary
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/${_pkgname^}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Echo documentation to user
  echo "To change the port that Cider uses, CIDER_PORT environment variable can be set."
}
