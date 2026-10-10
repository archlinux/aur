# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-reader-git
_pkgname=deepin-reader
pkgver=6.6.2.r0.g3bfc5d1
pkgrel=1
pkgdesc="Document viewer for GXDE, a GXDE fork of deepin-reader heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-reader'
license=(GPL-3.0-or-later LGPL-3.0-or-later BSD-3-Clause CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git gxde-core-git qt6-base qt6-svg qt6-webengine libgxps cairo glib2
         djvulibre libjpeg-turbo zlib lcms2 openjpeg2 libarchive icu hicolor-icon-theme
         freetype2 libchardet libcups pandoc-cli libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools qt6-5compat gtest libtiff libpng)
provides=(deepin-reader)
conflicts=(deepin-reader)
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
  # 自带的 pdfium 依赖 <cstdint> 被间接包含，GCC 15 起不再如此
  CXXFLAGS+=" -include cstdint"
  local _ver
  _ver=$(git -C "$_pkgname" describe --tags --abbrev=0)
  cmake -S "$_pkgname" -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DVERSION="$_ver" \
    -DAPP_VERSION="$_ver" \
    -DCMAKE_SAFETYTEST_ARG=CMAKE_SAFETYTEST_ARG_OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname"/LICENSES/BSD-3-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
