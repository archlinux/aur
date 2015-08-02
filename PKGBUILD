# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libvpx-1.3
pkgver=1.3.0
pkgrel=2
pkgdesc='The VP8 Codec SDK (version 1.3, provides libvpx.so.1)'
arch=('i686' 'x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('glibc')
makedepends=('yasm' 'git')
conflicts=('libvpx<1.4')
source=("http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-v1.3.0.tar.bz2"
        "gcc-5.2.patch")
sha256sums=('d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9'
            'df157b8f0e4469692598f5f12b305561a56a84374880ef740ccb8f0b447851e1')

prepare() {
  cd "${pkgname/-*}-v${pkgver}"
  patch -p1 -i "../gcc-5.2.patch"
}

build() {
  cd "${pkgname/-*}-v${pkgver}"
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
  cd "${pkgname/-*}-v${pkgver}"
  make DIST_DIR="${pkgdir}/usr" install
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Remove useless files, already provided by libvpx package
  rm "${pkgdir}/usr/lib/pkgconfig/vpx.pc"
  rmdir "${pkgdir}/usr/lib/pkgconfig"
  rm "${pkgdir}/usr/lib/libvpx.so"
  rm -rf "${pkgdir}/usr/include/vpx"
  rmdir "${pkgdir}/usr/include"
}
