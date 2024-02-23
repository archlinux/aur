# Maintainer: Snowstorm64

pkgname=librashader
pkgver=0.2.2
pkgrel=1
pkgdesc="A preprocessor, compiler, and runtime for RetroArch 'slang' shaders, rewritten in pure Rust."
arch=("x86_64" "aarch64")
url="https://github.com/SnowflakePowered/librashader"
license=("GPL-3.0-only" "MPL-2.0")
depends=("libgl" "vulkan-driver" "vulkan-icd-loader")
makedepends=("gcc" "ninja" "rust")
provides=("librashader")
conflicts=("librashader")
source=("https://github.com/SnowflakePowered/librashader/archive/refs/tags/librashader-v${pkgver}.tar.gz")
sha512sums=("315f49ed511a25f9217fc216eee38291950948cc2820f35c08887f54f2ed1ad9c6fbd8f8135bbcd41cd5838f85e77ebaee039e125d88dc248f3d1d9f0df57532")
profile="optimized"
fix_pkgname="${pkgname}-${pkgname}"

build() {
  cd "${fix_pkgname}-v${pkgver}"
  RUSTC_BOOTSTRAP=1 cargo run -p librashader-build-script -- --profile ${profile}
}

package() {
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  install -Dm 644 "${srcdir}/${fix_pkgname}-v${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MPL-2.0"  
  install -Dm 644 "${srcdir}/${fix_pkgname}-v${pkgver}/LICENSE-GPL.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-GPL-3.0-ONLY"

  install -m 755 "${srcdir}/${fix_pkgname}-v${pkgver}/target/${profile}/librashader.so" "${pkgdir}/usr/lib/librashader.so.${pkgver}"
  ln -s -r "${pkgdir}/usr/lib/librashader.so.${pkgver}" "${pkgdir}/usr/lib/librashader.so" 

  install -Dm 644 "${srcdir}/${fix_pkgname}-v${pkgver}/target/${profile}/librashader.h" "${pkgdir}/usr/include/${pkgname}/librashader.h"
  install -Dm 644 "${srcdir}/${fix_pkgname}-v${pkgver}/include/librashader_ld.h" "${pkgdir}/usr/include/${pkgname}/librashader_ld.h"
}
