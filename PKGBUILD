# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=openhevc-git
pkgver=r2075.20170530.7c37bd65
pkgrel=1
pkgdesc="A open HEVC decoder. (GIT Version)"
arch=('x86_64')
url='http://openhevc.github.io/openHEVC'
license=('LGPL2.1')
depends=(
  'sdl'
  'sdl2'
)
makedepends=(
  'git'
  'cmake'
  'yasm'
)
provides=('openhevc')
conflicts=('openhevc')
source=(
  'openhevc::git+https://github.com/OpenHEVC/openHEVC.git#branch=hevc_rext'
  'mathops_fix.patch'
)
sha256sums=(
  'SKIP'
  'a50d7da9870a3fd801ad3a4d13d5c9b260acb094cf8bfa4afd95a54741173a7f'
)

pkgver() {
  cd openhevc
  printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --format="%cd" --date=short | tr -d '-')" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch -d openhevc -p1 -i "${srcdir}/mathops_fix.patch"
}

build() {
  CFLAGS+=' -Wl,--allow-multiple-definition'
  cmake -S openhevc -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm755 build/hevc "${pkgdir}/usr/bin/openhevc"
  install -Dm755 build/hevc_sdl2 "${pkgdir}/usr/bin/openhevc_sdl2"
}
