# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgname=vkvg
pkgver=0.3.0
_pkgver=$pkgver-beta
pkgrel=1
pkgdesc='Vulkan 2D graphics library'
arch=(x86_64)
url='https://github.com/jpbruyere/vkvg'
license=('MIT')
depends=(fontconfig freetype2 harfbuzz vulkan-icd-loader vulkan-driver)
options=(strip)
makedepends=(cmake make xxd git vulkan-headers
             shaderc) # for `glslc`
source=("https://github.com/jpbruyere/vkvg/archive/refs/tags/v$_pkgver.tar.gz"
        "git+https://github.com/jpbruyere/vkhelpers#commit=18059c4c6464ff13ffb6764c8a882cf66d0676f5"
        "git+https://github.com/jpbruyere/glutess.git#commit=8869aa8c486dbe7b169674f0173ec25d9fe069c8"
        "git+https://github.com/jpbruyere/vkvg-svg.git#commit=236f3b6123f8fcfdb2f4194f382298d5a80386bd"
        "https://github.com/jpbruyere/vkvg/commit/873610656b4ac2d4595721fee07f0671f4911d73.patch")
sha256sums=('63ab234de99fa03e9c2efef2e55bcaa97f49b350bfd4fbe32d83c81f4c254572'
            '554a52f1cc8251225802dc3e9adc820ca60f9bd49f363d733ea7c23c494cb7c2'
            'e7c2eff8a7281c52f8c97ab2577bfc654f8c4c9bd52c712d14d038234765aab5'
            '7b0d02035fd3b7d9b1cb39ec7d8cfe87d558ab6e7fb6652fac9a8b980cc3e997'
            '7eb4bfc23904b3cbc9c14aa3b80950dd2bcfa39950f0810c03f71596aa6b327c')

prepare() {
  cd $pkgname-$_pkgver
  mv ../vkhelpers/* vkh
  mv ../glutess/* external/glutess
  mv ../vkvg-svg/* external/vkvg-svg
  mkdir build
  patch -p1 -i ../873610656b4ac2d4595721fee07f0671f4911d73.patch
}

build() {
  cd $pkgname-$_pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $pkgname-$_pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd build
  make DESTDIR="$pkgdir/" install
}
