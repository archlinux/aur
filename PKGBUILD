# Maintainer: zhizhizhiwang <zhizhiwang@proton.me>
# Contributor: Star_caorui <Star_caorui@hotmail.com>
pkgname=mcsm-daemon-git
pkgver=r4162.c685d8ca
pkgrel=1
pkgdesc="MCSManager 的守护（daemon）程序模块。"
arch=(any)
url="https://github.com/MCSManager/MCSManager"
license=(Apache-2.0)
install=$pkgname.install
depends=('nodejs>=16')
makedepends=('npm' 'git')
source=('file://mcsm-daemon.service'
        "mcsm::git+https://github.com/MCSManager/MCSManager")
sha256sums=('56a03d9b7a65fcbb41c3d19433a0e8dc4f99f909470691c4792399957d3323b8'
            'SKIP')
backup=("opt/mcsmanager/daemon/data/")

pkgver() {
  cd mcsm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "mcsm"
  npm run preview-build
  rm -rf production-code
  rm -rf ./daemon/dist ./daemon/production
  mkdir production-code
  mkdir production-code/daemon
  cd daemon
  npm install 
  npm run build
  cd ..
  mv "daemon/production/app.js" "production-code/daemon"
  mv "daemon/production/app.js.map" "production-code/daemon"
  cp -f "daemon/package.json" "production-code/daemon/package.json"
  cp -f "daemon/package-lock.json" "production-code/daemon/package-lock.json"
  cd "production-code/daemon"
  npm install --production 
}

package() {
  install -Dm644 mcsm-daemon.service "${pkgdir}/usr/lib/systemd/system/mcsm-daemon.service"
  install -Dm644 "${srcdir}/mcsm/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/opt/mcsmanager"
  cp -r "${srcdir}/mcsm/production-code/daemon" "${pkgdir}/opt/mcsmanager/"
}
