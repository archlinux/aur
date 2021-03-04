#
# PKGBUILD for codelite
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: nem <nem@ikitten.co.uk>
# Contributor: agvares <agvares13@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#
# NOTES:
#
# 20200917: MySql dbsupport temporary disabled (-DWITH_MYSQL=0) because of problem with its include internal files (fix suggested here: https://bugs.archlinux.org/task/67896)
# 20191009: Apply cmake list hack to work around harfbuzz hb.h inclusion problem
# 20190409: Mariadb patch applied from https://aur.archlinux.org/packages/codelite/
# 20151027: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: -DENABLE_LLDB=0: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: sudo chmod 000 /usr/lib/codelite/LLDBDebugger.so
#

_pkgname=codelite
_pkgver=15.0.1
#_commit=d19d21e702fa0de1c6649c8a63096f30ee90cf9d

pkg_ident="${pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"

pkgname=${_pkgname}
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'clang')
depends=(
          'wxgtk3'
          #'wxgtk2' 'webkit2gtk'
          'clang' 'lldb'
          'libedit'
          'libssh'
          'mariadb-libs'
          'ncurses'
          'wget' 'curl'
          'xterm'
          'python2'
          'python'
        )
optdepends=('graphviz: callgraph visualization'
             'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
            )

#source=(https://github.com/eranif/${_pkgname}/archive/${pkgver//_/-}.tar.gz
#        http://repos.codelite.org/wxCrafterLibs/wxgui.zip)
#noextract=('wxgui.zip')


source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/eranif/${_pkgname}/archive/${pkgver//_/-}.tar.gz"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

md5sums=('8083ffd34ab83fcfa74c3f442026c845'
         '20f3428eb831c3ff2539a7228afaa3b4'
         )
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
  cd "${srcdir}/${pkg_name_ver}"
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}


#
#
#
build()
{
cd "${srcdir}/${pkg_name_ver}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
WX_CONFIG="wx-config-gtk3"
export WX_CONFIG

mkdir -p "${BUILD_DIR}"
#cd "${BUILD_DIR}"

cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_WX_CONFIG=${WX_CONFIG} -DENABLE_LLDB=1 -DWITH_MYSQL=0 -DCMAKE_INSTALL_LIBDIR=lib
make -C "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${pkg_name_ver}"

make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
install -m 644 -D "${srcdir}/${pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
}

#
# EOF
#
