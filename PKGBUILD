# Maintainer:

_pkgname="skyemu"
pkgname="$_pkgname-git"
pkgver=4.r8.g246ba26
pkgrel=2
pkgdesc="An emulator for GB, GBC, GBA, and DS"
url="https://github.com/skylersaleh/SkyEmu"
license=('MIT')
arch=('x86_64')

depends=(
  'alsa-lib'
  'hicolor-icon-theme'
  'libglvnd'
  'libxcursor'
  'libxi'
  'sdl2'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/skylersaleh/SkyEmu.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev

    -DUSE_SYSTEM_CURL=ON
    -DUSE_SYSTEM_OPENSSL=ON
    -DUSE_SYSTEM_SDL2=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 build/bin/SkyEmu "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgsrc/src/resources/icons/favicon_package/android-chrome-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=SkyEmu
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Game;Emulator;
END
}
