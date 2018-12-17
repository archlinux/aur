# Maintainer: Andrew Whatson <whatson@gmail.com>

_pkgbase=faudio-wrappers
_gitname=FAudio
pkgbase=${_pkgbase}-git
pkgname=("${_pkgbase}-win32-git" "${_pkgbase}-win64-git")
pkgver=r997.d8224a0
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
            '78d4146056bb8b50833580aeacf868040ee36854716c499f5039de1952fb9ca8')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_build_faudio-wrappers() {
  _mingw=$1

  _builddir="${srcdir}/${_gitname}/build-${_mingw}"
  _installdir="${srcdir}/${_gitname}/install-${_mingw}"

  mkdir -p "${_builddir}"
  cd "${_builddir}"

  unset LDFLAGS

  ${_mingw}-cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${_installdir}" \
    -DFFMPEG=ON \
    -DBUILD_CPP=ON \
    -DINSTALL_MINGW_DEPENDENCIES=ON

  make
}

build() {
  ( _build_faudio-wrappers i686-w64-mingw32 )
  ( _build_faudio-wrappers x86_64-w64-mingw32 )
}

_package_faudio-wrappers() {
  _arch=$1
  _mingw=$2

  _pkgname="${_pkgbase}-win${_arch}"
  _builddir="${srcdir}/${_gitname}/build-${_mingw}"
  _installdir="${srcdir}/${_gitname}/install-${_mingw}"

  cd "${_builddir}"

  make install

  install -D -t "${pkgdir}/usr/share/${_pkgname}" "${_installdir}/bin"/*.dll
  install -D -m644 -t "${pkgdir}/usr/share/${_pkgname}" ../../setup_faudio_aur.verb
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" ../LICENSE
  install -d "${pkgdir}/usr/bin"

  if [ "${_arch}" = "64" ]; then
    sed -e 's/${W_SYSTEM32_DLLS}/${W_SYSTEM64_DLLS}/g' \
        -e 's/${W_SYSTEM32_DLLS_WIN}/${W_SYSTEM64_DLLS_WIN64}/g' \
        -i "${pkgdir}/usr/share/${_pkgname}/setup_faudio_aur.verb"
  fi

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
