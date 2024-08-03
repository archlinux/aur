# Maintainer: Snowstorm64

pkgname=librashader
pkgver=0.3.0
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
sha512sums=("18f468d32f50d7508870d54101b63296e353c81680859abba17d77d21fe47a4f4eebaf3efd2c0cfd1e1075a3f45a500207543dada4d53ae207418522ccf2fd38")
_build_profile="optimized"
_fix_pkgname="${pkgname}-${pkgname}"

build() {
  cd "${_fix_pkgname}-v${pkgver}"
  RUSTC_BOOTSTRAP=1 cargo run -p librashader-build-script -- --profile ${_build_profile}
}

package() {
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MPL-2.0"  
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/LICENSE-GPL.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL-3.0-ONLY"

  install -m 755 "${srcdir}/${_fix_pkgname}-v${pkgver}/target/${_build_profile}/librashader.so" "${pkgdir}/usr/lib/librashader.so.${pkgver}"
  ln -s -r "${pkgdir}/usr/lib/librashader.so.${pkgver}" "${pkgdir}/usr/lib/librashader.so" 

  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/target/${_build_profile}/librashader.h" "${pkgdir}/usr/include/${pkgname}/librashader.h"
  install -Dm 644 "${srcdir}/${_fix_pkgname}-v${pkgver}/include/librashader_ld.h" "${pkgdir}/usr/include/${pkgname}/librashader_ld.h"
}
