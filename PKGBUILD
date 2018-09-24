# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
# Contributor: rkitover <rkitover@gmail.com>

_pkgver=6.0.0
_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-crt-git
pkgver=6.0.0.20180923
pkgrel=1
pkgdesc="MinGW-w64 CRT for Windows (git version)"
arch=('any')
url="https://mingw-w64.org/doku.php"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
makedepends=('git'
             'mingw-w64-gcc-base'
             'mingw-w64-binutils'
             "mingw-w64-headers-git>=${pkgver}")
provides=("mingw-w64-crt=${pkgver}")
conflicts=('mingw-w64-crt')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://git.code.sf.net/p/mingw-w64/mingw-w64")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mingw-w64"
  echo "${_pkgver}.`git log -1 --date=short --format=%cd | sed s/-//g`"
}

prepare() {
  cd "${srcdir}/mingw-w64/mingw-w64-crt"
  aclocal
  automake
}

build() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Building ${_target} CRT"
    if [ ${_target} == "i686-w64-mingw32" ]; then
      _crt_configure_args="--disable-lib64 --enable-lib32"
    elif [ ${_target} == "x86_64-w64-mingw32" ]; then
      _crt_configure_args="--disable-lib32 --enable-lib64"
    fi
    mkdir -p "crt-${_target}" && pushd "crt-${_target}"
    ../mingw-w64/mingw-w64-crt/configure \
      --prefix=/usr/${_target} \
      --host=${_target} \
      --enable-wildcard \
      ${_crt_configure_args}
    make
    popd
  done
}

package() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Installing ${_target} crt"
    pushd "crt-${_target}"
    make DESTDIR="${pkgdir}" install
    popd
  done
}

# vim:set ts=2 sw=2 et:
