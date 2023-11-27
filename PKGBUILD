# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=owntracks-frontend
pkgver=2.12.0
pkgrel=1
pkgdesc='Web interface for OwnTracks built with Vue.js'
arch=('any')
url='https://github.com/owntracks/frontend'
makedepends=('nvm' 'yarn')
optdepends=('owntracks-recorder: Server for OwnTracks')
backup=('etc/owntracks-frontend/config.js')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/owntracks/frontend/archive/refs/tags/v${pkgver}.tar.gz"
)
install=install.sh
sha256sums=('1695c3e39f5b276fc6d07c7685eaa3df033e37979b240bc8422663e8aa22e130')

prepare() {
  # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
  command -v nvm >/dev/null && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

  # Install the correct version of NodeJS
  # See https://github.com/owntracks/frontend/blob/f5389b84abbd4ab203502e7813252181835612ea/.github/workflows/build.yml#L12
  nvm install 14
  nvm use 14

  cd "${srcdir}/frontend-${pkgver}"
  yarn install
}

build() {
  # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
  command -v nvm >/dev/null && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm use 14

  cd "${srcdir}/frontend-${pkgver}"
  yarn build
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r "${srcdir}"/frontend-${pkgver}/dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}

