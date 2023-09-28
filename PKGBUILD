# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=linux-steam-integration
pkgver=0.7.3
pkgrel=6
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/getsolus/linux-steam-integration"
arch=('x86_64')
license=('LGPL2.1')
depends=('gtk3' 'lib32-gcc-libs' 'lib32-libvpx' 'steam')
makedepends=('git' 'meson')
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
provides=('liblsi-redirect.so-64' 'liblsi-intercept.so-64' 'liblsi-redirect.so-32' 'liblsi-intercept.so-32')
_commit=93d6b89129d970b6203a7d6f6396a26bc6ce3fdb  # branch/master
source=("git+https://github.com/getsolus/linux-steam-integration.git#commit=$_commit"
        'git+https://github.com/intel/libnica.git'
        'partially-revert-2877813.patch')
sha256sums=('SKIP'
            'SKIP'
            '77d459a53f30f1ae4aae408d49e70bc6caa3dc895e6c1ee8239a90b3661ebd0b')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.src/libnica.url "$srcdir/libnica"
  git -c protocol.file.allow=always submodule update

  # Partially revert 2877813 | Upstream issue #82
  # https://github.com/clearlinux/linux-steam-integration/pull/2
  patch -Np1 -i ../partially-revert-2877813.patch

  # Bump glew
  sed -i 's/libGLEW.so.2.1/libGLEW.so.2.2/g' src/intercept/main.c
}

build() {

  # 64-bit build
  arch-meson "$pkgname" build \
    -Dwith-shim=co-exist \
    -Dwith-frontend=true \
    -Dwith-steam-binary=/usr/lib/steam/steam \
    -Dwith-libressl-mode=shim \
    -Dwith-new-libcxx-abi=true
  meson compile -C build

  # 32-bit build, default to building only libintercept
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  arch-meson "$pkgname" build32 \
    --libexecdir /usr/lib32 \
    --libdir /usr/lib32 \
    -Dwith-shim=none \
    -Dwith-libressl-mode=shim \
    -Dwith-new-libcxx-abi=true
  meson compile -C build32
}

package() {
  meson install -C build --destdir "$pkgdir"
  meson install -C build32 --destdir "$pkgdir"
}
