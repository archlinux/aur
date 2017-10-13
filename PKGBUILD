# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration
pkgver=0.5
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git' 'meson' 'gcc-multilib')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
source=("https://github.com/solus-project/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz"{,.asc})
sha512sums=('82ab9ddd2db387e63ebe82231f639ca7427f5a2492bf9326fcb3a4dd284060377e8d3548af44b699f3190354c1d0b24eb5427b0ca9f520ccfc5f02a5f6296b28'
            'SKIP')
validpgpkeys=('8876CC8EDAEC52CEAB7742E778E2387015C1205F') # Ikey Doherty

build() {
  # 64-bit build
  arch-meson "$pkgname-$pkgver" build \
    -Dwith-shim=co-exist \
    -Dwith-frontend=true \
    -Dwith-steam-binary=/usr/lib/steam/steam \
    -Dwith-new-libcxx-abi=true

  ninja -C build

  # 32-bit build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson "$pkgname-$pkgver" build32 \
    -Dwith-shim=none \
    --libexecdir /usr/lib32 \
    --libdir /usr/lib32

  ninja -C build32
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  DESTDIR="$pkgdir" ninja -C build32 install
}

# vim:set ts=2 sw=2 et:
