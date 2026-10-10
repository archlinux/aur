# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-roller-git
_pkgname=deepin-compressor
pkgver=6.5.33.r0.ge4da4ca
pkgrel=1
pkgdesc="Archive manager for GXDE, a GXDE fork of deepin-compressor heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-compressor'
license=(GPL-3.0-or-later GPL-2.0-or-later LGPL-3.0-or-later CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git qt6-base qt6-svg qt6-5compat kcodecs karchive glib2 zlib
         hicolor-icon-theme libarchive openssl libzip util-linux-libs minizip 7zip unarchiver
         pigz lzop libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools gtest deepin-gettext-tools gxde-infra-git libsecret
             poppler)
optdepends=('unrar: RAR archive support')
provides=(deepin-compressor)
conflicts=(deepin-compressor)
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
    -DAPP_VERSION="$_ver" \
    -DCMAKE_SAFETYTEST_ARG=CMAKE_SAFETYTEST_ARG_OFF \
    -DCOMPRESSOR_PLUGIN_PATH=/usr/lib/deepin-compressor/plugins
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
