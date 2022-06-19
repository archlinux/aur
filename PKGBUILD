# Maintainer: Snowstorm64

pkgname=mupen64plus-video-parallel-git
pkgver=r25.813a98a
pkgrel=1
pkgdesc="Parallel RDP is a Vulkan-based RDP LLE plugin for mupen64plus"
arch=("x86_64" "i686")
url="https://github.com/loganmc10/parallel-rdp-standalone"
license=("MIT")
depends=("mupen64plus-git")
makedepends=("git" "mesa")
optdepends=("mupen64plus-rsp-parallel: preferred LLE RSP to be paired with this plugin"
            "mupen64plus-rsp-cxd4: alternative LLE RSP to be paired with this plugin")
provides=(mupen64plus-video-parallel)
conflicts=(mupen64plus-video-parallel)
source=("git+https://github.com/loganmc10/parallel-rdp-standalone.git#branch=m64p"
        "fix-build.patch")
sha256sums=("SKIP"
            "98ecfc3377f8985606ea6a3c6d82823b4b122aabccc9dbe7ddf1dbcae7aeb673")
_pkgname=mupen64plus-video-parallel
_pkgdir=parallel-rdp-standalone

pkgver() {
  cd "${srcdir}/${_pkgdir}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
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
  # This plugin is licensed under MIT, so we have to install its custom license as required
  install -Dm 644 "${srcdir}/${_pkgdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -Dm 644 "${srcdir}/${_pkgdir}/build/${_pkgname}.so" "${pkgdir}/usr/lib/mupen64plus/${_pkgname}.so"
}
