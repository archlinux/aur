# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-boot-maker-git
_pkgname=gxde-boot-maker
pkgver=3.0.0.r0.g000cdb8
pkgrel=1
pkgdesc="Boot USB stick maker for GXDE"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-boot-maker'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base 7zip mtools hicolor-icon-theme libstdc++
         libgcc glibc)
depends_x86_64=(syslinux)
makedepends=(git qt6-tools python)
provides=(gxde-boot-maker)
conflicts=(gxde-boot-maker)
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
  cd "$_pkgname"
  local _ver
  _ver=$(git describe --tags --abbrev=0)
  qmake6 PREFIX=/usr CONFIG+=no_qt_rpath DEFINES+="VERSION=$_ver" \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
