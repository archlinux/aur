# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Eric Bélanger <eric@archlinux.org>

_srcname=flac
pkgname=${_srcname}-git_p
pkgver=1.3.1.r55.g6ced857
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Free Lossless Audio Codec"
url="http://flac.sourceforge.net/"
license=('GPL' 'BSD')
depends=('gcc-libs' 'libogg')
makedepends=('git' 'nasm')
options=('!makeflags')
conflicts=('flac')
provides=('flac')
replaces=()
source=("git+https://git.xiph.org/flac.git")
sha512sums=('SKIP')

pkgver() {
  cur_prefix=''
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_srcname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr \
    --enable-sse \
    --disable-thorough-tests \
    --disable-doxygen-docs \
    --disable-oggtest \
    --disable-rpath
  make
}

check() {
  # Takes long: using --disable-thorough-tests
  cd "${srcdir}/${_srcname}"
  make check
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
