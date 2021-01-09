# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=tsmuxer-git
pkgver=2.6.16.r448.e6b1ed8
pkgrel=1
pkgdesc='Remux/mux elementary streams, EVO/VOB/MPG, MKV/MKA, MP4/MOV, TS, M2TS to TS to M2TS. (GIT Version)'
arch=('x86_64')
url='https://github.com/justdan96/tsMuxer'
license=('apache')
depends=('qt5-multimedia')
makedepends=('git'
             'cmake'
             'qt5-tools'
             )
provides=('tsmuxer'
          'tsmuxer'
          )
conflicts=('tsmuxer')
source=('git+https://github.com/justdan96/tsMuxer')
sha256sums=('SKIP')

pkgver() {
  cd tsMuxer
  _ver="$(cat CMakeLists.txt | grep -m1 VERSION_NUMBER | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed 's|git-|${VERSION_NUMBER}-git-|g' -i tsMuxer/CMakeLists.txt
}

build() {
  cd build
  cmake ../tsMuxer \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTSMUXER_GUI=ON \
    -DTSMUXER_RELEASE=ON \
    -DTSMUXER_VERSION="${pkgver}"

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 tsMuxer/LICENSE "${pkgdir}/usr/share/licenses/tsmuxer/LICENSE"
  install -Dm644 tsMuxer/README.md "${pkgdir}/usr/share/doc/tsmuxer/README.md"
  install -Dm644 tsMuxer/CHANGELOG.md "${pkgdir}/usr/share/doc/tsmuxer/CHANGELOG.md"
}
