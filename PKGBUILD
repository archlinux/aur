# Maintainer: TRONG <spektralfrogadier@gmail.com>
pkgname=xorg-discord-rpc-git
pkgver=r63.15f8fa9
pkgrel=1
pkgdesc="Discord Rich Presence client for Xorg (git version)"
arch=('x86_64')
url="https://github.com/thelinuxpirate/xorg-discord-rpc"
license=('GPL-3.0-only' 'LicenseRef-Discord-Game-SDK')
depends=('gcc-libs' 'libx11')
makedepends=('cmake' 'git' 'wget' 'unzip' 'patchelf')
provides=('xorg-discord-rpc')
conflicts=('xorg-discord-rpc')

source=(
  "git+https://github.com/thelinuxpirate/xorg-discord-rpc.git"
  "https://dl-game-sdk.discordapp.net/2.5.6/discord_game_sdk.zip"
)

sha256sums=('SKIP'
            '426eb5fa70647d884f461c63825b63668349efb4bc68a16e70bc4a24e119b92e')

pkgver() {
  cd "$srcdir/xorg-discord-rpc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/xorg-discord-rpc"

  # Create build directory
  if [ ! -d "build" ]; then
    mkdir -p build
  fi

  # Create missing SDK directories
  mkdir -p "$srcdir/xorg-discord-rpc/discord-sdk/"{include,lib,src}

  # Copy everything to the proper build location
  cp "$srcdir/cpp/"*.h discord-sdk/include/
  cp "$srcdir/cpp/"*.cpp discord-sdk/src/
  cp "$srcdir/lib/x86_64/discord_game_sdk.so" \
     discord-sdk/lib/libdiscord_game_sdk.so

  # Patch types.h
  local types_h="discord-sdk/include/types.h"
  if ! grep -q "<cstdint>" "$types_h"; then
    sed -i '1i#include <cstdint>' "$types_h"
  fi

  # Build
  cmake -S . -B build \
    -DDISCORD_SDK_DIR="$PWD/discord-sdk" \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF

  cmake --build build
}

package() {
  cd "$srcdir/xorg-discord-rpc"

  # Install the Discord Game SDK instead of building it
  install -Dm755 discord-sdk/lib/libdiscord_game_sdk.so \
    "$pkgdir/usr/lib/libdiscord_game_sdk.so"

  # Install program to your system
  install -Dm755 build/xorg-discord-rpc \
    "$pkgdir/usr/bin/xorg-discord-rpc"

  # Clean package
  patchelf --remove-rpath "$pkgdir/usr/bin/xorg-discord-rpc"

  # Create documentation directory
  install -d "$pkgdir/usr/share/doc/xorg-discord-rpc"

  # Main README & Configuration file explanation
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/xorg-discord-rpc/"

  # Program license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-3.0.txt"

  # Main README & Configuration file explanation
  install -Dm644 CONFIGURATION.md \
    "$pkgdir/usr/share/doc/xorg-discord-rpc/"

  # More in depth details about assets
  install -Dm644 assets/README.org \
    "$pkgdir/usr/share/doc/xorg-discord-rpc/ASSETS.org"

  # Provide default config
  install -Dm644 exampleConfig.toml \
    "$pkgdir/usr/share/doc/xorg-discord-rpc/config.toml"
}
