# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-screen-recorder-git
_pkgname=deepin-screen-recorder
pkgver=7.0.2.gxde2.r0.ge6a5726
pkgrel=1
pkgdesc="Screenshot and screen recording tool for GXDE, a GXDE fork of deepin-screen-recorder heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-screen-recorder'
license=(GPL-3.0-or-later GPL-2.0-or-later LGPL-3.0-or-later CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git gxde-core-git qt6-base qt6-svg qt6-multimedia ffmpegthumbnailer
         gstreamer gst-plugins-base-libs ffmpeg portaudio libusb v4l-utils libxtst libxcursor
         libxfixes libxrandr libxinerama libepoxy mesa procps-ng systemd-libs opencv libx11
         libxext wayland hicolor-icon-theme libstdc++ libgcc glibc)
makedepends=(git qt6-tools)
optdepends=('gxde-ocr-git: recognize text in screenshots')
provides=(deepin-screen-recorder)
conflicts=(deepin-screen-recorder deepin-screenshot)
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
    VERSION="$_ver" VERSION_UPSTREAM="$_ver" LIB_INSTALL_DIR=/usr/lib \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
