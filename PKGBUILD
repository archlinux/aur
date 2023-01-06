# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=liblcf-git
pkgver=0.7.0.r11.g0ed38af4
pkgrel=1
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects (development version)"
arch=('i686' 'x86_64')
url="https://easyrpg.org"
license=('MIT')
conflicts=('liblcf')
provides=("liblcf=${pkgver%.r*}" 'lcf2xml' 'lcfstrings')
depends=('gcc-libs' 'expat' 'icu')
makedepends=('git' 'cmake' 'ninja')
source=(liblcf::"git+https://github.com/EasyRPG/liblcf.git")
md5sums=('SKIP')

pkgver() {
  git -C liblcf describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
  rm -rf aurbuild
}

build() {
  cmake -S liblcf -B aurbuild -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBLCF_UPDATE_MIMEDB=OFF
  cmake --build aurbuild
}

check() {
  cmake --build aurbuild --target check
}

package () {
  DESTDIR="$pkgdir" cmake --install aurbuild
  # license
  install -Dm644 liblcf/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
