# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mattermost-plugin-onlyoffice
pkgver=1.2.0
pkgrel=1
pkgdesc='The app which enables the users to edit office documents from Mattermost using ONLYOFFICE Document Server, allows multiple users to collaborate in real time and to save back those changes to Mattermost'
arch=('x86_64')
url="https://github.com/ONLYOFFICE/onlyoffice-mattermost"
license=("Apache")
makedepends=('nvm' 'go')
source=("https://github.com/ONLYOFFICE/onlyoffice-mattermost/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e04670719f8fe35a9d6ee611a97e35b7c941756311849c7d3eb98d48e6592f90530f789348b73d313be176e64567e6db8247b4e25bb9909b56653c12f65c15bc')

build() {
  cd "${srcdir}/onlyoffice-mattermost-${pkgver}/webapp"
  source /usr/share/nvm/init-nvm.sh
  nvm install 15
  nvm use 15
  npm install --legacy-peer-deps
  cd "${srcdir}/onlyoffice-mattermost-${pkgver}"
  make dist
}

package() {
  find ${srcdir}/onlyoffice-mattermost-${pkgver}/dist/com.onlyoffice.mattermost/server/dist/ -maxdepth 1 ! -name 'plugin-linux-amd64' -type f -exec rm -f {} +
  install -Dm644 "${srcdir}/onlyoffice-mattermost-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm0755 "${pkgdir}/var/lib/mattermost/plugins/"
  cp -r "${srcdir}/onlyoffice-mattermost-${pkgver}/dist/com.onlyoffice.mattermost" "${pkgdir}/var/lib/mattermost/plugins/"
}
