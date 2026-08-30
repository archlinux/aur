# Maintainer: ninni <soelder@hotmail.com>
pkgname=awakened-poe-trade-git
pkgver=3.29.107.r16.gf5985f7c
pkgrel=1
pkgdesc='Path of Exile trading app for price checking'
arch=('x86_64')
url='https://github.com/SnosMe/awakened-poe-trade'
license=('MIT')
depends=()
makedepends=('git' 'node-gyp' 'nvm' 'libxtst' 'libpng')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('awakened-poe-trade.desktop' 'awakened-poe-trade-browser.desktop' 'git+https://github.com/SnosMe/awakened-poe-trade.git')
md5sums=('2eab8c2ffd753ffa92c4d29afd40357e' 'a1f76ef3919af54e7d3d0d9d41539320' 'SKIP')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
  cd "${srcdir}/awakened-poe-trade"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/awakened-poe-trade"
  # LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
  # git checkout $LATEST_TAG
  _ensure_local_nvm
  nvm install 24
}

build() {
  cd "${srcdir}/awakened-poe-trade"
  _ensure_local_nvm

  cd "${srcdir}/awakened-poe-trade/renderer"
  npm ci
  npm run build

  cd "${srcdir}/awakened-poe-trade/main"
  npm ci
  npm run build
  npm run package
}

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/bin"

  cp ${srcdir}/awakened-poe-trade/main/dist/*.AppImage ${pkgdir}/usr/bin/awakened-poe-trade
  cp ${srcdir}/awakened-poe-trade/main/build/icons/icon.ico ${pkgdir}/usr/share/pixmaps/awakened-poe-trade.ico
  cp ${srcdir}/awakened-poe-trade.desktop ${pkgdir}/usr/share/applications/awakened-poe-trade.desktop
  cp ${srcdir}/awakened-poe-trade-browser.desktop ${pkgdir}/usr/share/applications/awakened-poe-trade-browser.desktop
}

post_install() {
  update-mime-database
  update-desktop-database
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}
