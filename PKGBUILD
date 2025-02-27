# Maintainer : MorsMortium <morsmortium@disroot.org>
# Contributor: Leillo1975 <leillo1975 at gmail dot com>
# Contributor: Aleksandr <contact at via dot aur>
# Contributor: Tim Wanders <tim241 at mailbox dot org>
# Contributor: AdriÃƒÂ¡n Chaves FernÃƒÂ¡ndez, aka Gallaecio <adriyetichaves at gmail dot com>


_pkgname=speed-dreams
pkgname=${_pkgname}-git
pkgver=r5437.aa9e102
pkgrel=1
pkgdesc="Free and open source motorsport simulation video game."
arch=('x86_64')
url="https://www.speed-dreams.net"
license=('GPL-2.0-or-later')
depends=('freealut' 'freeglut' 'libpng' 'libxi' 'libxmu' 'libxrandr'
  'plib>=1.8.3' 'libjpeg' 'zlib' 'enet' 'openscenegraph' 'sdl2_mixer' 'jre'
  'jdk' 'cjson' 'minizip' 'hicolor-icon-theme' )
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
md5sums=('SKIP')
source=("speed-dreams-code::git+https://forge.a-lec.org/speed-dreams/speed-dreams-code.git")

pkgver() {
  cd "${srcdir}/speed-dreams-code"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/speed-dreams-code"

  git submodule update --init --recursive

  mkdir -p cmake_build
  cd cmake_build

  cmake -Wno-dev \
    -D CMAKE_BUILD_TYPE:STRING=MinSizeRel \
    -D SD_LOCALDIR:STRING=~/.config/speed-dreams-2 \
    -D SD_BINDIR:STRING=/usr/bin \
    -D SD_LIBDIR:STRING=/usr \
    -D SD_DATADIR:STRING=/usr/share/speed-dreams-2 \
    -D OPTION_TRACE_LEVEL:STRING=2 \
    ..

  cmake --build . -j `nproc --ignore=1`
}

package() {
  cd "${srcdir}/speed-dreams-code/cmake_build"
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/speed-dreams-code/speed-dreams-data/data/data/icons/icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/speed-dreams.svg"
  install -D -m644 "${srcdir}/speed-dreams-code/cmake_build/src/main/speed-dreams.desktop" \
    "${pkgdir}/usr/share/applications/speed-dreams.desktop"

  sed -i 's/^Icon=.*$/Icon=speed-dreams/' "${pkgdir}/usr/share/applications/speed-dreams.desktop"
  sed -i 's/^Exec=.*$/Exec=speed-dreams-2/' "${pkgdir}/usr/share/applications/speed-dreams.desktop"
}

