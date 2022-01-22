# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=vkvg
pkgver=0.2.1
pkgrel=4
pkgdesc='Vulkan 2D graphics library following the Cairo API'
arch=(x86_64)
url='https://github.com/jpbruyere/vkvg'
license=('MIT')
depends=(fontconfig freetype2 harfbuzz vulkan-icd-loader vulkan-driver)
options=(strip)
makedepends=(cmake make xxd
             shaderc) # for `glslc`
source=("https://github.com/jpbruyere/vkvg/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/jpbruyere/vkhelpers#commit=fc5623d771907a94b0d68da221703a6ca6088885")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver
  mv ../vkhelpers/* vkh
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  sed -i "s:$srcdir::g" vkh/libvkh.so.0.1.0
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd build
  make DESTDIR="$pkgdir/" install

  # don't know why it must be done here and not in build() but oh anyway...
  sed -i "s:$srcdir::g" $pkgdir/usr/lib/libvkvg.so.0.2
}
