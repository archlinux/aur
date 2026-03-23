# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mattermost-plugin-onlyoffice
pkgver=2.2.0
pkgrel=1
pkgdesc='The app which enables the users to edit office documents from Mattermost using ONLYOFFICE Document Server, allows multiple users to collaborate in real time and to save back those changes to Mattermost'
arch=('x86_64')
url="https://github.com/ONLYOFFICE/onlyoffice-mattermost"
license=("Apache")
makedepends=('nvm' 'go')
source=("https://github.com/ONLYOFFICE/onlyoffice-mattermost/archive/refs/tags/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ONLYOFFICE/document-formats/refs/heads/master/onlyoffice-docs-formats.json")
sha512sums=('94e1e723126f19e099aa15d619ef8c0e497af79a2881b92edd8cfb50aedf4477514e9358316c664d1fd63721abb82156373302c3cd888c62a26b7f41ac897477'
            'bbea436f92a3ef785ef482f1014b27f049fbcbebf288d9fe1f96661014e7afdd48dfb6b955742adbdc20cc376eccce8793f9b0489338d7892ced94cf6b075a45')

build() {
  install -D onlyoffice-docs-formats.json "${srcdir}/onlyoffice-mattermost-${pkgver}/public/formats/onlyoffice-docs-formats.json"
  cd "${srcdir}/onlyoffice-mattermost-${pkgver}/webapp"
  source /usr/share/nvm/init-nvm.sh
  nvm install 20
  nvm use 20
#  npm install --legacy-peer-deps --no-audit --no-fund --no-optional --force --ignore-scripts
  npm install --legacy-peer-deps
  cd "${srcdir}/onlyoffice-mattermost-${pkgver}"
#  git submodule update --init --recursive
  make dist
}

package() {
  find ${srcdir}/onlyoffice-mattermost-${pkgver}/dist/com.onlyoffice.mattermost/server/dist/ -maxdepth 1 ! -name 'plugin-linux-amd64' -type f -exec rm -f {} +
  install -Dm644 "${srcdir}/onlyoffice-mattermost-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm0755 "${pkgdir}/var/lib/mattermost/plugins/"
  cp -r "${srcdir}/onlyoffice-mattermost-${pkgver}/dist/com.onlyoffice.mattermost" "${pkgdir}/var/lib/mattermost/plugins/"
}
