# Maintainer: Popolon <popolon(aLpopolon.org>

pkgbase=microw8
pkgname=microw8
pkgdesc="microw8"
pkgver=0.4.1
pkgrel=1
conflicts=(microw8-src)
#pkgdesc="WebAssembly based fantasy console inspired by the likes of TIC-80, WASM-4 and PICO-8."
arch=('x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url='https://exoticorn.github.io/microw8'
license=('The Unlicense')
makedepends=('rust')
source=("https://github.com/exoticorn/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e6de18c52d11e59e7db4d9f6e129b43b7ef6122ec081b5242c7eb724e9e077aa')

build() {
  cd ${pkgname}-${pkgver}/
  cargo build --release
}

_package() {
  pkgdesc="${pkgdesc}, WebAssembly based fantasy console inspired by the likes of TIC-80, WASM-4 and PICO-8."
  cd ${pkgname}-${pkgver}
  install -Dm755 "target/release/uw8" "$pkgdir/usr/bin/uw8"
  install -Dm644 UNLICENSE -t "$pkgdir/usr/share/licenses/microw8/UNLICENSE"
  #install -Dm644 README.md "$pkgdir/usr/share/doc/microw8/README.md"
  #install -Dm644 microw8.html "$pkgdir/usr/share/doc/microw8/microw8.html"
}

_package-examples() {
  pkgdesc="Examples for ${pkgdesc}"
  cd ${pkgbase}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/doc/microw8
  cp -a examples ${pkgdir}/usr/share/doc/microw8/
}

pkgname=(
 "${pkgbase}"
 "${pkgbase}-examples"
)
for _p in "${pkgname[@]}"; do
   eval "package_$_p() {
     $(declare -f "_package${_p#$pkgbase}")
     _package${_p#$pkgbase}
   }"
done

