# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=elektra-git
pkgname=('elektra-git'
         'python-elektra-git'
         'python2-elektra-git'
         'lua52-elektra-git'
         'elektra-glib-git'
         'java-elektra-git'
         )
pkgver=0.8.14.295.g63eb956
pkgrel=1
pkgdesc="A universal hierarchical configuration store. (GIT version)"
arch=('i686' 'x86_64')
url='http://libelektra.org'
license=('BSD')
makedepends=('qt5-declarative'
             'yajl'
             'augeas'
             'discount'
             'git'
             'cmake'
             'boost'
             'doxygen'
             'graphviz'
             'swig'
             'lua52'
             'python2-cheetah'
             'python'
             'lua52'
             'gobject-introspection'
             'java-environment=8'
             'ruby-ronn'
             'tcl'
             'jna'
             )
provides=('elektra')
conflicts=('elektra')
source=('elektra::git+https://github.com/ElektraInitiative/libelektra.git')
sha1sums=('SKIP')

pkgver() {
  cd elektra
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  if [[ -d /usr/lib/jvm/java-8-openjdk ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
  fi
  if [[ -d /usr/lib/jvm/java-8-jdk ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-8-jdk"
  fi

  mkdir -p build

  sed '/install-layout/d' -i elektra/src/tools/gen/CMakeLists.txt
}

build() {
  cd build
  cmake ../elektra \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_TESTING=ON \
    -DBUILD_STATIC=OFF \
    -DBUILD_FULL=OFF \
    -DTOOLS=ALL \
    -DPLUGINS=ALL \
    -DBINDINGS=ALL \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.2 \
    -DJAVA_INCLUDE_PATH="${JAVA_HOME}/include"

  make
}

package_elektra-git() {
  pkgdesc="A universal hierarchical configuration store. (GIT version)"
  depends=('python2-cheetah')
  optdepends=('augeas: augeas plugin'
              'yajl: yajl plugin'
              'qt5-declarative: qt-gui'
              'discount: qt-gui'
              'python-elektra-git: Python bindings'
              'python2-elektra-git: Python 2 bindings'
              'lua52-elektra-git: Lua52 bindings'
              'elektra-glib-git: Glib bindings'
              'java-elektra-git: Java bindings')
  provides=('elektra')
  conflicts=('elektra')

  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/elektra-git/LICENSE"

  # fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done

  rm -fr "${pkgdir}/usr/include/elektra/"gelektra-k*

  rm -fr "${pkgdir}/usr/lib/"girepository*
  rm -fr "${pkgdir}/usr/lib/pkgconfig/"gelektra*.pc
  rm -fr "${pkgdir}/usr/lib/lua"
  (cd ${pkgdir}/usr/lib/python2*/site-packages; rm -fr $(\ls -I elektra_gen-0.8.14-py2.7.egg-info))
  rm -fr "${pkgdir}/usr/lib/"python3*

  rm -fr "${pkgdir}/usr/lib/"libgelektra-*

  rm -fr "${pkgdir}/usr/lib/elektra/libelektra-python.so"
  rm -fr "${pkgdir}/usr/lib/elektra/libelektra-python2.so"
  rm -fr "${pkgdir}/usr/lib/elektra/libelektra-lua.so"
  rm -fr "${pkgdir}/usr/lib/elektra/libelektra-jni.so"

  rm -fr "${pkgdir}/usr/share/"gir-*
  rm -fr "${pkgdir}/usr/share/lua"
  rm -fr "${pkgdir}/usr/share/java"
}

package_python-elektra-git() {
  pkgdesc="Python bindings. (GIT version)"
  depends=('elektra-git'
           'python'
           )
  provides=('python-elektra')
  conflicts=('python-elektra')

  make -C build/src/bindings/swig/python DESTDIR="${pkgdir}" install
  make -C build/src/bindings/gi/python DESTDIR="${pkgdir}" install
  install -Dm755 build/lib/libelektra-python.so "${pkgdir}/usr/lib/elektra/libelektra-python.so"

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/python-elektra-git/LICENSE"
}
package_python2-elektra-git() {
  pkgdesc="Python2 bindings for Elektra. (GIT version)"
  depends=('elektra-git')
  provides=('python2-elektra')
  conflicts=('python2-elektra')

  make -C build/src/bindings/swig/python2 DESTDIR="${pkgdir}" install
  install -Dm755 build/lib/libelektra-python2.so "${pkgdir}/usr/lib/elektra/libelektra-python2.so"

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/python2-elektra-git/LICENSE"
}

package_lua52-elektra-git() {
  pkgdesc="LUA52 bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'lua52'
           )
  provides=('lua52-elektra')
  conflicts=('lua52-elektra')

  make -C build/src/bindings/swig/lua DESTDIR="${pkgdir}" install
  make -C build/src/bindings/gi/lua DESTDIR="${pkgdir}" install
  install -Dm755 build/lib/libelektra-lua.so "${pkgdir}/usr/lib/elektra/libelektra-lua.so"

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/lua52-elektra-git/LICENSE"
}

package_elektra-glib-git() {
  pkgdesc="Glib bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'glib2'
           )
  provides=('elektra-glib')
  conflicts=('elektra-glib')

  make -C build/src/bindings/gi DESTDIR="${pkgdir}" install
  make -C build/src/bindings/glib DESTDIR="${pkgdir}" install
  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/elektra-glib-git/LICENSE"

  rm -fr "${pkgdir}/usr/lib/"python*
  rm -fr "${pkgdir}/usr/share/lua"
}

package_java-elektra-git() {
  pkgdesc="Java bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'java-environment=8'
           'jna'
           )
  provides=('java-elektra')
  conflicts=('java-elektra')

  make -C build/src/bindings/jna DESTDIR="${pkgdir}" install
  install -Dm755 build/lib/libelektra-jni.so "${pkgdir}/usr/lib/elektra/libelektra-jni.so"

  install -Dm644 elektra/doc/COPYING "${pkgdir}/usr/share/licenses/java-elektra-git/LICENSE"
}
