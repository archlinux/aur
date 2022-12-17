#
# AUR PKGBUILD for "bleeding edge" codelite from github repo
#
# Maintainer: Uffe Jakobsen <uffe _at_ uffe _dot_ org>
# Past Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Pyro Devil <p dot devil at gmail dot com>
#
# NOTES:
#
# Using Make as long as Ninja cannot be resource-comtrolled from makepkg.conf (like Make can)
# System with many cores but little memory will be (OOM) killed by Ninja creating too many jobs
#

pkgname=codelite-git
_gitname=codelite
pkgver=16.7.0.r1.g38f75a2cc
pkgrel=1
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.codelite.org/"
license=('GPL')

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang' 'git')

depends=(
  'wxgtk3'
  'libedit'
  'libssh'
  'mariadb-libs'
  'ncurses'
  'clang'
  'lldb'
  'hunspell'
  #'xterm'
  #'wget'
  #'curl'
  #'python2'
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
  ${_gitname}::git+https://github.com/eranif/codelite.git
  http://repos.codelite.org/wxCrafterLibs/wxgui.zip
)

sha256sums=(
  'SKIP'
  'SKIP'
)

noextract=('wxgui.zip')

#
#
#

BUILD_DIR="_build.out"

#
#
#

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule update --init

  # Apply patches here:
  # example: patch -p0 < "${startdir}/codelite-feature.patch"

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"
}

build() {
  cd "${srcdir}/${_gitname}"

  mkdir -p "${BUILD_DIR}"

  CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
  export CXXFLAGS

  #WX_CONFIG="/usr/bin/wx-config-gtk3"
  WX_CONFIG="wx-config"

  # generate
  cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_PCH=0  \
    -DWITH_WX_CONFIG="${WX_CONFIG}" \
    -DWITH_NATIVEBOOK=1 \
    -DENABLE_LLDB=1 \
    -DWITH_MYSQL=0 \
    -B "${BUILD_DIR}" \
    -S .

  # build
  #make -s -C "${BUILD_DIR}"
  cmake --build "${BUILD_DIR}"
}

package() {
  cd "${srcdir}/${_gitname}"

  #make -s -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
  DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"

  install -m 644 -D "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/codelite/LICENSE"
  install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
}

#
# EOF
#
