# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-voice-recorder-git
_pkgname=gxde-voice-recorder
pkgver=2.0.1.r0.g4a6549f
pkgrel=1
pkgdesc="Voice recorder for GXDE"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-voice-recorder'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git qt6-base qt6-multimedia ffmpeg hicolor-icon-theme
         libstdc++ libgcc glibc)
makedepends=(git qt6-tools)
provides=(gxde-voice-recorder)
conflicts=(gxde-voice-recorder)
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
