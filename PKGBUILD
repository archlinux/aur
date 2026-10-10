# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-filetransfer-git
_pkgname=gxde-filetransfer
pkgver=1.2.1.r0.g65a30bd
pkgrel=1
pkgdesc='GXDE file transfer client'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-filetransfer'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base curl hicolor-icon-theme
         libstdc++ libgcc glibc)
makedepends=(git)
provides=(gxde-filetransfer)
conflicts=(gxde-filetransfer)
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
  qmake6 PREFIX=/usr CONFIG+=no_qt_rpath \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
