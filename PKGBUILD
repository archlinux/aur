# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-picker-git
_pkgname=gxde-picker
pkgver=2.0.4.r0.gbfc51a2
pkgrel=1
pkgdesc='Color picker tool for GXDE'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-picker'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base qt6-svg
         libx11 libxtst wayland libglvnd
         libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools libxext libxcb xcb-util)
provides=(gxde-picker)
conflicts=(gxde-picker)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g'
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

build() {
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
