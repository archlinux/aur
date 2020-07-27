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

_pkgname=codelite
pkgname=${_pkgname}-unstable
pkgver=14.0.2
pkgrel=1
pkgdesc="Cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'clang')
depends=('wxgtk3'
          'webkit2gtk'
          'clang' 'lldb'
          'libedit'
          'libssh'
          'mariadb-libs'
          'ncurses'
          'xterm' 'wget' 'curl'
          'python2'
        )
optdepends=('graphviz: callgraph visualization'
             'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
            )
conflicts=('codelite')

#source=(https://github.com/eranif/${_pkgname}/archive/${pkgver//_/-}.tar.gz
#        http://repos.codelite.org/wxCrafterLibs/wxgui.zip)
#noextract=('wxgui.zip')


source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/eranif/${_pkgname}/archive/${pkgver//_/-}.tar.gz"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

md5sums=('3dc1654139d515521105e76f5516473a'
         '20f3428eb831c3ff2539a7228afaa3b4')

#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi


BUILD_DIR="_build"
pkg_name_ver="${_pkgname}-${pkgver//_/-}"


prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}


build()
{
cd "${srcdir}/${pkg_name_ver}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
WX_CONFIG="wx-config-gtk3"
export WX_CONFIG

mkdir -p "${BUILD_DIR}"
#cd "${BUILD_DIR}"

cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_WX_CONFIG=${WX_CONFIG} -DENABLE_LLDB=1 -DWITH_MYSQL=1 -DCMAKE_INSTALL_LIBDIR=lib
make -C "${BUILD_DIR}"

}

package()
{
#cd "${srcdir}/${pkg_name_ver}/${BUILD_DIR}"
cd "${srcdir}/${pkg_name_ver}"

make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
install -m 644 -D "${srcdir}/${pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
}

#
# EOF
#
