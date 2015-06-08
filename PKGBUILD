# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=openhevc-git
pkgver=r2031.20150602.cb97e66
pkgrel=1
pkgdesc="A open HEVC decoder (GIT Version)"
arch=('i686' 'x86_64')
url="http://openhevc.github.io/openHEVC/"
license=('LGPL2.1')
depends=('sdl' 'sdl2')
makedepends=('git' 'cmake' 'yasm')
provides=('openhevc')
conflicts=('openhevc')
source=('openhevc::git+https://github.com/OpenHEVC/openHEVC.git#branch=hevc_rext')
sha1sums=('SKIP')

pkgver() {
  cd openhevc
  printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format="%cd" --date=short | tr -d '-')" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../openhevc \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_SKIP_RPATH=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm755 build/hevc "${pkgdir}/usr/bin/openhevc"
  install -Dm755 build/hevc_sdl2 "${pkgdir}/usr/bin/openhevc_sdl2"
}
