# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=elektra-git
pkgname=('elektra-git'
         'python-elektra-git'
         'python2-elektra-git'
         'lua52-elektra-git'
         'java-elektra-git'
         'ruby-elektra-git'
         )
pkgver=0.8.19.317.gd605fb0
pkgrel=1
pkgdesc="A universal hierarchical configuration store. (GIT version)"
arch=('i686' 'x86_64')
url='http://libelektra.org'
license=('BSD')
makedepends=('qt5-declarative'
             'qt5-quickcontrols'
             'yajl'
             'augeas'
             'discount'
             'git'
             'cmake'
             'boost'
             'botan-1.10'
             'doxygen'
             'graphviz'
             'swig'
             'lua52'
             'python2-cheetah'
             'python'
             'java-environment=8'
             'ruby-ronn'
             'tcl'
             'jna'
             'curl'
             'ruby'
             'hicolor-icon-theme'
             )
provides=('elektra')
conflicts=('elektra')
source=('elektra::git+https://github.com/ElektraInitiative/libelektra.git')
sha256sums=('SKIP')

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
    -DTOOLS=ALL \
    -DPLUGINS='ALL;-experimental' \
    -DBINDINGS=ALL \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.2 \
    -DJAVA_INCLUDE_PATH="${JAVA_HOME}/include" \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

  LC_ALL=C make
}

package_elektra-git() {
  pkgdesc="A universal hierarchical configuration store. (GIT version)"
  depends=('hicolor-icon-theme'
           'gcc-libs'
           )
  optdepends=('curl: curl plugin'
              'augeas: augeas plugin'
              'yajl: yajl plugin'
              'botan-1.10: Crypto plugin'
              'libgit2: GIT plugin'
              'qt5-declarative: qt-gui'
              'qt5-quickcontrols: qt-gui'
              'discount: qt-gui'
              'python-elektra-git: Python bindings and find-tools'
              'python2-elektra-git: Python 2 bindings and gen tool'
              'lua52-elektra-git: Lua52 bindings'
              'elektra-glib-git: Glib bindings'
              'java-elektra-git: Java bindings'
              )
  provides=('elektra')
  conflicts=('elektra')

  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/elektra-git/LICENSE.md"

  # fix references to SRCDIR
  for i in $(find ${pkgdir}/usr/share/doc -type f); do sed "s|${srcdir}|/usr/share/doc|g" -i ${i} ;done

  rm -fr "${pkgdir}/usr/lib/ruby"
  rm -fr "${pkgdir}/usr/lib/lua"
  rm -fr "${pkgdir}/usr/lib/"python*

  rm -fr "${pkgdir}/usr/lib/elektra/tool_exec/gen"
  rm -fr "${pkgdir}/usr/lib/elektra/tool_exec/find-tools"

  rm -fr "${pkgdir}/usr/lib/elektra/"libelektra-{python,python2,lua,jni}.so

  rm -fr "${pkgdir}/usr/share/lua"
  rm -fr "${pkgdir}/usr/share/java"

  rm -fr "${pkgdir}/usr/share/elektra/test_data"/{lua,python,python2}
}

package_python-elektra-git() {
  pkgdesc="Python bindings. (GIT version)"
  depends=('elektra-git'
           'python'
           )
  provides=('python-elektra')
  conflicts=('python-elektra')

  make -C build/src/bindings/swig/python DESTDIR="${pkgdir}" install
  make -C build/src/plugins/python DESTDIR="${pkgdir}" install
  install -Dm755 ${srcdir}/elektra/scripts/find-tools "${pkgdir}/usr/lib/tools_exec/find-tools"

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/python-elektra-git/LICENSE.md"
}
package_python2-elektra-git() {
  pkgdesc="Python2 bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'python2-cheetah'
           )
  provides=('python2-elektra')
  conflicts=('python2-elektra')

  make -C build/src/bindings/swig/python2 DESTDIR="${pkgdir}" install
  make -C build/src/plugins/python2 DESTDIR="${pkgdir}" install
  make -C build/src/tools/gen DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/python2-elektra-git/LICENSE.md"
}

package_ruby-elektra-git() {
  pkgdesc="Ruby bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'ruby'
           )
  provides=('lua52-elektra')
  conflicts=('lua52-elektra')

  make -C build/src/bindings/swig/ruby DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/ruby-elektra-git/LICENSE.md"
}

package_lua52-elektra-git() {
  pkgdesc="LUA52 bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'lua52'
           )
  provides=('lua52-elektra')
  conflicts=('lua52-elektra')

  make -C build/src/bindings/swig/lua DESTDIR="${pkgdir}" install
  make -C build/src/plugins/lua DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/lua52-elektra-git/LICENSE.md"
}

package_java-elektra-git() {
  pkgdesc="Java bindings for Elektra. (GIT version)"
  depends=('elektra-git'
           'glibc'
           'java-environment=8'
           'jna'
           )
  provides=('java-elektra')
  conflicts=('java-elektra')

  make -C build/src/bindings/jna DESTDIR="${pkgdir}" install
  make -C build/src/plugins/jni DESTDIR="${pkgdir}" install

  install -Dm644 elektra/doc/LICENSE.md "${pkgdir}/usr/share/licenses/java-elektra-git/LICENSE.md"
}
