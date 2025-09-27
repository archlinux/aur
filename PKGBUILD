# Maintainer:

_pkgname="sonyheadphonesclient-bluetooth"
pkgname="$_pkgname"
pkgver=1.4.4
pkgrel=1
pkgdesc="Desktop client recreating the functionality of the Sony Headphones app (Bluetooth/TWS/XM5+)"
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
arch=('x86_64')

depends=(
  'bluez-libs'
  'dbus'
  'libglvnd'
)
makedepends=(
  'cmake'
  'git'
  'libxcursor'
  'libxkbcommon'
  'ninja'
  'wayland'
  'xorg-xinput'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

build() {
  export CXXFLAGS+=" -Wno-error=format-security"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 "build/SonyHeadphonesClient" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/sonyheadphonesclient-bluetooth.desktop" << END
[Desktop Entry]
Name=Sony Headphones Client [XM5+]
Comment=[XM5+] A Linux client recreating the functionality of the Sony Headphones app
Exec=$_pkgname
Terminal=false
Categories=Utility;
Type=Application
Icon=audio-headphones
END

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
