# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=jxrlib-git
pkgname=('jxrlib-git'
         'java-jxrlib-git'
         )
pkgver=1.1.r309.98e615d
pkgrel=1
pkgdesc='Open source implementation of jpegxr (Git version)'
arch=('i686' 'x86_64')
license=('GPL')
url='https://jxrlib.codeplex.com/'
makedepends=('git'
             'swig'
             'maven'
             'glibc'
             'gcc-libs'
             'java-environment'
             )
source=('git+https://github.com/glencoesoftware/jxrlib.git')
sha256sums=('SKIP')

pkgver() {
  cd jxrlib
  _ver="$(cat Makefile | grep -m1 JXR_VERSION | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  # Fix the prefix in libjxr.pc
  sed 's|"DIR_INSTALL": "$(DIR_INSTALL)"|"PREFIX": "$(PREFIX)"|g' -i jxrlib/Makefile
  sed 's|DIR_INSTALL|PREFIX|g' -i jxrlib/libjxr.pc.in
}

build() {
  cd jxrlib
  make \
    SHARED=1 \
    PREFIX=/usr \
    swig all

  # Build the java binding
  LD_LIBRARY_PATH="${srcdir}/jxrlib/build" mvn -f java package
}

package_jxrlib-git() {
  depends=('glibc')
  provides=('jxrlib')
  conflicts=('jxrlib')

  make -C jxrlib SHARED=1 PREFIX=/usr DIR_INSTALL="${pkgdir}/usr" install
}

package_java-jxrlib-git() {
  pkgdesc='Java bindings for Open source implementation of jpegxr (Git version)'
  depends=('gcc-libs'
           'java-environment'
           )
  provides=('java-jxrlib')
  conflicts=('java-jxrlib')

  install -Dm744 jxrlib/build/libjxrjava.so "${pkgdir}/usr/lib/libjxrjava.so"
  install -Dm644 jxrlib/java/target/jxrlib-0.3.0-SNAPSHOT.jar "${pkgdir}/usr/share/java/jxrlib-0.3.0-SNAPSHOT.jar"
}
