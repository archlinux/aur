# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=lib32-libvpx1.3
pkgver=1.3.0
pkgrel=2
pkgdesc='VP8 and VP9 codec'
arch=('x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('lib32-glibc')
makedepends=('yasm' 'git')
provides=('libvpx.so')
source=("libvpx-${pkgver}.tar.gz::https://github.com/webmproject/libvpx/archive/v${pkgver}.tar.gz"
        'libvpx-1.3-gcc-5.2.patch')
sha256sums=('db72881e1c34e4ae92666847844f35dd2dd431bcf6284500b1b396464f882f64'
            'df157b8f0e4469692598f5f12b305561a56a84374880ef740ccb8f0b447851e1')

prepare() {
  cd libvpx-${pkgver}

  patch -Np1 -i ../libvpx-1.3-gcc-5.2.patch
}

build() {
  cd libvpx-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --target='x86-linux-gcc' \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-pic \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-vp8 \
    --enable-postproc \
    --enable-vp9

  make
}

package() {
  cd libvpx-${pkgver}

  make DIST_DIR="${pkgdir}"/usr install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{libvpx.{a,so},pkgconfig},share}

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/lib32-libvpx1.3/
}

# vim: ts=2 sw=2 et:
