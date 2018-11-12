# Maintainer: Michal Donat <donny579@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
pkgname=libvpx-1.6
_pkgname=libvpx
pkgver=1.6.0
pkgrel=1
pkgdesc='The VP8 Codec SDK (version 1.6, provides libvpx.so.4)'
arch=('i686' 'x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc')
makedepends=('yasm' 'git')
conflicts=('libvpx<1.7')
source=("http://storage.googleapis.com/downloads.webmproject.org/releases/webm/$_pkgname-$pkgver.tar.bz2")
sha256sums=('d0afbb5eb1ecae68f8d578abace160a97e2e8a230e3028cf4db115d59a695aad')


build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --enable-vp8 \
    --enable-vp9 \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --disable-static \
    --enable-postproc \
    --enable-pic \
    --disable-install-docs \
    --disable-install-bins \
    --disable-install-srcs
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DIST_DIR="${pkgdir}/usr" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove useless files, already provided by libvpx package
  rm "${pkgdir}/usr/lib/pkgconfig/vpx.pc"
  rmdir "${pkgdir}/usr/lib/pkgconfig"
  rm "${pkgdir}/usr/lib/libvpx.so"
  rm -rf "${pkgdir}/usr/include/vpx"
  rmdir "${pkgdir}/usr/include"
}
