# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=zimg-git
pkgver=3.0.3.127.g48eec5c
pkgrel=1
pkgdesc="Scaling, colorspace conversion, and dithering library. (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=171334'
license=('custom:WTFPL')
depends=('gcc-libs'
         'glibc'
         )
makedepends=('git')
provides=('zimg'
          'libzimg.so'
          )
conflicts=('zimg'
           'vapoursynth-plugin-zimg'
           'vapoursynth-plugin-zimg-git'
           )
source=('git+https://github.com/sekrit-twc/zimg.git'
        'git+https://github.com/sekrit-twc/graphengine.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd zimg
  echo "$(git describe --long --tags | tr - . | sed 's|release.||g')"
}

prepare() {
  mkdir -p build

  cd zimg
  git config submodule.graphengine.url "${srcdir}/graphengine"
  git -c protocol.file.allow=always submodule update --init \
    graphengine
}

build() {
  cd zimg
  ./autogen.sh

  cd "${srcdir}/build"
  ../zimg/configure \
    --prefix=/usr

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 zimg/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
