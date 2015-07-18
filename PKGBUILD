# Maintainer: peter1000 <https://github.com/peter1000>
#  Contributor: sudokode <sudokode@gmail.com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_srcname=libsoxr
pkgname=${_srcname}-git_p
pkgver=0.1.1.r4.g988f830
pkgrel=1
pkgdesc="SoX Resampler library"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://sourceforge.net/projects/soxr/"
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('libsoxr' 'libsoxr-git')
conflicts=('libsoxr')
options=('!emptydirs')
source=("${_srcname}::git://git.code.sf.net/p/soxr/code")
sha256sums=('SKIP')

pkgver() {
  cur_prefix=''
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_srcname}"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DVISIBILITY_HIDDENL=ON \
    -DWITH_AVFFT=ON \
    -DWITH_DOUBLE_PRECISION=ON \
    -DWITH_LSR_BINDINGS=ON \
    -DWITH_OPENMP=ON \
    -DWITH_PFFFT=ON \
    -DWITH_SIMD=ON \
    .
  make
}

check() {
  cd "${srcdir}/${_srcname}"
  make test
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
