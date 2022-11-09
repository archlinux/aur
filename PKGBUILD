#
# PKGBUILD for codelite-unstable
#
# codelite-unstable package follows the weekly/latest builds of codelite - based on officially published tags
#
# The naming codelite-unstable is deliberately used to indicate that this package is not based the official stable release
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# ChangeLogUrl: https://wiki.codelite.org/pmwiki.php/Main/ReleaseNotesCodeLite15
#
# NOTES:
#
#

#
_pkg_name="codelite"
_pkg_ver="16.5.0"
_commit="6cd58652c0c3b9e3fef1e3f5e9411aa213b623bf"

# ctags submodule
_ctags_pkg_name="eranif-ctags"
_ctags_pkg_ident="52c724d1132d78ea44894bfe2eaca44f38a9bd85"
_ctags_pkg_name_ident="${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"

# dbgd/wxdap submodule
_dbgd_pkg_name="eranif-dbgd"
_dbgd_pkg_ident="6b4f0310c632776575495487f74b77c80732e747"
_dbgd_pkg_name_ident="${_dbgd_pkg_name}-${_dbgd_pkg_ident:0:7}"

# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=0

# generic: pre
_pkg_ver="${pkgver}"

# use version
_pkg_ident="${pkgver}"

# use commit
#_pkg_ident="${_commit}"

# generic: post
_pkg_name_ver="${_pkg_name}-${_pkg_ident}"
_pkg_name_ident="${_pkg_name}-${_pkg_ident}"


#
pkgdesc="Cross platform IDE for C, C++, Rust, Python, PHP and Node.js written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'clang')
depends=('wxwidgets-gtk3'
          'webkit2gtk'
          'clang' 'lldb'
          'libedit'
          'libssh'
          'mariadb-libs'
          'ncurses'
          'uchardet'
          'hunspell'
          'ctags'
          #'universal-ctags'
          #'xterm' 'wget' 'curl'
          #'python2'
          #'python'
        )
optdepends=('graphviz: callgraph visualization'
             'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
            )
conflicts=('codelite')

source=(
    "${_pkg_name_ident}.tar.gz::https://github.com/eranif/${_pkg_name}/archive/${_pkg_ident}.tar.gz"
    "codelite-ctags.tar.gz::https://github.com/eranif/ctags/tarball/${_ctags_pkg_ident}"
    "codelite-dbgd.tar.gz::https://github.com/eranif/dbgd/tarball/${_dbgd_pkg_ident}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('2e36498eff3051780fb93c0fd8c4b723a2461ed72cbd3394317f2481ed48f24a'
            '77cd02b001f8d677ce0842eb3d93675a5762c7cedc96e5a915b247be1eaaa075'
            'b8feff844f0d355b7a5d2b04906be6e688021a66b9d7ed55a18d9f97cae47208'
            '498c39ad3cc46eab8232d5fa37627c27a27f843cbe9521f05f29b19def436e12')

noextract=('wxgui.zip')

#
#
#

#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi


BUILD_DIR="_build"

#
#
#
prepare()
{
  cd "${srcdir}/${_pkg_name_ident}"

  # submodule eranif-ctags
  rmdir ctags
  ln -s ../${_ctags_pkg_name_ident} ctags

  # submodule eranif-dbgd to wxdap
  rmdir wxdap
  ln -s ../${_dbgd_pkg_name_ident} wxdap

  # apply patches

  #patch -p0 < "${startdir}/codelite-fsw-symlink.patch"

  #patch -p0 < "${startdir}/codelite-quickfindbar-focus-tweak.patch"
  #patch -p0 < "${startdir}/cmake.patch"  # wx-config patch

  # temporary disable wxcrafter build: cl-16.1.0/wxcrafter subdir build fails with wx-3.1.7 - is this still a problem - re-test !!!
  #mv wxcrafter wxcrafter.disable
}


#
#
#
build()
{
cd "${srcdir}/${_pkg_name_ident}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-gtk3"
#WX_CONFIG="/opt/wxgtk-dev/bin/wx-config"
WX_CONFIG="wx-config"
export WX_CONFIG

mkdir -p "${BUILD_DIR}"
#cd "${BUILD_DIR}"

cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_WX_CONFIG=${WX_CONFIG} -DENABLE_LLDB=1 -DWITH_MYSQL=0 -DCMAKE_INSTALL_LIBDIR=lib
#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib
make -C "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
install -m 644 -D "${srcdir}/${_pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg_name}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"

# universal-ctags experiment
#mv "${pkgdir}/usr/bin/codelite-ctags" "${pkgdir}/usr/bin/codelite-ctags.dist"
#ln -s /usr/bin/ctags "${pkgdir}/usr/bin/codelite-ctags"

}

#
# EOF
#
