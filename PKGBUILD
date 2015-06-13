# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
pkgname='mingw-w64-headers-git'
pkgdesc="MinGW-w64 headers for Windows"
pkgver=4.0.rc1.r7.gc440466
pkgrel=1
arch=('any')
url="http://mingw-w64.sourceforge.net"
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=()
makedepends=('git')
optdepends=()
provides=('mingw-w64-headers' 'mingw-w64-headers-svn')
conflicts=('mingw-w64-headers' 'mingw-w64-headers-svn')
replaces=('mingw-w64-headers-svn')
backup=()
options=('!strip' '!libtool' '!emptydirs')
source=(git://git.code.sf.net/p/mingw-w64/mingw-w64
        'mingw-headers-no-widl.patch')
md5sums=('SKIP'
         'cd36bb22ac918fff8b9c6467dae3f8dd')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/mingw-w64"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  for _target in ${_targets}; do
    msg "Configuring ${_target} headers"
    mkdir -p ${srcdir}/headers-${_target} && cd ${srcdir}/headers-${_target}
    ${srcdir}/mingw-w64/mingw-w64-headers/configure --prefix=/usr/${_target} --enable-sdk=all --enable-secure-api --host=${_target}
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} headers"
    cd ${srcdir}/headers-${_target}
    make DESTDIR=${pkgdir} install
    rm ${pkgdir}/usr/${_target}/include/pthread_signal.h
    rm ${pkgdir}/usr/${_target}/include/pthread_time.h
    rm ${pkgdir}/usr/${_target}/include/pthread_unistd.h
  done

  msg "Installing MinGW-w64 licenses"
  install -Dm644 ${srcdir}/mingw-w64/COPYING.MinGW-w64/COPYING.MinGW-w64.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64.txt
  install -Dm644 ${srcdir}/mingw-w64/COPYING.MinGW-w64-runtime/COPYING.MinGW-w64-runtime.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MinGW-w64-runtime.txt
  install -Dm644 ${srcdir}/mingw-w64/mingw-w64-headers/ddk/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/ddk-readme.txt
  install -Dm644 ${srcdir}/mingw-w64/mingw-w64-headers/direct-x/COPYING.LIB ${pkgdir}/usr/share/licenses/${pkgname}/direct-x-COPYING.LIB
  install -Dm644 ${srcdir}/mingw-w64/mingw-w64-headers/direct-x/readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/direct-x-readme.txt
}
