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
_pkg_name="codelite"
_pkg_ver="17.0.0"
#_commit="70ff062252ca69617fd227472a6492720dc19cfd"

# ctags submodule
_ctags_pkg_name="eranif-ctags"
_ctags_pkg_ident="52c724d1132d78ea44894bfe2eaca44f38a9bd85"
_ctags_pkg_name_ident="${_ctags_pkg_name}-${_ctags_pkg_ident:0:7}"

# wxdap/wxdap submodule
_wxdap_pkg_name="eranif-wxdap"
_wxdap_pkg_ident="6b4f0310c632776575495487f74b77c80732e747"
_wxdap_pkg_name_ident="${_wxdap_pkg_name}-${_wxdap_pkg_ident:0:7}"

# wxcfg/wx-config-msys2
_wxcfg_pkg_name="eranif-wxcfg"
_wxcfg_pkg_ident="fe65daf2a49e2a1f218ea3106a26d5ae7c4235fb"
_wxcfg_pkg_name_ident="${_wxcfg_pkg_name}-${_wxcfg_pkg_ident:0:7}"


# pkg
pkgname="${_pkg_name}"
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

makedepends=('pkgconfig' 'cmake' 'ninja' 'clang')

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
    "${_pkg_name_ident}.tar.gz::https://github.com/eranif/${_pkg_name}/archive/${_pkg_ident}.tar.gz"
    "codelite-ctags.tar.gz::https://github.com/eranif/ctags/tarball/${_ctags_pkg_ident}"
    "codelite-wxdap.tar.gz::https://github.com/eranif/wxdap/tarball/${_wxdap_pkg_ident}"
    "codelite-wxcfg.tar.gz::https://github.com/eranif/wx-config-msys2/tarball/${_wxcfg_pkg_ident}"
    "http://repos.codelite.org/wxCrafterLibs/wxgui.zip"
  )

sha256sums=('ce07be2399c5b3907e5f713ce7ba2182aa8d90c44f90214f7ec841086f20fd0c'
            '77cd02b001f8d677ce0842eb3d93675a5762c7cedc96e5a915b247be1eaaa075'
            '3aa515f4dd9bffa55f4293651cb687b682208dc361e88b89e33eb98ef0d616d9'
            '70aca36b95e2245740c17fc9a164fd6edabfd9c631184ea66cc5ee03ff54c028'
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

  # submodule eranif-wxdap to wxdap
  rmdir wxdap
  ln -s ../${_wxdap_pkg_name_ident} wxdap

  # submodule eranif-wx-config-msys2 to wx-config-msys2
  rmdir wx-config-msys2
  ln -s ../${_wxcfg_pkg_name_ident} wx-config-msys2

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

cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DWITH_PCH=0 -DWITH_WX_CONFIG=${WX_CONFIG} -DWITH_NATIVEBOOK=1 -DENABLE_LLDB=1 -DWITH_MYSQL=0 -DCMAKE_INSTALL_LIBDIR=lib
#-DCMAKE_INSTALL_RPATH=/opt/wxgtk-dev/lib

#make -C "${BUILD_DIR}"
cmake --build "${BUILD_DIR}"

}

#
#
#
package()
{
cd "${srcdir}/${_pkg_name_ident}"

#make -C "${BUILD_DIR}" -j1 DESTDIR="${pkgdir}" install
DESTDIR="${pkgdir}" cmake --install "${BUILD_DIR}"

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
