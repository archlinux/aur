# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=tsmuxer-git
pkgver=2.6.16.r1172.c6b1186
pkgrel=1
pkgdesc='Remux/mux elementary streams, EVO/VOB/MPG, MKV/MKA, MP4/MOV, TS, M2TS to TS to M2TS. (GIT Version)'
arch=('x86_64')
url='https://github.com/justdan96/tsMuxer'
license=('apache')
depends=(
  'gcc-libs'
  'glibc'
  'freetype2' 'libfreetype.so'
  'zlib' 'libz.so'
  'qt5-base'
  'qt5-multimedia'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'qt5-tools'
)
provides=('tsmuxer')
conflicts=('tsmuxer')
source=('git+https://github.com/justdan96/tsMuxer.git')
sha256sums=('SKIP')

pkgver() {
  cd tsMuxer
  _ver="$(cat CMakeLists.txt | grep -m1 VERSION_NUMBER | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|git-|${VERSION_NUMBER}-git-|g' -i tsMuxer/CMakeLists.txt
}

build() {
  cmake -S tsMuxer -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTSMUXER_GUI=ON \
    -DTSMUXER_RELEASE=ON \
    -DTSMUXER_VERSION="${pkgver}" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 tsMuxer/LICENSE "${pkgdir}/usr/share/licenses/tsmuxer/LICENSE"
  install -Dm644 tsMuxer/README.md "${pkgdir}/usr/share/doc/tsmuxer/README.md"
  install -Dm644 tsMuxer/CHANGELOG.md "${pkgdir}/usr/share/doc/tsmuxer/CHANGELOG.md"
}
