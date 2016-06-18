# Maintainer: Dan Ziemba <zman0900@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-libvpx1.3
pkgver=1.3.0
pkgrel=2
pkgdesc='VP8 and VP9 codec (legacy version, provides libvpx.so.1)'
arch=('x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('lib32-glibc')
makedepends=('gcc-multilib' 'yasm')
source=("https://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-v${pkgver}.tar.bz2")
sha256sums=('d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f4217aef0010451a9')

build() {
  cd ${srcdir}/libvpx-v${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  # nestegg code is broken on gcc 5.1, so unit tests and examples must be disabled
  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --target='x86-linux-gcc' \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp{8,9} \
    --disable-install-{bins,docs,srcs} \
    --disable-static \
    --disable-unit-tests \
    --disable-examples
  make
}

package() {
  cd ${srcdir}/libvpx-v${pkgver}

  make DIST_DIR="${pkgdir}/usr" install
  rm -rf "${pkgdir}"/usr/{include,lib32/{pkgconfig,libvpx.so}}

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
