# Maintainer: Snowstorm64

pkgname=librashader
pkgver=0.4.3
pkgrel=1
pkgdesc="A preprocessor, compiler, and runtime for RetroArch 'slang' shaders, rewritten in pure Rust."
arch=("x86_64" "aarch64")
url="https://github.com/SnowflakePowered/librashader"
license=("GPL-3.0-only" "MPL-2.0")
depends=("libgl" "vulkan-driver" "vulkan-icd-loader")
makedepends=("gcc" "ninja" "rust")
options=(!lto) # workaround for some missing symbols
provides=("librashader")
conflicts=("librashader")
source=("https://github.com/SnowflakePowered/librashader/archive/refs/tags/librashader-v${pkgver}.tar.gz")
sha512sums=("1ffb50c4d1fb83bd2cd1d672209777cb90c4a2ff1ff274d95726f51fe0cba02fdc6cb56b9d84a424e1e34d3f4b3bc68b0016531c940a6f3d111ba68c04eddc67")
_build_profile="optimized"
_fix_pkgname="${pkgname}-${pkgname}"

build() {
  cd "${_fix_pkgname}-v${pkgver}"
  cargo run -p librashader-build-script -- --stable --profile ${_build_profile} -- --no-default-features --features=runtime-vulkan,runtime-opengl
}

package() {
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MPL-2.0"  
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/LICENSE-GPL.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL-3.0-ONLY"

  install -m 755 "${srcdir}/${_fix_pkgname}-v${pkgver}/target/${_build_profile}/librashader.so" "${pkgdir}/usr/lib/librashader.so.${pkgver}"
  ln -s -r "${pkgdir}/usr/lib/librashader.so.${pkgver}" "${pkgdir}/usr/lib/librashader.so" 

  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/include/librashader.h" "${pkgdir}/usr/include/${pkgname}/librashader.h"
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/include/librashader_ld.h" "${pkgdir}/usr/include/${pkgname}/librashader_ld.h"
}
