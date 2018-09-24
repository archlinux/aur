# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
# Contributor: rkitover <rkitover@gmail.com>

_pkgver=6.0.0
_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-winpthreads-git
pkgver=6.0.0.20180923
pkgrel=1
pkgdesc="MinGW-w64 winpthreads library (git version)"
arch=('any')
url="https://mingw-w64.org/doku.php"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
makedepends=('git'
             'mingw-w64-gcc-base'
             'mingw-w64-binutils'
             "mingw-w64-crt-git>=${pkgver}")
provides=("mingw-w64-winpthreads=${pkgver}"
          'mingw-w64-headers-bootstrap')
conflicts=('mingw-w64-winpthreads'
           'mingw-w64-headers-bootstrap')
replaces=('mingw-w64-headers-bootstrap')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://git.code.sf.net/p/mingw-w64/mingw-w64")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mingw-w64"
  echo "${_pkgver}.`git log -1 --date=short --format=%cd | sed s/-//g`"
}

build() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Building ${_target} winpthreads..."
    mkdir -p "winpthreads-build-${_target}" && pushd "winpthreads-build-${_target}"
    ../mingw-w64/mingw-w64-libraries/winpthreads/configure \
        --prefix=/usr/${_target} \
        --host=${_target} \
        --enable-static \
        --enable-shared
    make
    popd
  done
}

package() {
  cd "${srcdir}"
  for _target in ${_targets}; do
    msg "Installing ${_target} headers"
    pushd "winpthreads-build-${_target}"
    make DESTDIR="${pkgdir}" install
    ${_target}-strip --strip-unneeded "${pkgdir}"/usr/${_target}/bin/*.dll
    popd
  done
}

# vim:set ts=2 sw=2 et:
