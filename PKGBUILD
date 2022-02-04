# Maintainer: Evelyn Marie <evelynelizabethmarie@gmail.com>

pkgbase=flac-git
pkgname=(flac-git flac-doc-git)
pkgver=1.3.3.r85.gb358381a
pkgrel=1
arch=(x86_64 aarch64)
url="https://xiph.org/flac/"
license=(BSD GPL)
depends=(gcc-libs libogg)
makedepends=(git nasm doxygen)
source=("git+https://github.com/xiph/flac.git")
sha256sums=('SKIP')

pkgver() {
  cd "flac"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "flac"
  ./autogen.sh
}

build() {
  cd "flac"
  ./configure --prefix=/usr --enable-64-bit-words
  make
}

package_flac-git() {
  pkgdesc="Free Lossless Audio Codec"
  options=(!docs)
  conflicts=(flac)
  provides=(flac libFLAC.so libFLAC++.so)

  cd "flac"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_flac-doc-git() {
  pkgdesc="Developer documentation for the Free Lossless Audio Codec"
  arch=(any)
  depends=(flac)
  conflicts=(flac-doc)
  provides=(flac-doc)

  cd "flac"
  make DESTDIR="${pkgdir}" -C doc install
  sed -i "s|$srcdir/flac|/usr|" "${pkgdir}/usr/share/doc/flac/FLAC.tag"
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
