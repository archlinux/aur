# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=l-smash-git
pkgname=('l-smash-git'
         'lib32-l-smash-git'
         )
pkgver=2.18.0.6.g9ce0ae2
pkgrel=1
arch=('x86_64')
url='http://l-smash.github.io/l-smash'
license=('custom:l-smash')
makedepends=('obuparse-git'
             'lib32-obuparse-git'
             'git'
             )
source=('git+https://github.com/vimeo/l-smash.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd l-smash
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build{32,64}
}

build() {
  cd "${srcdir}/build64"
  ../l-smash/configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}"

  make

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd "${srcdir}/build32"
  ../l-smash/configure \
    --prefix=/usr \
    --libdir='${exec_prefix}/lib32' \
    --enable-shared \
    --disable-static \
    --extra-cflags="-m32 ${CFLAGS}" \
    --extra-ldflags="-m32 ${LDFLAGS}"

  make lib
}

package_l-smash-git() {
  pkgdesc='MP4 muxer and other tools. (GIT Version)'
  depends=('libobuparse.so')
  provides=('l-smash'
            'liblsmash.so'
            "l-smash=${pkgver}"
            )
  conflicts=('l-smash')

  make -C build64 DESTDIR="${pkgdir}" install

  install -Dm644 l-smash/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-l-smash-git() {
  pkgdesc='MP4 muxer and other tools. (GIT Version) (32-bits)'
  depends=('libobuparse.so'
           "l-smash=${pkgver}"
           )
  provides=('lib32-l-smash'
            'liblsmash.so'
            )
  conflicts=('lib32-l-smash')

  make -C build32 DESTDIR="${pkgdir}" install-lib
  rm -fr "${pkgdir}/usr/include"

  install -Dm644 l-smash/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
