# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
pkgname=mingw-w64-crt-git
pkgver=4.0.rc1.r7.gc440466
pkgrel=1
pkgdesc='MinGW-w64 CRT for Windows'
arch=('any')
url='http://mingw-w64.sourceforge.net'
license=('custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=()
makedepends=('git' 'mingw-w64-gcc-base' 'mingw-w64-binutils' 'mingw-w64-headers-git')
optdepends=()
provides=('mingw-w64-crt' 'mingw-w64-crt-svn')
conflicts=('mingw-w64-crt' 'mingw-w64-crt-svn')
replaces=('mingw-w64-crt-svn')
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

prepare() {
  cd ${srcdir}/mingw-w64/mingw-w64-crt
  aclocal
  automake
}

build() {
  cd ${srcdir}
  for _target in ${_targets}; do
    msg "Building ${_target} CRT"
    if [ ${_target} == "i686-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib64 --enable-lib32"
    elif [ ${_target} == "x86_64-w64-mingw32" ]; then
        _crt_configure_args="--disable-lib32 --enable-lib64"
    fi
    mkdir -p ${srcdir}/crt-${_target} && cd ${srcdir}/crt-${_target}
    ${srcdir}/mingw-w64/mingw-w64-crt/configure --prefix=/usr/${_target} \
        --host=${_target} --enable-wildcard \
        ${_crt_configure_args}
    make
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} crt"
    cd ${srcdir}/crt-${_target}
    make DESTDIR=${pkgdir} install
  done
}

