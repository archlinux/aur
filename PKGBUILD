# Maintainer: Snowstorm64

pkgname=mupen64plus-rsp-parallel-git
pkgver=r90.4cf680b
pkgrel=2
epoch=1
pkgdesc="Parallel RSP is a fast RSP LLE plugin for mupen64plus"
arch=("x86_64")
url="https://github.com/Mastergatto/parallel-rsp"
license=("LGPL3" "MIT")
depends=("mupen64plus-git")
makedepends=("git")
provides=(mupen64plus-rsp-parallel)
conflicts=(mupen64plus-rsp-parallel)
source=("git+https://github.com/Mastergatto/parallel-rsp.git#branch=m64p"
        "fix-build.patch")
sha256sums=("SKIP"
            "65d6385d8636048e4337ac0a4eed3dc9bfb8ddd37d329f6b6a30a7fda9c1f2e8")

_pkgname=mupen64plus-rsp-parallel
_pkgdir=parallel-rsp

pkgver() {
  cd "${srcdir}/${_pkgdir}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # We need to correct the include directory's path
  patch -Np1 -i "${srcdir}/fix-build.patch"
}

build() {
  mkdir -p "${srcdir}/${_pkgdir}/build"
  cd "${srcdir}/${_pkgdir}/build"
  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  # This plugin is dual-licensed LGPL3/MIT, and for latter case we have to install its custom license as required
  install -Dm 644 "${srcdir}/${_pkgdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgdir}/LICENSE"
  install -Dm 644 "${srcdir}/${_pkgdir}/LICENSE.MIT" "${pkgdir}/usr/share/licenses/${_pkgdir}/LICENSE.MIT"
  
  install -Dm 644 "${srcdir}/${_pkgdir}/build/${_pkgname}.so" "${pkgdir}/usr/lib/mupen64plus/${_pkgname}.so"
}
