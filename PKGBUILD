# Maintainer: bilabila <bilabila@qq.com>
_srcname=ArknightsAutoHelper
_pkgname=akhelper
pkgname=$_pkgname-git
pkgver=r911.fcf089e
pkgrel=5
pkgdesc='Arknights Auto Helper based on ADB and Python | 基于python的明日方舟护肝助手'
arch=(x86_64)
url=https://github.com/ninthDevilHAUNSTER/ArknightsAutoHelper
provides=($_pkgname $_srcname)
conflicts=($_pkgname $_srcname)
license=(MIT)
depends=(python-coloredlogs python-numpy python-opencv 
  python-pillow python-requests python-ruamel-yaml 
  python-colorama python-bottle-websocket 
  python-pywebview python-textdistance python-gevent-websocket 
  tesseract-data-chi_sim)
makedepends=()
source=(git+https://github.com/ninthDevilHAUNSTER/ArknightsAutoHelper
  akhelper
  akhelper-gui
  use_state_separation.patch
)
sha512sums=(SKIP
  6712dd3bf83ff90f521effc671fb607f035cebf1b9dc7b31f3edaa013459a51e23c5aee869313b5352fcf14e72ce20b55c025c3338aa4a7937d6125aff72f1d0
  2afe415a28cf8bc795bd395b45878eeab7341e64347b915850d155fdf68e09066fe443fe15a8c840649d15f6c2d491a96813508ea366f023292af555c4345f26
  f13d60c6e05785e5f18f6b3e37843ed457e8da628ad294bec9e34e83856a6b1fc2b5d69632be4e55b4ef988cbfe43c08cabc13213cb8ecb035fb8bdcc86ed29a
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
