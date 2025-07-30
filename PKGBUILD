# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mattermost-plugin-onlyoffice
pkgver=2.0.0
pkgrel=1
pkgdesc='The app which enables the users to edit office documents from Mattermost using ONLYOFFICE Document Server, allows multiple users to collaborate in real time and to save back those changes to Mattermost'
arch=('x86_64')
url="https://github.com/ONLYOFFICE/onlyoffice-mattermost"
license=("Apache")
makedepends=('nvm' 'go')
source=("https://github.com/ONLYOFFICE/onlyoffice-mattermost/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('366529aaaec85ca9f0fd5fe47f43681132af635b300a9067600e334b79d4c05c72ef2cb9f497e9ca554760246dd5305329c8b14d4294d84d2519e6caa594ed52')

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
