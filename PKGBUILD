# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration
pkgver=0.4.1
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
sha512sums=('99dcc24049c5f9f0405bc18513cd97a49eb50cc088a27a4d3b3aef6c5528bcc441220a0fed8833ba6ae535daa91c4cd447fa35e4cc205ace172c658db218b344'
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
