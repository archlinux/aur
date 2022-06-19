# Maintainer: Snowstorm64

pkgname=mupen64plus-rsp-parallel-git
pkgver=r89.9869fb1
pkgrel=1
epoch=1
pkgdesc="Parallel RSP is a fast RSP LLE plugin for mupen64plus"
arch=("x86_64" "i686")
url="https://github.com/loganmc10/parallel-rsp"
license=("LGPL3" "MIT")
depends=("mupen64plus-git")
makedepends=("git")
provides=(mupen64plus-rsp-parallel)
conflicts=(mupen64plus-rsp-parallel)
source=("git+https://github.com/loganmc10/parallel-rsp.git#branch=m64p"
        "fix-build.patch")
sha256sums=("SKIP"
            "badfbb0a51ddca3b514e238a547ffe86523bbcd00d09b81a6efaca5c19ce4d7d")

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
