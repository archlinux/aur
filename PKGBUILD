# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
pkgname=linux-steam-integration
pkgver=0.7.3
pkgrel=10
pkgdesc="Helper for enabling better Steam integration on Linux"
url="https://github.com/getsolus/linux-steam-integration"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
  'gtk3'
  'lib32-gcc-libs'
  'lib32-libvpx'
  'steam'
)
makedepends=(
  'git'
  'meson'
)
optdepends=('steam-native-runtime: A package for installing all required deps for the native runtime.')
_commit=dffff457d11ecbbb3852a5f6bae813dcfadb3165
source=("git+https://github.com/getsolus/linux-steam-integration.git#commit=${_commit}"
        'git+https://github.com/intel/libnica.git'
        'partially-revert-2877813.patch'
        'use-steam-runtime.patch')
sha256sums=('2e4d32acda3c20a6613732508e57a1473a0db776878e559dc4d3340fd11816f7'
            'SKIP'
            '77d459a53f30f1ae4aae408d49e70bc6caa3dc895e6c1ee8239a90b3661ebd0b'
            '31fa5343372a98e294278daf913dc2d02c47f0fece482f759793372e4195efb2')

_reverts=(
  # SDL3 available in repos
  93d6b89129d970b6203a7d6f6396a26bc6ce3fdb
)

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/libnica.url "$srcdir/libnica"
  git -c protocol.file.allow=always submodule update

  for c in "${_reverts[@]}"; do
    echo Reverting $(git log --oneline -1 "${c}")
    git revert -n "${c}"
  done

  # Partially revert 2877813 | Upstream issue #82
  # https://github.com/clearlinux/linux-steam-integration/pull/2
  patch -Np1 -i ../partially-revert-2877813.patch

  # Use steam runtime by default
  # https://github.com/getsolus/packages/issues/160
  patch -Np1 -i ../use-steam-runtime.patch

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
  meson install -C build --no-rebuild --destdir "$pkgdir"
  meson install -C build32 --no-rebuild --destdir "$pkgdir"
}
