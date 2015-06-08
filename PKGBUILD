
pkgname=mingw-w64-intel-tbb
pkgver=4.3_20150424
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='http://www.threadingbuildingblocks.org/'
license=('GPL')
source=("http://threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb${pkgver/\./}oss_src.tgz")
sha1sums=('21a3176bf09677b795df2c529065c265a2ad72ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/tbb${pkgver/\./}oss

  # do not build debug libraries
  sed -i "/debug/d" Makefile

  # platform configuration
  sed -i "s|export SHELL = cmd|export SHELL = sh -c|g" build/windows.inc
  sed -i "s|CMD=cmd /C|CMD=sh -c|g" build/windows.inc
  sed -i "s|CWD=\$(shell cmd /C echo %CD%)|CWD=\$(shell pwd)|g" build/windows.inc
  sed -i "s|RM=cmd /C del /Q /F|RM?=rm -f|g" build/windows.inc
  sed -i "s|RD=cmd /C rmdir|RD?=rmdir|g" build/windows.inc
  sed -i "s|MD=cmd /c mkdir|MD?=mkdir -p|g" build/windows.inc
  sed -i "s|SLASH=\\\\\\\\|SLASH=/|g" build/windows.inc
  sed -i "s|NUL = nul|NUL= /dev/null|g" build/windows.inc
  sed -i "s|.DLL = tbb|.DLL = libtbb|g" build/windows.inc
  sed -i "s|.LIB = tbb|.LIB = libtbb|g" build/windows.inc
  sed -i "/MAKE_VERSIONS/d" build/windows.inc
  echo "MAKE_VERSIONS=sh \$(tbb_root)/build/version_info_linux.sh \$(CPLUS) \$(CPLUS_FLAGS) \$(INCLUDES) >version_string.ver" >> build/windows.inc
  sed -i "/MAKE_TBBVARS/d" build/windows.inc
  echo "MAKE_TBBVARS=sh \$(tbb_root)/build/generate_tbbvars.sh" >> build/windows.inc
  sed -i "s|LIBDL =|LIBDL = -ldl|g" build/windows.inc

  # compiler configuration
  sed -i "s|CPLUS_FLAGS = \-g \-O2|CPLUS_FLAGS = \-O2 \-g \-pipe \-Wall \-Wp,\-D_FORTIFY_SOURCE=2 \-fexceptions \-\-param=ssp\-buffer\-size=4|g" build/windows.gcc.inc
  sed -i "s|OUTPUT_KEY = -o #|OUTPUT_KEY = -Wl,--out-implib,\$(BUILDING_LIBRARY).a -o #|g" build/windows.gcc.inc
  sed -i "s|\$(call detect_js,/minversion gcc 4.4)|ok|g" build/windows.gcc.inc
  sed -i "s|\$(call detect_js,/minversion gcc 4.8)|ok|g" build/windows.gcc.inc
}

build() {
  cd "$srcdir"/tbb${pkgver/\./}oss
  for _arch in ${_architectures}; do
    cp build/windows.gcc.inc build/windows.${_arch}-gcc.inc
    sed -i "s|CPLUS = g++|CPLUS = ${_arch}-g++|g" build/windows.${_arch}-gcc.inc
    sed -i "s|CONLY = gcc|CONLY = ${_arch}-gcc|g" build/windows.${_arch}-gcc.inc
    if test "${_arch}" = "x86_64-w64-mingw32"
    then
      parch=intel64
    else
      parch=ia32
    fi
    unset LDFLAGS
    make arch=$parch tbb_os=windows runtime=mingw compiler=${_arch}-gcc
  done
}

package() {
  cd "$srcdir"/tbb${pkgver/\./}oss
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/{include,lib,bin}
    cp -a include/tbb "$pkgdir"/usr/${_arch}/include
    install -m755 build/windows_*${_arch}*_release/*.dll "$pkgdir"/usr/${_arch}/bin
    install -m755 build/windows_*${_arch}*_release/*.a "$pkgdir"/usr/${_arch}/lib
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
