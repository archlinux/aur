# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration
pkgver=0.4
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git' 'meson')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
source=("https://github.com/solus-project/linux-steam-integration/releases/download/v${pkgver}/linux-steam-integration-${pkgver}.tar.xz"{,.asc}
        meson_fix.patch)
sha512sums=('28256634d78f01a2bed00257f6328d76fadce6be1215c1890e9fa79316b9499583cf4796aebd8783cddc81ca3e6b2a3885179c21c2366f8368c54af5f8989d8f'
            'SKIP'
            '52ca7decac01e65451b37cc8b0d2535e6596321c347ff898f2c9ec5d3e2ef94d265eb0a6c497b0455f598d80fe1bd9adbfcf08d5277f77b63bdb2efafb26dbd5')
validpgpkeys=('8876CC8EDAEC52CEAB7742E778E2387015C1205F') # Ikey Doherty

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/meson_fix.patch
}

build() {
  # 64-bit build
  arch-meson "$pkgname-$pkgver" build \
    -Dwith-shim=co-exist \
    -Dwith-frontend=true \
    -Dwith-steam-binary=/usr/lib/steam/steam

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
