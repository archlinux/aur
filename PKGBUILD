# Maintainer: bilabila <bilabila@qq.com>
_srcname=ArknightsAutoHelper
_pkgname=akhelper
pkgname=$_pkgname-git
pkgver=r911.fcf089e
pkgrel=2
pkgdesc='Arknights Auto Helper based on ADB and Python | 基于python的明日方舟护肝助手'
arch=(x86_64)
url=https://github.com/ninthDevilHAUNSTER/ArknightsAutoHelper
provides=($_pkgname $_srcname)
conflicts=($_pkgname $_srcname)
license=(MIT)
depends=(python-coloredlogs python-numpy python-opencv python-pillow python-requests python-ruamel-yaml python-colorama python-bottle-websocket python-pywebview python-textdistance python-gevent-websocket)
makedepends=()
source=(git+https://github.com/ninthDevilHAUNSTER/ArknightsAutoHelper
  akhelper
  akhelper-gui
  use_state_separation.patch
)
sha512sums=(SKIP
  6712dd3bf83ff90f521effc671fb607f035cebf1b9dc7b31f3edaa013459a51e23c5aee869313b5352fcf14e72ce20b55c025c3338aa4a7937d6125aff72f1d0
  2afe415a28cf8bc795bd395b45878eeab7341e64347b915850d155fdf68e09066fe443fe15a8c840649d15f6c2d491a96813508ea366f023292af555c4345f26
  93779645403bf1fba661aa0fb1be617003c77b77d4e3f2f35b17d07b5304fd044a50c2d7ea3e0257025237fe2da454f3dccbe7212d390b5bdf8f32bca1777a58
)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $_srcname
  patch -Np1 -i ../use_state_separation.patch
}
build() {
  cd $_srcname/vendor/penguin_client
  python setup.py build
}
package() {
  cd $_srcname/vendor/penguin_client
  python setup.py install --root="$pkgdir"
  cd ../../..

  install -Dm644 $_srcname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  cp -aT $_srcname/ "$pkgdir"/usr/share/$_srcname/

  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm755 $_pkgname-gui "$pkgdir"/usr/bin/$_pkgname-gui
}
