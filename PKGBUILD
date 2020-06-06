# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>

pkgname=np2kai-git
pkgver=0.86.rev.22.36.g6d461af
pkgrel=1
pkgdesc="Neko Project II Kai, a PC-9801 emulator. (GIT version)"
arch=('x86_64')
url='http://domisan.sakura.ne.jp/article/np2kai/np2kai.html'
license=('MIT')
depends=('gtk2'
         'sdl2_mixer'
         'sdl2_ttf'
         )
makedepends=('cmake'
             'nasm'
             )
conflicts=('np2kai')
provides=('np2kai')
source=('np2kai::git+https://github.com/AZO234/NP2kai.git')
sha256sums=('SKIP')

pkgver() {
  cd np2kai
  _ver="$(cat np2ver.h | grep -m1 NP2VER_CORE | cut -d ' ' -f2,3 | cut -d '"' -f1)"
  echo "${_ver}.$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p np2kai/build
}

build() {
  cd np2kai/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_X=ON \
    -DBUILD_I286=ON \
    -DBUILD_HAXM=ON

  make
}

package() {
  make -C np2kai/build DESTDIR="${pkgdir}" install

  install -Dm644 np2kai/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
