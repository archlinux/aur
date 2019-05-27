#
# codelite PKGBUILD
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
# 20190409: Mariadb patch applied from https://aur.archlinux.org/packages/codelite/
# 20151027: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: -DENABLE_LLDB=0: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: sudo chmod 000 /usr/lib/codelite/LLDBDebugger.so
#

pkgname=codelite
pkgver=13.0
pkgrel=1
pkgdesc="Cross platform C/C++/PHP and Node.js IDE written in C++"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'clang')
depends=('wxgtk'
          'clang' 'lldb'
          'libedit'
          'libssh'
          'mariadb-libs'
          'ncurses'
          'xterm' 'curl'
          'python2'
        )
optdepends=('graphviz: callgraph visualization'
             'clang: compiler'
             'gcc: compiler'
             'gdb: debugger'
             'valgrind: debugger'
            )

#source=(https://github.com/eranif/${pkgname}/archive/${pkgver//_/-}.tar.gz
#        http://repos.codelite.org/wxCrafterLibs/wxgui.zip)
#noextract=('wxgui.zip')


source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/eranif/${pkgname}/archive/${pkgver//_/-}.tar.gz"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

md5sums=('2f5251a0b5d6e1bc0d1bdc6ea7aa830b'
         '20f3428eb831c3ff2539a7228afaa3b4')


#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi


pkg_name_ver="${pkgname}-${pkgver//_/-}"

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}


build()
{
cd "${srcdir}/${pkg_name_ver}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"

mkdir -p build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DENABLE_CLANG=1 -DENABLE_LLDB=1 -DWITH_MYSQL=1 -DCMAKE_INSTALL_LIBDIR=lib ..
make
}

package()
{
cd "${srcdir}/${pkg_name_ver}/build"
make -j1 DESTDIR="${pkgdir}" install
install -m 644 -D "${srcdir}/${pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
}

#
# EOF
#
