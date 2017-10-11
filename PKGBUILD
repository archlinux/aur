# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
 
pkgname=linux-steam-integration-git
_pkgname=linux-steam-integration
pkgver=0.4.1.r1.g5ceacb2
pkgrel=1
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/solus-project/linux-steam-integration"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('gtk3' 'steam')
makedepends=('git' 'meson')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('linux-steam-integration')
conflicts=('linux-steam-integration')
source=("git+https://github.com/solus-project/linux-steam-integration.git"
        "git+https://github.com/ikeydoherty/libnica.git")
sha512sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git config submodule.src/libnica.url $srcdir/libnica
  git submodule update
}

build() {
  # 64-bit build
  arch-meson "$_pkgname" build \
    -Dwith-shim=co-exist \
    -Dwith-frontend=true \
    -Dwith-steam-binary=/usr/lib/steam/steam \
    -Dwith-new-libcxx-abi=true

  ninja -C build

  # 32-bit build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson "$_pkgname" build32 \
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
