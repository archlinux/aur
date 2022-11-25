# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=jxrlib-git
pkgname=('jxrlib-git'
         'java-jxrlib-git'
         )
pkgver=1.1.r340.90bea22
pkgrel=1
pkgdesc='Open source implementation of jpegxr (Git version)'
arch=('x86_64')
license=('GPL')
url='https://jxrlib.codeplex.com'
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
  _ver="$(cat Makefile | grep -m1 JXR_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p garbagecollector

  cat << EOF > "${srcdir}/garbagecollector/settings.xml"
<settings>
  <localRepository>${srcdir}/garbagecollector/Repository</localRepository>
</settings>
EOF

  # Fix the prefix in libjxr.pc
  sed 's|"DIR_INSTALL": "$(DIR_INSTALL)"|"PREFIX": "$(PREFIX)"|g' -i jxrlib/Makefile
  sed 's|DIR_INSTALL|PREFIX|g' -i jxrlib/libjxr.pc.in
}

build() {
  cd jxrlib

  JAVA_HOME=/usr/lib/jvm/default \
  make \
    SHARED=1 \
    PREFIX=/usr \
    swig all

  # Build the java binding
  LD_LIBRARY_PATH="${srcdir}/jxrlib/build" mvn -s "${srcdir}/garbagecollector/settings.xml" -f java package
}

package_jxrlib-git() {
  depends=('glibc')
  provides=('jxrlib')
  conflicts=('jxrlib')

  make -C jxrlib SHARED=1 PREFIX=/usr DIR_INSTALL="${pkgdir}/usr" install
  ln -s libjpegxr.so "${pkgdir}/usr/lib/libjpegxr.so.0"
  ln -s libjxrglue.so "${pkgdir}/usr/lib/libjxrglue.so.0"
}

package_java-jxrlib-git() {
  pkgdesc='Java bindings for Open source implementation of jpegxr (Git version)'
  depends=('gcc-libs'
           'java-environment'
           )
  provides=('java-jxrlib')
  conflicts=('java-jxrlib')

  install -Dm744 jxrlib/build/libjxrjava.so "${pkgdir}/usr/lib/libjxrjava.so"
  ln -s libjxrjava.so "${pkgdir}/usr/lib/libjxrjava.so.0"
  (cd jxrlib/java/target
  for i in *.jar; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/java/${i}"
  done
  )
}
