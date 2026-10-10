# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-ocr-git
_pkgname=gxde-ocr
pkgver=2.0.1.r0.g8c9728d
pkgrel=1
pkgdesc="OCR tool for GXDE"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-ocr'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base libgomp hicolor-icon-theme libstdc++ libgcc
         glibc)
makedepends=(git cmake ninja qt6-tools deepin-gettext-tools)
provides=(deepin-ocr)
conflicts=(deepin-ocr)
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
  local _ver
  _ver=$(git -C "$_pkgname" describe --tags --abbrev=0)
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DVERSION="$_ver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
