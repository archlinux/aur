# Maintainer: Harrison <htv04rules at gmail dot com>
# Contributor: Elijah Bansley <elijahbansley@gmail.com>

pkgname=funkin-git
pkgver=v0.2.7.1.r102.gf94dece4
pkgrel=3
pkgdesc="Friday Night Funkin': A rhythm game originally made for Ludum Dare 47 \"Stuck in a Loop\""
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/ninjamuffin99/Funkin"
license=("Apache")
makedepends=("git" "haxe")
provides=("funkin")
conflicts=("funkin")
source=("git+https://github.com/ninjamuffin99/Funkin.git"
        "APIStuff.hx"
        "funkin.sh"
        "funkin.desktop")
sha256sums=("SKIP"
            "ade2e5b25db77b404a6ed074d59d7fa80c1cbb627e18e1cc3bf6177020eee92f"
            "75ef6c467feac3a57848b2f01677d88be40b3b79a826cb0d450d6f5fd7b11c1f"
            "7fe0fa2ac1312201c93f41cf9395c46703abf989e7f65783ff95e0d3b8c183e6")

pkgver() {
  cd "${srcdir}/Funkin"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  # https://github.com/ninjamuffin99/Funkin/issues/146#issuecomment-755064854
  cp APIStuff.hx "${srcdir}/Funkin/APIStuff.hx"
}

build() {
  # Create/confirm local haxelib repo for libraries
  haxelib newrepo

  # Install and setup lime and HaxeFlixel
  haxelib install lime
  haxelib install openfl
  haxelib install flixel
  echo n | haxelib run lime setup # Decline prompt to add lime command
  haxelib run lime setup flixel

  # Install other depends
  haxelib install newgrounds
  haxelib git polymod https://github.com/larsiusprime/polymod.git
  haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc.git

  # Build game
  pushd "${srcdir}/Funkin" > /dev/null
  haxelib run lime build linux -final
  popd > /dev/null
}

package() {
  pushd "${srcdir}/Funkin" > /dev/null

  # Copy game files to /usr/share/funkin
  install -dm0755 "${pkgdir}/usr/share/funkin"
  cp -r export/release/linux/bin/* "${pkgdir}/usr/share/funkin/"

  # Install icons
  for size in 16 32 64; do
    install -Dm0644 "art/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/funkin.png"
  done

  popd > /dev/null

  # Install launcher script as binary
  install -Dm0755 funkin.sh "${pkgdir}/usr/bin/funkin"

  # Install desktop file
  install -Dm0644 funkin.desktop "${pkgdir}/usr/share/applications/funkin.desktop"
}
