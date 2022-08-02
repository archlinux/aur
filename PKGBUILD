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
_pkg_ver="16.2.0"
_commit=49783ba2e9cfbc83746098ce8d88efb2af54c116

# ctags submodule
_ctags_pkg_name="eranif-ctags"
_ctags_pkg_ident="52c724d"
_ctags_pkg_name_ident="${_ctags_pkg_name}-${_ctags_pkg_ident}"

# dbgd/wxdap submodule
_dbgd_pkg_name="eranif-dbgd"
_dbgd_pkg_ident="82d9bb8"
_dbgd_pkg_name_ident="${_dbgd_pkg_name}-${_dbgd_pkg_ident}"

# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=0

# generic: pre
_pkg_ver="${pkgver}"

# version
#_pkg_ident="${_pkg_name}-${pkgver}"
#_pkg_name_ver="${_pkg_name}-${_pkg_ver}"

# commit
_pkg_ident="${_commit}"

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
    "codelite-ctags.tar.gz::https://github.com/eranif/ctags/tarball/52c724d1132d78ea44894bfe2eaca44f38a9bd85"
    "codelite-dbgd.tar.gz::https://github.com/eranif/dbgd/tarball/82d9bb8cdef440eef14c7ef484f21e0df812d103"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

sha256sums=('207651b0a06de5972f0b85aee4ed863658e67b2d9e0ac186e892da858f787e0f'
            '77cd02b001f8d677ce0842eb3d93675a5762c7cedc96e5a915b247be1eaaa075'
            '12a86354ac047496668aeab801504d3ce537bd43e1a820dd65602fed4e2d411d'
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
  ln -s ../eranif-ctags-52c724d ctags

  # submodule eranif-dbgd to wxdap
  rmdir wxdap
  ln -s ../eranif-dbgd-82d9bb8 wxdap

  # apply patches

  #patch -p0 < "${startdir}/codelite-quickfindbar-focus-tweak.patch"

  #patch -p0 < "${startdir}/cmake.patch"  # wx-config patch

  # temporary disable wxcrafter build: cl-16.1.0/wxcrafter subdir build fails with wx-3.1.7
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
