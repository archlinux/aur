# Maintainer: CharOfString <root@charofstring.cc>

pkgname=dde-clipboard-git
_pkgname=dde-clipboard
pkgver=6.6.2.r0.g76a0e73
pkgrel=1
pkgdesc="Clipboard manager for GXDE, a GXDE fork of dde-clipboard heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/dde-clipboard'
license=(GPL-3.0-or-later CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git gxde-core-git gxde-infra-git qt6-base gio-qt kwayland libcups
         libxcb systemd-libs wayland libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools extra-cmake-modules systemd vulkan-headers)
provides=(dde-clipboard)
conflicts=(dde-clipboard deepin-clipboard)
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
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
