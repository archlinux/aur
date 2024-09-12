# Maintainer:
# Contributor: maticbabnik <matic@babnik.io>

_pkgname="waemon"
pkgname="$_pkgname-git"
pkgver=0.1.1.r0.g35d4657
pkgrel=1
pkgdesc="Wayland wallpaper daemon."
url="https://github.com/MaticBabnik/waemon"
license=('MIT')
arch=('x86_64')

depends=(
  wayland
  cairo
  openimageio
)
makedepends=(
  cmake
  git
  ninja
  nlohmann-json
  wayland-protocols
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
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
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  make -C "$_pkgsrc" protocols
  cmake --build build
}

package() {
  install -Dm0755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm0644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
