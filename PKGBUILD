# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=jxrlib-git
pkgver=1.1.r309.98e615d
pkgrel=1
pkgdesc='Open source implementation of jpegxr (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://jxrlib.codeplex.com/'
depends=('glibc'
         'gcc-libs'
         'java-environment'
         )
makedepends=('git'
             'swig'
             'maven'
             )
provides=('jxrlib')
conflicts=('jxrlib')
source=('git+https://github.com/glencoesoftware/jxrlib.git')
sha256sums=('SKIP')

pkgver() {
  cd jxrlib
  _ver="$(cat Makefile | grep -m1 JXR_VERSION | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|"DIR_INSTALL": "$(DIR_INSTALL)"|"PREFIX": "$(PREFIX)"|g' -i jxrlib/Makefile
  sed 's|DIR_INSTALL|PREFIX|g' -i jxrlib/libjxr.pc.in
}

build() {
  cd jxrlib
  make SHARED=1 PREFIX=/usr swig all
  LD_LIBRARY_PATH="${srcdir}/jxrlib/build" mvn -f java package
}

package() {
  cd jxrlib
  make SHARED=1 PREFIX=/usr DIR_INSTALL="${pkgdir}/usr" install
  install -Dm744 build/libjxrjava.so "${pkgdir}/usr/lib/libjxrjava.so"
  install -Dm644 java/target/jxrlib-0.3.0-SNAPSHOT.jar "${pkgdir}/usr/share/java/jxrlib-0.3.0-SNAPSHOT.jar"
}
