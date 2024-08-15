# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=owntracks-frontend
pkgver=2.15.3
pkgrel=1
pkgdesc='Web interface for OwnTracks built with Vue.js'
arch=('any')
url='https://github.com/owntracks/frontend'
makedepends=('nvm' 'npm')
optdepends=('owntracks-recorder: Server for OwnTracks')
backup=('etc/owntracks-frontend/config.js')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/owntracks/frontend/archive/refs/tags/v${pkgver}.tar.gz"
)
install=install.sh
sha256sums=('7ceaaf15dda4a614a94c94e20104a94d422020466ebbeb1ac21d573c26acd9f2')

prepare() {
  # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
  command -v nvm >/dev/null && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

  # Install the correct version of NodeJS
  # See https://github.com/owntracks/frontend/blob/5ecad2bf40959350067722f2bb1173f5168b39a1/.github/workflows/build.yml#L12
  nvm install 20
  nvm use 20

  cd "${srcdir}/frontend-${pkgver}"
  npm install
}

build() {
  # Deactivate any pre-loaded nvm, and make sure we use our own in the current source directory
  command -v nvm >/dev/null && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm use 20

  cd "${srcdir}/frontend-${pkgver}"
  npm run build
}

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -r "${srcdir}"/frontend-${pkgver}/dist/* "${pkgdir}/usr/share/webapps/${pkgname}"

  mkdir -p "${pkgdir}/etc"
  cp "${pkgdir}"/usr/share/webapps/${pkgname}/config/config{.example.js,.js}

  ln -s /usr/share/webapps/${pkgname}/config/config.js "${pkgdir}"/etc/${pkgname}.config.js
}

