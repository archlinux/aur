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

pkgname=codelite
pkgver=9.1
pkgrel=1
pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('wxgtk' 'curl' 'webkitgtk2' 'libssh' 'xterm' 'python2' 'libedit' 'ncurses' 'valgrind' 'libmariadbclient' 'lldb')
makedepends=('pkgconfig' 'cmake')
optdepends=('graphviz: callgraph visualization')

source=(https://github.com/eranif/${pkgname}/archive/${pkgver//_/-}.tar.gz
	http://repos.codelite.org/wxCrafterLibs/wxgui.zip)

md5sums=('e1ae35b6e6b63e774a75fe7d02892055'
         '093485fcae62073ca8d0ba6ff3a5cb69')

#if [[ "$CARCH" == 'i686' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/32/wxCrafter.so)
#  md5sums+=('cd3e71e8187ce586031df070caed6c85')
#elif [[ "$CARCH" == 'x86_64' ]]; then
#  source+=(http://repos.codelite.org/wxCrafterLibs/ArchLinux/64/wxCrafter.so)
#  md5sums+=('6fcd2f0fada5fc401d0bcd62cd5452bb')
#fi

noextract=('wxgui.zip')

pkg_name_ver="${pkgname}-${pkgver//_/-}"

# 20151027: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: -DENABLE_LLDB=0: ArchLinux clang/llvm-3.7: CommandLine Error: Option 'aarch64-reserve-x18' registered more than once
# 20151027: sudo chmod 000 /usr/lib/codelite/LLDBDebugger.so

build() {
    cd "${srcdir}/${pkg_name_ver}"

    CXXFLAGS="${CXXFLAGS} -fno-devirtualize"

    mkdir -p build
    cd build
    # ArchLinux: CL 9.1.0 still needs to be built without LLDB because of error: Option 'aarch64-reserve-x18' registered more than once
    #cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DENABLE_CLANG=1 -DENABLE_LLDB=1 -DWITH_MYSQL=1 -DCMAKE_INSTALL_LIBDIR=lib ..
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DENABLE_CLANG=1 -DENABLE_LLDB=0 -DWITH_MYSQL=1 -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

package() {
    cd "${srcdir}/${pkg_name_ver}/build"
    make -j1 DESTDIR="${pkgdir}" install
#    install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
    install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"
    install -m 644 -D "${srcdir}/${pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
