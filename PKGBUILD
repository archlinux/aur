# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Pyro Devil <p dot devil at gmail dot com>

pkgname=codelite-git
_gitname=codelite
pkgver=v12.0.10.r57.g09d91b099
pkgrel=1
pkgdesc="A cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
install=codelite-git.install
makedepends=('pkgconfig' 'cmake' 'clang')
depends=(
  'wxgtk'
  'libedit'
  'libssh'
  'libmariadbclient'
  'ncurses'
  'xterm'
  'curl'
  'python2'
  'clang'
  'lldb'
  'hunspell'
)
optdepends=(
  'graphviz: callgraph visualization'
  'cscope: CScope Integration for CodeLite'
  'clang: compiler'
  'gcc: compiler'
  'gdb: debugger'
  'valgrind: debugger'
)
conflicts=('codelite' 'codelite-bin')
provides=('codelite')
source=(
  git://github.com/eranif/codelite.git
  http://repos.codelite.org/wxCrafterLibs/wxgui.zip
)
md5sums=(
  'SKIP'
  'SKIP'
)
noextract=('wxgui.zip')


pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_gitname}/build"

  CXXFLAGS="${CXXFLAGS} -fno-devirtualize"

  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_CLANG=1 -DENABLE_LLDB=1 -DWITH_MYSQL=1 \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..

  make
}

package() {
  cd "${srcdir}/${_gitname}/build"

  make -j1 DESTDIR="${pkgdir}" install
  install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
  install -m 644 -D "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/codelite/LICENSE"
}
