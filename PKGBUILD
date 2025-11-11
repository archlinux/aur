# Maintainer: Rich Baird <rich@rbaird.me>

pkgname=wayvnc-git
_pkgname=wayvnc
pkgver=0.9.1+31.ge12cb689f3
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64 i686 aarch64 armv7h)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(
  libdrm
  gbm
  libxkbcommon
  pam
  pixman
  jansson
  wayland
)
makedepends=(
  git
  meson
  ninja
  pam
  scdoc
)
source=(
  "$_pkgname::git+$url"
  "neatvnc::git+https://github.com/any1/neatvnc.git"
  "aml::git+https://github.com/any1/aml.git"
)
sha512sums=('SKIP' 'SKIP' 'SKIP')
conflicts=(wayvnc)
provides=(wayvnc=${pkgver%+*})

pkgver() {
  cd "$_pkgname"
  git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

prepare() {
  # Create the subprojects directory for wayvnc
  mkdir -p "$_pkgname/subprojects"

  # Link neatvnc and aml into wayvnc's subprojects
  # Note: The paths are relative to the link location
  ln -s ../../neatvnc "$_pkgname/subprojects/neatvnc"
  ln -s ../../aml "$_pkgname/subprojects/aml"
  
  # Create the subprojects directory for neatvnc
  mkdir -p "neatvnc/subprojects"
  
  # Link aml into neatvnc's subprojects
  ln -s ../../aml "neatvnc/subprojects/aml"
}

build() {
  arch-meson "$_pkgname" build # --prefix /usr
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm 644 "$_pkgname/COPYING" -t "$pkgdir"/usr/share/licenses/$pkgname
}

