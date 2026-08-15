# Maintainer: Milk Brewster (milk on freenode)
# Original: skrylar@UFO
# Rebuilt to use MOD fork (no GTK dependency) and build lvtk v1 from source

pkgname=ams-lv2-git
pkgver=176
pkgrel=2
pkgdesc="Alsa Modular modules in LV2 form (MOD fork, no GTK UI)"
arch=('i686' 'x86_64')
url="https://github.com/moddevices/ams-lv2"
license=('GPL')
groups=('lv2-plugins')
depends=('fftw' 'cairo' 'lv2' 'gcc-libs' 'glibc')
makedepends=('git')
provides=()
conflicts=()
source=("ams-lv2::git+https://github.com/moddevices/ams-lv2#branch=change_ranges"
        "lvtk::git+https://github.com/lvtk/lvtk#branch=v1")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${srcdir}/ams-lv2"
  git rev-list HEAD --count
}

prepare() {
  # Build and install lvtk v1 manually (waf binary is corrupted on v1 branch)
  cd "${srcdir}/lvtk"
  local lvtk_prefix="${srcdir}/lvtk-prefix/usr"
  install -Dm644 lvtk-plugin.pc.in "${srcdir}/lvtk-plugin-1.pc"
  sed -i "s|@PREFIX@|${lvtk_prefix}|;s|@EXEC_PREFIX@|${lvtk_prefix}|;s|@LIBDIR@|${lvtk_prefix}/lib|;s|@INCLUDEDIR@|${lvtk_prefix}/include|;s|@VERSION@|1.2.0|;s|@LVTK_MAJOR_VERSION@|1|;s|@LVTK_PKG_DEPS@|lv2|;s|@THELIB@|lvtk-1|" "${srcdir}/lvtk-plugin-1.pc"
  # Compile the library
  g++ -shared -fPIC -Iinclude -I. src/plugin.cpp -o liblvtk-1.so
  # Install to a temporary prefix for ams-lv2 to find
  install -Dm755 liblvtk-1.so "${srcdir}/lvtk-prefix/usr/lib/liblvtk-1.so"
  mkdir -p "${srcdir}/lvtk-prefix/usr/include/lvtk-1"
  cp -a lvtk/* "${srcdir}/lvtk-prefix/usr/include/lvtk-1/"
  install -Dm644 "${srcdir}/lvtk-plugin-1.pc" "${srcdir}/lvtk-prefix/usr/lib/pkgconfig/lvtk-plugin-1.pc"

  # Build ams-lv2 (MOD fork)
  cd "${srcdir}/ams-lv2"
  # Patch waf for Python 3.12+ (imp module removed, rU mode removed)
  if [[ -d waflib ]]; then
    sed -i 's/import os, re, imp, sys/import os, re, types, sys/' waflib/Context.py 2>/dev/null
    sed -i 's/imp\.new_module/types.ModuleType/g' waflib/Context.py 2>/dev/null
    find waflib -name '*.py' -exec sed -i "s/'rU'/'r'/g" {} + 2>/dev/null
  fi
  export PKG_CONFIG_PATH="${srcdir}/lvtk-prefix/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
  export CXXFLAGS+=" -I${srcdir}/lvtk-prefix/usr/include"
  export LDFLAGS+=" -L${srcdir}/lvtk-prefix/usr/lib"
  CFLAGS+=" -fcommon" ./waf configure --prefix=/usr
}

build() {
  cd "${srcdir}/ams-lv2"
  export PKG_CONFIG_PATH="${srcdir}/lvtk-prefix/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
  export CXXFLAGS+=" -I${srcdir}/lvtk-prefix/usr/include"
  export LDFLAGS+=" -L${srcdir}/lvtk-prefix/usr/lib"
  CFLAGS+=" -fcommon" ./waf
}

package() {
  cd "${srcdir}/ams-lv2"
  ./waf install --destdir="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
