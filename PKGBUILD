# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-system-monitor-git
_pkgname=deepin-system-monitor
pkgver=6.5.46.r0.g461b28e
pkgrel=1
pkgdesc="GXDE fork & modification of deepin-system-monitor. Conflicts with Deepin's version."
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-system-monitor'
license=(GPL-3.0-or-later GPL-2.0-or-later LGPL-3.0-or-later CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git deepin-service-manager
         qt6-base qt6-svg polkit-qt6 icu dconf libcap libpcap libnl
         libxcb xcb-util-wm
         libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools deepin-gettext-tools systemd-libs)
provides=(deepin-system-monitor)
conflicts=(deepin-system-monitor)
install=$pkgname.install
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
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=None \
    -DVERSION="$(git -C "$_pkgname" describe --tags --abbrev=0)"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
