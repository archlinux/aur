# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=obuparse-git
pkgname=('obuparse-git'
         'lib32-obuparse-git'
         )
pkgver=r18.055be27
pkgrel=1
arch=('x86_64')
url='https://github.com/dwbuiten/obuparse'
license=('custom:ISC')
makedepends=('glibc'
             'lib32-glibc'
             'git'
             )
source=('git+https://github.com/dwbuiten/obuparse.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd obuparse
#   echo "$(git describe --long --tags | tr - . | tr -d v)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|$@|& $(LDFLAGS)|g' \
    -i obuparse/Makefile
  cp -R obuparse obuparse32
  sed 's|)/lib|&32|g' \
    -i obuparse32/Makefile
}

build() {

  cd "${srcdir}/obuparse"
  make CFLAGS="${CFLAGS} -std=c99 -Wall -Wextra -fPIC -I." LDFLAGS="${LDFLAGS}" libobuparse.so tools

  cd "${srcdir}/obuparse32"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  make CFLAGS="${CFLAGS} -std=c99 -Wall -Wextra -fPIC -I." LDFLAGS="${LDFLAGS}" libobuparse.so
}

package_obuparse-git() {
  pkgdesc='A simple and portable single file AV1 OBU parser. (GIT Version)'
  depends=('glibc')
  provides=('obuparse'
            'libobuparse.so'
            "obuparse=${pkgver}"
            )
  conflicts=('obuparse')

  cd "${srcdir}/obuparse"
  mkdir -p "${pkgdir}/usr/"{bin,include,lib}
  make PREFIX="${pkgdir}/usr" install install-tools

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-obuparse-git() {
  pkgdesc='A simple and portable single file AV1 OBU parser. (GIT Version) (32-bits)'
  depends=('lib32-glibc'
           "obuparse=${pkgver}"
           )
  provides=('lib32-obuparse'
            'libobuparse.so'
            )
  conflicts=('lib32-obuparse')

  cd "${srcdir}/obuparse32"
  mkdir -p "${pkgdir}/usr/"{include,lib32}
  make PREFIX="${pkgdir}/usr" install
  rm -fr "${pkgdir}/usr/include"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
