# Maintainer: xeruf <27jf at pm dot me>

_pkgname='timg'
pkgname="${_pkgname}-git"
pkgver=1.4.2.r20.g145a527
pkgrel=1
pkgdesc="Terminal Image and Video Viewer"
arch=('any')
url="https://github.com/hzeller/timg"
license=('GPL2')
depends=('libwebp' 'libjpeg-turbo' 'libexif' 'graphicsmagick' 'ffmpeg' 'openslide')
makedepends=('cmake' 'pkgconf' 'git' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=()
source=("git+${url}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}/"
  mkdir -p build
  cd build
  cmake ../ \
	-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
	-DWITH_VIDEO_DECODING=On \
	-DWITH_VIDEO_DEVICE=On \
	-DWITH_OPENSLIDE_SUPPORT=On
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -d "${pkgdir}/usr/"{bin,share/man/man1}
  make install
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
