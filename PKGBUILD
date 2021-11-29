# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=linux-steam-integration
pkgver=0.7.3
pkgrel=3
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/clearlinux/linux-steam-integration"
arch=('x86_64')
license=('LGPL2.1')
depends=('gtk3' 'lib32-gcc-libs' 'lib32-libvpx' 'steam')
makedepends=('git' 'meson')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('liblsi-redirect.so-64' 'liblsi-intercept.so-64' 'liblsi-redirect.so-32' 'liblsi-intercept.so-32')
source=("https://github.com/clearlinux/linux-steam-integration/releases/download/v$pkgver/linux-steam-integration-$pkgver.tar.xz"{,.asc}
        'partially-revert-2877813.patch'
        'whitelist-libvpx.patch'
        'lsi-steam.desktop')
sha512sums=('b68ae89c5e93d6424fe1b91666cac32c241f7f3cff24cf7f4f6b1ad57c1d537fbce60a6d64999c7e568f1f29152a44a7366d100c7ad1a70cdb1e0a8fb7cf8b6a'
            'SKIP'
            'da5aeb435dc031b2be3fc27b8b9e5acbee51afff42f6f4db527ea4f034eb3601348439675e791d359a26070b45dda5a50fa204be2db72625c63d980aeeec01c4'
            '9476c26a0e8ad8ba8301c2b4d8fcdb2e0486b154dee76021827d62e9c22ffeaf62a009df6f6b8ada38c3e24518b2fe559b45dacdb51ce96f09c3e80800cdffcb'
            'e459ee358f0c48808108fc7564f59f73c56de12b2d493b97763f9f45f73e867a28760170d437e98dcb68174a006e6185e609e66f8ba15ed28c4a3b3c8c7782e2')
validpgpkeys=('22512D02C191D39D5EC4FDCDBFF2F5A2CA201B84') # Ikey Doherty (Software Engineer, Intel Corporation) <ikey.doherty@intel.com>

prepare() {
  cd "$pkgname-$pkgver"

  # Allow steam to load private libpangocairo
  sed -i '/"libpango-1.0.so",/a \        \"libpangocairo-1.0.so",' src/intercept/main.c

  # Partially revert 2877813 | Upstream issue #82
  # https://github.com/clearlinux/linux-steam-integration/pull/2
  patch -Np1 -i "$srcdir/partially-revert-2877813.patch"

  # Whitelist libvpx.so again
  # https://github.com/getsolus/linux-steam-integration/pull/1
  patch -Np1 -i "$srcdir/whitelist-libvpx.patch"
}

build() {
  # 64-bit build
  arch-meson "$pkgname-$pkgver" build \
    -Dwith-shim=co-exist \
    -Dwith-frontend=true \
    -Dwith-steam-binary=/usr/lib/steam/steam \
    -Dwith-new-libcxx-abi=true
  meson compile -C build

  # 32-bit build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson "$pkgname-$pkgver" build32 \
    -Dwith-shim=none \
    -Dwith-new-libcxx-abi=true \
    --libexecdir /usr/lib32 \
    --libdir /usr/lib32
  meson compile -C build32
}

package() {
  meson install -C build --destdir "$pkgdir"
  meson install -C build32 --destdir "$pkgdir"

  install -Dm644 lsi-steam.desktop -t "$pkgdir/usr/share/applications"
}
