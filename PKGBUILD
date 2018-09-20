# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2-git
pkgver=2.23.187.gc3fc445
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version)"
url='https://github.com/FFMS/ffms2'
arch=('x86_64')
license=('GPL')
depends=('gcc-libs'
         'libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'libavutil.so'
         )
makedepends=('git')
provides=('ffms2'
          'libffms2.so'
          'vapoursynth-plugin-ffms2'
          )
conflicts=('ffms2')
source=('git+https://github.com/FFMS/ffms2.git')
sha256sums=('SKIP')

pkgver() {
  cd ffms2
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  (cd ffms2; mkdir -p src/config; autoreconf -vfi)

  cd build
  ../ffms2/configure \
    --prefix=/usr \
    --enable-shared=yes \
    --enable-static=no

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/vapoursynth/"
}
