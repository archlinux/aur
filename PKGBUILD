# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-font-manager-git
_pkgname=gxde-font-manager
pkgver=2.0.2.r0.g86e4d40
pkgrel=1
pkgdesc="GXDE Font Installer is used to install and uninstall font files"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-font-manager'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base qt6-svg fontconfig freetype2
         hicolor-icon-theme libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools deepin-gettext-tools gxde-core-git)
provides=(gxde-font-installer)
conflicts=(gxde-font-installer)
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
    -DVERSION="$_ver" \
    -DAPP_VERSION="$_ver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
