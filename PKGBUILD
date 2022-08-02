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

#
_pkg_name=codelite
_pkg_ver=16.0.0-1
#_commit=70ff062252ca69617fd227472a6492720dc19cfd

# pkg
pkgname=${_pkg_name}
#pkgver=${_pkg_ver}
#pkgver="${_pkg_ver//_/-}"
pkgver="${_pkg_ver/-*/}"
pkgrel=1


# version
_pkg_ident="${_pkg_ver}"
_pkg_name_ver="${_pkg_name}-${_pkg_ver}"
##_pkg_name_ver="${_pkg_name}-${_pkg_ver//_/-}"

# commit
#pkg_ident="${_commit}"
#pkg_name_ver="${_pkg_name}-${_commit}"


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
conflicts=('codelite-unstable')

source=(
    "${_pkg_name_ver}.tar.gz::https://github.com/eranif/${_pkg_name}/archive/${_pkg_ident}.tar.gz"
    http://repos.codelite.org/wxCrafterLibs/wxgui.zip
  )

sha256sums=('96c6c3c0889ed05a176a569e9fb697a0f82c877efd49eaf1700a476b65fb091d'
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
  cd "${srcdir}/${_pkg_name_ver}"
  # temporary hack: remove wxcrafter
  rm -rf wxcrafter
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}


#
#
#
build()
{
cd "${srcdir}/${_pkg_name_ver}"

CXXFLAGS="${CXXFLAGS} -fno-devirtualize"
export CXXFLAGS

# cmake find_package() will try env var WX_CONFIG as wx-config tool path before checking its builtin hardcoded naming conbinations for wx-config tool
#WX_CONFIG="wx-config"
#WX_CONFIG="wx-config-gtk2"
#WX_CONFIG="wx-config-gtk3"
WX_CONFIG="wx-config"
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
cd "${srcdir}/${_pkg_name_ver}"

make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
install -m 644 -D "${srcdir}/${_pkg_name_ver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg_name}/LICENSE"
#install -m 755 -D "${srcdir}/wxCrafter.so" "${pkgdir}/usr/lib/codelite/wxCrafter.so"
#install -m 644 -D "${srcdir}/wxgui.zip" "${pkgdir}/usr/share/codelite/wxgui.zip"

# universal-ctags experiment
mv "${pkgdir}/usr/bin/codelite-ctags" "${pkgdir}/usr/bin/codelite-ctags.dist"
ln -s /usr/bin/ctags "${pkgdir}/usr/bin/codelite-ctags"

}

#
# EOF
#
