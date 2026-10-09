# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-image-viewer-git
_pkgname=gxde-image-viewer
pkgver=1.7.5.r0.ga514245
pkgrel=1
pkgdesc='Image viewer for GXDE'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-image-viewer'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base qt6-svg qt6-imageformats
         freeimage libraw libexif glib2 hicolor-icon-theme
         libstdc++ libgcc glibc)
makedepends=(git qt6-tools qt6-5compat libx11 libxext)
optdepends=('kimageformats: more image formats')
provides=(gxde-image-viewer)
conflicts=(gxde-image-viewer deepin-image-viewer)
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
  export LRELEASE=/usr/lib/qt6/bin/lrelease
  qmake6 PREFIX=/usr CONFIG+=no_qt_rpath \
    DEFINES+="VERSION=$(git describe --tags --abbrev=0)" \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
