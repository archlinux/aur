# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-calculator-git
_pkgname=deepin-calculator
pkgver=6.5.37.r0.g25291b0
pkgrel=1
pkgdesc='GXDE fork of old DTK5 calculator'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-calculator'
license=(GPL-3.0-or-later GPL-2.0-or-later LGPL-3.0-or-later CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git qt6-base qt6-svg hicolor-icon-theme libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools)
provides=(deepin-calculator)
conflicts=(deepin-calculator)
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
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF \
    -DVERSION="$(git -C "$_pkgname" describe --tags --abbrev=0)"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
