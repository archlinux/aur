# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mattermost-plugin-onlyoffice
pkgver=2.1.0
pkgrel=1
pkgdesc='The app which enables the users to edit office documents from Mattermost using ONLYOFFICE Document Server, allows multiple users to collaborate in real time and to save back those changes to Mattermost'
arch=('x86_64')
url="https://github.com/ONLYOFFICE/onlyoffice-mattermost"
license=("Apache")
makedepends=('nvm' 'go')
source=("https://github.com/ONLYOFFICE/onlyoffice-mattermost/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('575f29f4531e510d5d10010e95ad184baa00b3423a19b17774249319389c20391bc4b960aed74e361c81dcfaa3d9d04be82540850958e6ee81f75669f15b7954')

build() {
  cd "${srcdir}/onlyoffice-mattermost-${pkgver}/webapp"
  source /usr/share/nvm/init-nvm.sh
  nvm install 20
  nvm use 20
#  npm install --legacy-peer-deps --no-audit --no-fund --no-optional --force --ignore-scripts
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
