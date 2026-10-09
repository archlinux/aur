# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-log-viewer-git
_pkgname=deepin-log-viewer
pkgver=6.5.42.r0.gb33fb6b
pkgrel=1
pkgdesc='A system log viewer forked from deepin-log-viewer with GXDE adaption'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-log-viewer'
license=(GPL-3.0-or-later)

depends=(gxde-dtk6-git qt6-base polkit-qt6 gio-qt
         icu xerces-c zlib systemd-libs dconf hicolor-icon-theme bash
         coreutils util-linux procps-ng systemd pciutils lshw dmidecode udisks2 hwinfo
         libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools qt6-5compat boost rapidjson libzip minizip)
optdepends=('7zip: export logs as zip archives')
provides=(deepin-log-viewer)
conflicts=(deepin-log-viewer)
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
    -DLIB_INSTALL_DIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SAFETYTEST_ARG=CMAKE_SAFETYTEST_ARG_OFF \
    -DVERSION="$_ver" \
    -DAPP_VERSION="$_ver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
