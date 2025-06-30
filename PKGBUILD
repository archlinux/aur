# Maintainer:

: ${_commit=b961e43d2cea5ce0b1a0a7fa8e010c858684d1e0} # 1.3.2.r6

_pkgname="sonyheadphonesclient"
pkgname="$_pkgname"
pkgver=1.3.2
pkgrel=1
pkgdesc="Desktop client recreating the functionality of the Sony Headphones app (XM3/XM4)"
url="https://github.com/Plutoberth/SonyHeadphonesClient"
license=('MIT')
arch=('x86_64')

depends=(
  'bluez-libs'
  'dbus'
  'glew'
  'glfw'
  'libglvnd'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

conflicts=('sonyheadphonesclient-bin')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc/Client"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 "build/SonyHeadphonesClient" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Sony Headphones Client [XM3/XM4]
Comment=[XM3/XM4] A Linux client recreating the functionality of the Sony Headphones app
Exec=$_pkgname
Terminal=false
Categories=Utility;
Type=Application
Icon=audio-headphones
END

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
