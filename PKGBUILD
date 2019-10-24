# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Sergej Pupykin < pupykin dot s+arch at gmail dot com>
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: rubenvb < vanboxem dot ruben at gmail dot com >
# Contributor: rkitover < rkitover at gmail dot com >

_pkgver=6.0.0
_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-headers-git
pkgver=6.0.0.20190901
pkgrel=1
pkgdesc="MinGW-w64 headers for Windows (git version)"
arch=('any')
url="https://mingw-w64.org/doku.php"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
makedepends=('git')
provides=("mingw-w64-headers=${pkgver}")
conflicts=('mingw-w64-headers')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://git.code.sf.net/p/mingw-w64/mingw-w64#commit=0a1d495478d8ed1a94fc77b9dbb428b7e0372588")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mingw-w64"
  echo "${_pkgver}.`git log -1 --date=short --format=%cd | sed s/-//g`"
}

build() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Configuring ${_target} headers"
    mkdir -p "headers-${_target}" && pushd "headers-${_target}"
    ../mingw-w64/mingw-w64-headers/configure \
      --prefix=/usr/${_target} \
      --enable-sdk=all \
      --enable-secure-api \
      --host=${_target}
    popd
  done
}

package() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Installing ${_target} headers"
    pushd "headers-${_target}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/${_target}/include/"pthread_{signal,time,unistd}.h
    popd
  done

  msg "Installing MinGW-w64 licenses"
  install -Dm644 "${srcdir}/mingw-w64/COPYING.MinGW-w64/COPYING.MinGW-w64.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt"
  install -Dm644 "${srcdir}/mingw-w64/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt"
  install -Dm644 "${srcdir}/mingw-w64/mingw-w64-headers/ddk/readme.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ddk-readme.txt"
  install -Dm644 "${srcdir}/mingw-w64/mingw-w64-headers/direct-x/COPYING.LIB" "${pkgdir}/usr/share/licenses/${pkgname}/direct-x-COPYING.LIB"
  install -Dm644 "${srcdir}/mingw-w64/mingw-w64-headers/direct-x/readme.txt" "${pkgdir}/usr/share/licenses/${pkgname}/direct-x-readme.txt"
}

# vim:set ts=2 sw=2 et:
