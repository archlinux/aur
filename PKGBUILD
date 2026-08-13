# Maintainer: nubz4lif <nubz4lif@proton.me>
# Contributer: Syazmi <mrcorpzpro@gmail.com>
# Contributer: Harrison <contact@htv04.com>

pkgname=funkin-git
pkgver=0.8.6.r0.gee9d492
pkgrel=2
pkgdesc="A rhythm game made with HaxeFlixel"
arch=(x86_64)
url="https://github.com/FunkinCrew/Funkin"
license=(Apache)
conflicts=('funkin')
provides=('funkin')
depends=(vlc fuse3 fuse-overlayfs)
makedepends=(git haxe)
source=("git+https://github.com/FunkinCrew/Funkin.git"
        "git+https://github.com/FunkinCrew/funkin.assets"
        "git+https://github.com/FunkinCrew/funkin.art"
        "funkin.sh"
        "funkin.desktop")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "c409b0fa9d1194801f7a0c90f711e4a1194467f1d2524417d3e08e8facbf8d32"
            "fe2d70bffe9c8702c35da89e7fca84200bd05bee104d1014a1c444462527b6ba")

pkgver() {
  cd "$srcdir/Funkin"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/Funkin"

  # Initialize Git submodules
  git submodule init
  git config submodule.assets.url "$srcdir/funkin.assets"
  git config submodule.art.url "$srcdir/funkin.art"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/Funkin"

  # Create/confirm local repo for Haxe libraries
  haxelib newrepo &&

  # Download required Haxe libraries via HMM
  haxelib git hmm https://github.com/FunkinCrew/hmm.git
  haxelib git haxelib https://github.com/FunkinCrew/haxelib.git
  echo n | haxelib run hmm reinstall

  # Set up Lime
  echo y | haxelib run lime rebuild cpp # FunkinCrew's Lime fork doesn't come with lime.ndll on Linux for whatever reason
  echo n | haxelib run lime setup # Decline prompt to add "lime" command

  # Get lime libraries
  pushd ${srcdir}/Funkin/.haxelib/lime/git
  git submodule update --init --recursive
  popd

  # Discord RPC
  touch ${srcdir}/Funkin/.env
  grep DISCORD_CLIENT_ID ${srcdir}/Funkin/.env || echo 'DISCORD_CLIENT_ID=816168432860790794' >> ${srcdir}/Funkin/.env

  echo y | haxelib run lime rebuild linux -64 -release

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
    cp "art/icons/icon$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps/funkin.png"
  done
}

