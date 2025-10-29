#
# AUR PKGBUILD for "bleeding edge" codelite from github repo
#
# Maintainer: Uffe Jakobsen <uffe _at_ uffe _dot_ org>
# Past Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Pyro Devil <p dot devil at gmail dot com>
#
# NOTES:
#
# Using Make as long as Ninja cannot be job-controlled from makepkg.conf (like Make can)
# Systems with many cores but little memory will be (OOM) killed by Ninja creating too many jobs
#

pkgname=codelite-git
_gitname=codelite
pkgver=18.2.0.r1.g3a07c3025
pkgrel=1
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64' 'aarch64')
url="https://codelite.org/"
license=("GPL-2.0-or-later")

makedepends=('cmake' 'ninja' 'clang' 'git')

depends=(
    'wxwidgets-gtk3'
    'libedit'
    'libssh'
    'mariadb-libs'
    'ncurses'
    'uchardet'
    'hunspell'
    #'ctags'
    #'xterm'
    #'wget'
    #'curl'
    #'python'
)

optdepends=(
    'clang: compiler'
    'lldb: debugger'
    'gcc: compiler'
    'gdb: debugger'
    'valgrind: debugger'
    'rust: language'
    'php: language'
    'graphviz: callgraph visualization'
    'cscope: CScope Integration for CodeLite'
)

provides=('codelite')

conflicts=('codelite')

source=(
    ${_gitname}::git+https://github.com/eranif/codelite.git
    #http://repos.codelite.org/wxCrafterLibs/wxgui.zip
)

sha256sums=(
    'SKIP'
    #'SKIP'
)

#noextract=('wxgui.zip')

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
  #cd "${srcdir}"
  #git clone -b master --single-branch --depth 1 --recursive --shallow-submodules https://github.com/eranif/codelite.git ${_gitname};

  cd "${srcdir}/${_gitname}"

  git submodule update --init
  git submodule foreach git submodule update --init

  # Apply patches here:
  # example: patch -p0 < "${startdir}/codelite-feature.patch"

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"
  #patch -p0 < "${startdir}/codelite-macro-workspace-realpath.patch"

  # dtl-v1.20 cannot compile on gcc >= 14.1.1 and clang >= 17.0.6
  #( cd dtl && patch -p0 < "${startdir}/dtl-dtl_Diff_hpp.patch" )

}

build() {
  cd "${srcdir}/${_gitname}"

  mkdir -p "${BUILD_DIR}"

  CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
  export CXXFLAGS

  #WX_CONFIG="/usr/bin/wx-config-gtk3"
  WX_CONFIG="wx-config"

  # generate
  #  -DWITH_NATIVEBOOK=1 \
  cmake -S . -B "${BUILD_DIR}" \
    -G "Ninja" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCL_PREFIX=/usr \
    -DWITH_PCH=0  \
    -DWITH_WX_CONFIG="${WX_CONFIG}" \
    -DENABLE_LLDB=1 \
    -DENABLE_SFTP=1 \
    -DWITH_MYSQL=0 \
    -DCOPY_WX_LIBS=0 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \


  # build
  cmake --build "${BUILD_DIR}"
}

package() {
  cd "${srcdir}/${_gitname}"

  DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"

  install -m 644 -D "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/codelite/LICENSE"
  if test -f "${srcdir}/wxgui.zip"; then
    install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
  fi;
}

#
# EOF
#
