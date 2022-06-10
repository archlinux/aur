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
_pkg_ver="16.1.0"
#_commit=52c724d1132d78ea44894bfe2eaca44f38a9bd85


_ctags_pkg_name="eranif-ctags"
_ctags_pkg_ident="${_ctags_pkg_name}-52c724d"

# pkg
pkgname="${_pkg_name}-unstable"
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=2


# version
_pkg_ver="${pkgver}"
_pkg_ident="${_pkg_name}-${pkgver}"
_pkg_name_ver="${_pkg_name}-${_pkg_ver}"
#_pkg_name_ver="${_pkg_name}-${_pkg_ver//_/-}"

# commit
#pkg_ident="${_commit}"
#pkg_name_ver="${_pkg_name}-${_commit}"


#
pkgdesc="Cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'clang')
depends=('wxgtk3-dev-opt'
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
    "${_pkg_name_ver}.tar.gz::https://github.com/eranif/${_pkg_name}/archive/${_pkg_ver}.tar.gz"
    "codelite-ctags.tar.gz::https://github.com/eranif/ctags/tarball/52c724d1132d78ea44894bfe2eaca44f38a9bd85"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

sha256sums=('97adfada8a3ba6f3aaf9baba30f741ef4d380f8af1c2ce0693732f38b4a9e0f5'
            '77cd02b001f8d677ce0842eb3d93675a5762c7cedc96e5a915b247be1eaaa075'
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
  # eranif-ctags-52c724d
  cd "${srcdir}/${_pkg_ident}"
  rmdir ctags
  ln -s ../eranif-ctags-52c724d ctags
  #patch -p0 < "${startdir}/codelite-quickfindbar-focus-tweak.patch"
  patch -p0 < "${startdir}/cmake.patch"
  # temporary disable wxcrafter build: cl-16.1.0/wxcrafter subdir build fails with wx-3.1.7
  mv wxcrafter wxcrafter.disable
}


#
#
#
build()
{
cd "${srcdir}/${_pkg_ident}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-gtk3"
WX_CONFIG="/opt/wxgtk-dev/bin/wx-config"
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
cd "${srcdir}/${_pkg_ident}"

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
