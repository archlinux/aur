# Maintainer: rbartlensky <robert@electricwisp.com>
# Contributor: jiriks74 <jiri@stefka.eu>
# Contributor: Entith <entith@entith.net>

realpkgname=vkdevicechooser
pkgname=lib32-vkdevicechooser
pkgver=1.1
pkgrel=1
pkgdesc="Vulkan layer to force a specific physical GPU device to be used (32-bit)"
arch=('x86_64')
url="https://github.com/jiriks74/vkdevicechooser"
license=('MIT')
# `vkdevicechooser` will install 'vkdevicechooser.json' for us
depends=('lib32-vulkan-icd-loader' 'vkdevicechooser=1.1')
makedepends=('git' 'vulkan-headers' 'vulkan-utility-libraries' 'meson' 'ninja')
conflicts=('vkdevicechooser-git')
source=(https://github.com/jiriks74/vkdevicechooser/archive/refs/tags/1.1.zip)
md5sums=('b838ff799b1e729e11d1b950504672be')

build() {
  export ASFLAGS=--32
  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${realpkgname}-${pkgver}"
  meson --prefix=/usr --libdir=lib32 build
  ninja -C build
}

package() {
  cd "${realpkgname}-${pkgver}"
  echo "pkgdir $pkgdir"
  # only install the library, and not the JSON file
  DESTDIR="$pkgdir" meson install -C build --tags runtime
}
