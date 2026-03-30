# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: dawn <crackofdusk at gmail ... com>
# Contributors: Profpatsch [https://bbs.archlinux.org/misc.php?email=68112]
#               ajs124
# Contributor: dos1

pkgname=performous-git
pkgver=1.3.1.r284.gcf4006f2c
pkgrel=1
pkgdesc='A free game like "Singstar", "Rockband" or "Stepmania" (version from git)'
arch=('i686' 'x86_64')
url="http://performous.org"
license=('GPL')
depends=('aubio' 'boost-libs' 'cairo' 'ffmpeg' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'glibmm' 'icu' 'libepoxy' 'libjpeg-turbo' 'libpng' 'librsvg' 'libxml++2.6' 'opencv' 'pango' 'portaudio' 'portmidi' 'sdl2')
optdepends=('portmidi: MIDI drum support' 'opencv: webcam support' 'ttf-ms-fonts: Microsoft core fonts')
makedepends=('cmake' 'boost' 'git' 'help2man' 'glm' 'cpprestsdk' 'aubio')
provides=(performous)
conflicts=(performous)
source=($pkgname::"git+https://github.com/performous/performous.git"
        "git+https://github.com/performous/compact_enc_det.git"
        "git+https://github.com/performous/aubio.git"
        boost-1.90.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '780f04205829f5b11008ebbd5bdce96c')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -e '/-Werror/d' -i */CMakeLists.txt
  patch -p2 -i ../boost-1.90.patch
}

build() {
  local cmake_options=(-B build -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=None -S $pkgname -W no-dev)
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
