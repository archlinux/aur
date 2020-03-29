# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=linux-steam-integration
pkgver=0.7.3
pkgrel=2
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/clearlinux/linux-steam-integration"
arch=('x86_64')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git' 'meson' 'gcc-multilib')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
source=("https://github.com/clearlinux/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz"{,.asc}
        "libbz2.patch")
sha512sums=('b68ae89c5e93d6424fe1b91666cac32c241f7f3cff24cf7f4f6b1ad57c1d537fbce60a6d64999c7e568f1f29152a44a7366d100c7ad1a70cdb1e0a8fb7cf8b6a'
            'SKIP'
            'fad69edf897503d0d03ac2841dc197061251abd41c8ff7f5b899e1df86d2b12767790303f60ba55db5b25ef848078e5ba64ffe02efd1f2cd1581613e7c559dc8')
validpgpkeys=('22512D02C191D39D5EC4FDCDBFF2F5A2CA201B84') # Ikey Doherty

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../libbz2.patch
}

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
