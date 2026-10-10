# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-clone-git
_pkgname=deepin-clone
pkgver=1.1.2.r0.g32e1b01
pkgrel=1
pkgdesc="Backup and restore tool for GXDE, a GXDE fork of deepin-clone heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-clone'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-git gxde-dtk5-git qt5-base partclone jfsutils ntfs-3g xfsprogs
         hicolor-icon-theme bash libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt5-tools gxde-dtk2widget-dev-git deepin-gettext-tools)
provides=(deepin-clone)
conflicts=(deepin-clone)
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
    -DDISABLE_DFM_PLUGIN=YES
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # Arch 的 /usr/sbin 是指向 /usr/bin 的软链接，polkit 策略里的 /usr/sbin 路径照样可用
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin/
  rmdir "$pkgdir"/usr/sbin
}
