# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=caveexpress
pkgver=2.5.2
pkgrel=1
pkgdesc="Classic 2D platformer with physics-based gameplay and dozens of levels"
arch=('i686' 'x86_64')
url="http://www.caveproductions.org"
license=('GPL3' 'CCPL')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sqlite3' 'lua52' 'box2d' 'yajl')
makedepends=('cmake' 'glm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/mgerhardy/$pkgname/archive/$pkgver.tar.gz"
        $pkgname-installation-paths.patch)
sha256sums=('da8bd71bbb39f898acbfa540c84431629e75f0f8c43878e1f41db1e35f4d30e2'
            '2646b0c6d4a8174de00d58e3308ac138090a5b5746e9509af5631f46df0e8433')

prepare() {
  # packaging fixes
  cd "$pkgname-$pkgver/cmake"
  patch -N -i "${srcdir}/$pkgname-installation-paths.patch"
}

build() {
  cmake -S "$pkgname-$pkgver" -B "build" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
    -DPKGDATADIR=/usr/share -DCAVEPACKER=on -DUNITTESTS=off
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"

  # doc
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/share/doc
  cp -rup docs/$pkgname "$pkgdir"/usr/share/doc
  
  install -Dpm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
