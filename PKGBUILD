# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=3.42.03.a
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'zlib')
makedepends=('cmake')
source=(https://github.com/team-eternity/eternity/archive/${pkgver/\.a/a}.tar.gz)
sha512sums=('89fe30774fb249d9bf26946d84818f5ff41593538a6157ebf7d80f8ad8cbf17ac41016462976b344363608dda2f638f0cf1688ae3d7499d9b882d5a97894da94')

prepare() {
  cd "eternity-${pkgver/\.a/a}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  # Cannot do in-tree build.
  mkdir "ee-build"
  cd "ee-build"
  cmake ../eternity-${pkgver/\.a/a} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "ee-build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
