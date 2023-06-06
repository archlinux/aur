# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider
pkgver=1.6.1
pkgrel=7
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Build from tar file on GitHub releases."
arch=(x86_64)
url="https://github.com/ciderapp/${pkgname}.git"
license=(AGPL3)
depends=(gtk3 nss alsa-lib libxcrypt-compat)
optdepends=('libnotify: Playback notifications')
makedepends=(npm nvm fontconfig yarn)
provides=(${pkgname})
conflicts=(${pkgname})
source_x86_64=("https://github.com/ciderapp/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums_x86_64=('162fed4df8a47aca47e68bd42779204e1f323b322b63ce094989b59b94a2a547')

_ensure_local_nvm() {
  # lets be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

  export NVM_DIR="${srcdir}/${pkgname}-core-${pkgver}/.nvm"
  # The init script returns 3 if version
  #   specified in ./.nvrc is not (yet) installed in $NVM_DIR
  #   but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  _ensure_local_nvm
  nvm install
}

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  _ensure_local_nvm
  npx -y check-engine && yarn install && yarn dist && mv dist/*.deb "${srcdir}/" && cd "${srcdir}"
  ar x ${pkgname}_${pkgver}_amd64.deb data.tar.xz
}

package() {
  # Extract package data
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  mv "${pkgdir}/opt/${_pkgname^}" "${pkgdir}/opt/${pkgname}"

  # Symlink the binary
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
