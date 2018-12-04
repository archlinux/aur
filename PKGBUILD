# Maintainer: Andrew Whatson <whatson@gmail.com>

_pkgbase=faudio-wrappers
_gitname=FAudio
pkgbase=${_pkgbase}-git
pkgname=("${_pkgbase}-win32-git" "${_pkgbase}-win64-git")
pkgver=r949.acc1aaa
pkgrel=1
pkgdesc="Accuracy-focused XAudio reimplementation for open platforms"
arch=('i686' 'x86_64')
url='https://github.com/FNA-XNA/FAudio'
license=('custom')
depends=('wine' 'winetricks')
makedepends=('git' 'mingw-w64-gcc' 'mingw-w64-sdl2' 'mingw-w64-ffmpeg')
source=('git+https://github.com/FNA-XNA/FAudio'
        'setup_faudio_aur.verb')
sha256sums=('SKIP'
            '0fd64206dad7f7e255f1097eb50e1b2c770a6832adfa32549797accc44610b65')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_build_faudio-wrappers() {
  cd "$srcdir/${_gitname}"

  _mingw=$1

  export PATH=/usr/${_mingw}/bin:${PATH}
  export CC=${_mingw}-gcc
  export CXX=${_mingw}-g++
  export AR=${_mingw}-ar
  export DLLTOOL=${_mingw}-dlltool
  unset LDFLAGS

  export DISABLE_XNASONG=1
  export FAUDIO_RELEASE=1
  export FAUDIO_FFMPEG=1
  export FAUDIO_FFMPEG_PREFIX=/usr/${_mingw}

  make clean
  make
  make -C cpp
}

build() {
  ( _build_faudio-wrappers i686-w64-mingw32 )
  ( _build_faudio-wrappers x86_64-w64-mingw32 )
}

_package_faudio-wrappers() {
  cd "$srcdir/${_gitname}"

  _arch=$1
  _mingw=$2
  _pkgname="${_pkgbase}-win${_arch}"

  install -D -t "${pkgdir}/usr/share/${_pkgname}" "cpp/build_win${_arch}"/*.dll
  install -D -m644 -t "${pkgdir}/usr/share/${_pkgname}" ../setup_faudio_aur.verb
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
  install -d "${pkgdir}/usr/bin"

  find "${pkgdir}/usr/share/${_pkgname}" -name '*.dll' -exec ${_mingw}-strip --strip-unneeded {} \;

  sed -i "s/SYSTEM32/SYSTEM${_arch}/g" "${pkgdir}/usr/share/${_pkgname}/setup_faudio_aur.verb"

  ( echo "#!/bin/sh"
    echo "winetricks --force /usr/share/${_pkgname}/setup_faudio_aur.verb"
  ) > "${pkgdir}/usr/bin/setup_faudio${_arch}"
  chmod +x "${pkgdir}/usr/bin/setup_faudio${_arch}"
}

package_faudio-wrappers-win32-git() {
  arch=('i686' 'x86_64')
  provides=("${_pkgbase}-win32")
  _package_faudio-wrappers 32 i686-w64-mingw32
}

package_faudio-wrappers-win64-git() {
  arch=('x86_64')
  provides=("${_pkgbase}-win64")
  _package_faudio-wrappers 64 x86_64-w64-mingw32
}
