# Maintainer: Leandro Vital <leavitals at gmail dot com>
pkgname=ludo-git
_pkgname=ludo
pkgver=0.11.0.r4.ga3cc78c
pkgrel=1
pkgdesc="Ludo is a minimalist frontend for emulators"
arch=('x86_64' 'armv7h')
url="https://github.com/libretro/ludo"
license=('GPL3')
makedepends=('make' 'git' 'go')
depends=(
    'glfw'
    'openal'
    'mesa'
)
optdepends=(
    'libretro-beetle-psx'
    'libretro-mgba'
    'libretro-genesis-plus-gx'
    'libretro-snes9x'
    'libretro-gambatte'
    'libretro-picodrive'
    'libretro-yabause'
    'libretro-nestopia'
)
source=(
    "git+https://github.com/libretro/ludo.git#branch=master"
    "ludo.toml"
    "ludo.desktop"
)

md5sums=("SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

build() {
    export GOPATH="$srcdir"/gopath
    cd "$srcdir/$_pkgname"
    make
}

package() {
  install -Dm644 "ludo.toml" "$pkgdir/etc/ludo.toml"
  install -Dm644 "ludo.desktop" "$pkgdir/usr/share/applications/ludo.desktop"
  install -Dm755 "$srcdir/ludo/assets/icon.svg" "$pkgdir/usr/share/pixmaps/ludo.svg"

  install -dm755 "$pkgdir/usr/share/ludo"
  install -Dm755 "$srcdir/ludo/ludo" "$pkgdir/usr/bin/ludo" 

  cp -R "$srcdir/ludo/assets/" "$pkgdir/usr/share/ludo/assets"
  cp -R "$srcdir/ludo/database/" "$pkgdir/usr/share/ludo/database"
  chmod -R 0755 "$pkgdir/usr/share/ludo"
}
