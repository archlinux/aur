# Maintainer: zhizhizhiwang <zhizhiwang@proton.me>
# Contributor: Star_caorui <Star_caorui@hotmail.com>
pkgname=mcsm-web-git
pkgver=r4162.c685d8ca
pkgrel=1
pkgdesc="MCSManager 的面板端（Web）程序模块。"
arch=(any)
url="https://github.com/MCSManager/MCSManager"
license=(Apache-2.0)
install=$pkgname.install
depends=('nodejs>=16')
makedepends=('npm' 'git')
source=('file://mcsm-web.service'
        "mcsm::git+https://github.com/MCSManager/MCSManager")
sha256sums=('5f85e25231e3d4119c215a3ee00e1ae6dd000d8c55c1b8f32194868f882305cc'
            'SKIP')
backup=("opt/mcsmanager/daemon/data/")

pkgver() {
  cd mcsm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

optdepends=(
  'python-setuptools: for building Python packages using tooling that is usually bundled with Python'
  'python-pip: for installing Python packages using tooling that is usually bundled with Python'
  'python-pipx: for installing Python software not packaged on Arch Linux'
  'sqlite: for a default database integration'
  'xz: for lzma'
  'tk: for tkinter'
)

build() {
  cd "mcsm"
  npm install
  npm run preview-build
  rm -rf production-code
  rm -rf ./panel/dist ./panel/production
  mkdir production-code
  mkdir production-code/web
  mkdir production-code/web/public

  cd daemon
  npm install
  npm run build # needed by panel
  cd ..

  cd panel
  npm install
  npm run build
  cd ..
  cd frontend
  npm install
  npm run build
  cd ..

  mv "panel/production/app.js" "production-code/web"
  mv "panel/production/app.js.map" "production-code/web"
  cp -f "panel/package.json" "production-code/web/package.json"
  cp -f "panel/package-lock.json" "production-code/web/package-lock.json"
  mv frontend/dist/* "production-code/web/public"

  rm -rf "panel/dist" "panel/production"
  rm -rf "frontend/dist"

  cd "production-code/web"
  npm install --production
}

package() {
  install -Dm644 mcsm-web.service "${pkgdir}/usr/lib/systemd/system/mcsm-web.service"
  install -Dm644 "${srcdir}/mcsm/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/opt/mcsmanager"
  cp -r "${srcdir}/mcsm/production-code/web" "${pkgdir}/opt/mcsmanager/"
}
