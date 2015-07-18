# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor:	Jesse Jaara	<gmail.com:	jesse.jaara>
# Contributor:	Det		<gmail.com:	nimetonmaili>
# Contributor:	h31		<yandex.com:	h31mail>
# Contributor:	julroy67	<gmail.com:	julroy67>

_srcname=libvpx
pkgname=${_srcname}-git_p
pkgver=1.4.0.r788.g479c669
pkgrel=1
pkgdesc="The VP8 Codec SDK (git version)"
arch=('i686' 'x86_64')
url="http://www.webmproject.org/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'yasm')
provides=('libvpx' 'libvpx-git' 'libvpx.so')
conflicts=('libvpx' 'libvpx-git')
source=("${_srcname}::git+https://chromium.googlesource.com/webm/libvpx")
sha256sums=('SKIP')

pkgver() {
  cur_prefix='v'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_srcname}"

    ./configure --prefix=/usr \
        --enable-vp8 \
        --enable-vp9 \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-postproc \
        --enable-pic \
        --disable-install-docs \
        --disable-install-srcs
  make
}

package() {
  cd "${srcdir}/${_srcname}/"
  make DIST_DIR="${pkgdir}/usr" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

