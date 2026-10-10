# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-dlna-caster-git
_pkgname=gxde-dlna-caster
pkgver=1.5.4.r0.g98176f4
pkgrel=1
pkgdesc="Cast your desktop screen and audio to DLNA TVs"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-dlna-caster'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base qt6-websockets libpipewire ffmpeg
         hicolor-icon-theme libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools)
provides=(gxde-dlna-caster)
conflicts=(gxde-dlna-caster)
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
