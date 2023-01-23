# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=l-smash-git
pkgname=('l-smash-git'
         'lib32-l-smash-git'
         )
pkgver=2.14.5.21.g18a9ed2
pkgrel=1
arch=('x86_64')
url='http://l-smash.github.io/l-smash'
license=('custom:l-smash')
makedepends=('glibc'
             'lib32-glibc'
             'git')
source=('git+https://github.com/l-smash/l-smash.git')
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

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd "${srcdir}/build32"
  ../l-smash/configure \
    --prefix=/usr \
    --libdir='${exec_prefix}/lib32' \
    --cc="${CC}" \
    --enable-shared \
    --disable-static \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}"

  make lib
}

package_l-smash-git() {
  pkgdesc='MP4 muxer and other tools. (GIT Version)'
  depends=('glibc')
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
  depends=('lib32-glibc'
           "l-smash=${pkgver}")
  provides=('lib32-l-smash'
            'liblsmash.so'
            )
  conflicts=('lib32-l-smash')
  make -C build32 DESTDIR="${pkgdir}" install-lib
  rm -fr "${pkgdir}/usr/include"
  install -Dm644 l-smash/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
