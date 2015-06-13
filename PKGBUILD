# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
pkgname=mingw-w64-winpthreads-git
pkgver=4.0.rc1.r7.gc440466
pkgrel=1
pkgdesc='MinGW-w64 winpthreads library'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=()
makedepends=('git' 'mingw-w64-gcc-base' 'mingw-w64-binutils' 'mingw-w64-crt-git')
optdepends=()
provides=('mingw-w64-winpthreads' 'mingw-w64-headers-bootstrap' 'mingw-w64-winpthreads-svn')
conflicts=('mingw-w64-headers-bootstrap' 'mingw-w64-winpthreads' 'mingw-w64-winpthreads-svn')
replaces=('mingw-w64-headers-bootstrap' 'mingw-w64-winpthreads-svn')
backup=()
options=('!strip' '!buildflags' 'staticlibs' '!emptydirs')
source=(git://git.code.sf.net/p/mingw-w64/mingw-w64)
md5sums=(SKIP)

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
    msg "Building ${_target} winpthreads..."
    mkdir -p ${srcdir}/winpthreads-build-${_target} && cd ${srcdir}/winpthreads-build-${_target}
    ${srcdir}/mingw-w64/mingw-w64-libraries/winpthreads/configure --prefix=/usr/${_target} \
        --host=${_target} --enable-static --enable-shared
    make
  done
}

package() {
  for _target in ${_targets}; do
    cd ${srcdir}/winpthreads-build-${_target}
    make DESTDIR=${pkgdir} install
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
  done
}