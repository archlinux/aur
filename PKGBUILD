# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Pyro Devil <p dot devil at gmail dot com>

pkgname=codelite-git
_gitname=codelite
pkgver=8.0.1.r162.g36ea786
pkgrel=1
pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
install=codelite-git.install
license=('GPL')
depends=('wxgtk' 'curl' 'webkitgtk2' 'libssh' 'xterm' 'python2' 'libedit' 'ncurses' 'valgrind')
makedepends=('pkgconfig' 'cmake')
optdepends=('graphviz: callgraph visualization'
            'lldb-svn: debugger used by the lldb plugin')
conflicts=('codelite' 'codelite-bin' 'codelite4-svn')
provides=('codelite')
source=(git://github.com/eranif/codelite.git
        http://repos.codelite.org/wxCrafterLibs/wxgui.zip)
md5sums=('SKIP'
         '093485fcae62073ca8d0ba6ff3a5cb69')
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
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DENABLE_CLANG=1 -DCMAKE_INSTALL_LIBDIR=lib ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"

  make -j1 DESTDIR="${pkgdir}" install
  install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
  install -m 644 -D "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/codelite/LICENSE"
}
