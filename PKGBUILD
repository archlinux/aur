# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=funkin
pkgver=0.3.2
pkgrel=1
pkgdesc="A rhythm game made with HaxeFlixel"
arch=(any)
url="https://github.com/FunkinCrew/Funkin"
license=(Apache)
depends=(vlc fuse3 fuse-overlayfs)
makedepends=(git haxe)
source=("git+https://github.com/FunkinCrew/Funkin.git#tag=v$pkgver"
        "git+https://github.com/FunkinCrew/funkin.assets"
        "git+https://github.com/FunkinCrew/funkin.art"
        "hmm-commitfix.patch"
        "assets-picofix.patch"
        "funkin.sh"
        "funkin.desktop")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "dc69a9a89fd9f7736d5105e96b5fde79e7592fb5aedf24b43d2e9d3829d59e9b"
            "086b1280e1f81de47471491b2827aa7a6ffb8a3f28c92ad573f352ba73124d62"
            "c409b0fa9d1194801f7a0c90f711e4a1194467f1d2524417d3e08e8facbf8d32"
            "fe2d70bffe9c8702c35da89e7fca84200bd05bee104d1014a1c444462527b6ba")

prepare() {
  cd "$srcdir/Funkin"

  # Initialize Git submodules
  git submodule init
  git config submodule.assets.url "$srcdir/funkin.assets"
  git config submodule.art.url "$srcdir/funkin.art"
  git -c protocol.file.allow=always submodule update

  # Apply patches
  patch -N -r - -i "$srcdir/hmm-commitfix.patch" "hmm.json" || :
  patch -N -r - -i "$srcdir/assets-picofix.patch" "assets/preload/data/characters/pico-playable.json" || :
}

build() {
  cd "$srcdir/Funkin"
  
  # Create/confirm local repo for Haxe libraries
  haxelib newrepo

  # Download required Haxe libraries via HMM
  haxelib install hmm
  haxelib run hmm reinstall

  # Set up Lime
  echo n | haxelib run lime setup # Decline prompt to add "lime" command
  haxelib run lime rebuild linux -64 -release

  # Build Friday Night Funkin'
  haxelib run lime build linux -64 -release
}

package() {
  # Copy launcher files
  mkdir -p "$pkgdir/usr/bin"
  cp "funkin.sh" "$pkgdir/usr/bin/funkin"
  mkdir -p "$pkgdir/usr/share/applications"
  cp "funkin.desktop" "$pkgdir/usr/share/applications/funkin.desktop"

  cd "$srcdir/Funkin"

  # Copy game files
  mkdir -p "$pkgdir/usr/share"
  cp -r "export/release/linux/bin" "$pkgdir/usr/share/funkin"

  # Install icons
  for size in 16 32 64; do
    mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps"
    cp "art/icon$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps/funkin.png"
  done
}
