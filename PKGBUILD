# Maintainer:  Daniel Mensinger daniel@mensinger-ka.de
# Contributor: Daniel Mensinger daniel@mensinger-ka.de

pkgname=libopenglrecorder-git
pkgver=r22.c398376
pkgrel=1
pkgdesc="A library allowing optional async readback OpenGL frame buffer with optional audio recording"
arch=('i686' 'x86_64')
url="https://github.com/Benau/libopenglrecorder"
license=('BSD')
groups=()
depends=('libjpeg-turbo' 'libvpx' 'openh264' 'libpulse')
makedepends=('git' 'cmake' 'make')
optdepends=()
provides=('libopenglrecorder')
conflicts=('libopenglrecorder')
install=
source=("${pkgname}::git+https://github.com/Benau/libopenglrecorder.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  [ -d build ] && rm -rf build
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}/build"

  cmake \
    -DBUILD_SHARED_LIBS=ON          \
    -DBUILD_WITH_VPX=ON             \
    -DBUILD_WITH_H264=ON            \
    -DBUILD_RECORDER_WITH_SOUND=ON  \
    -DCMAKE_INSTALL_PREFIX=/usr     \
    -DCMAKE_INSTALL_LIBDIR=lib      \
    ..

  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make DESTDIR="${pkgdir}" install
}
