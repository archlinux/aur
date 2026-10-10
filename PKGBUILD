# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-camera-git
_pkgname=deepin-camera
pkgver=6.5.48.r0.g9625ca7
pkgrel=1
pkgdesc="Camera for GXDE, a GXDE fork of deepin-camera heavily modified from Deepin's version"
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/deepin-camera'
license=(GPL-3.0-or-later BSD-3-Clause CC-BY-4.0 CC0-1.0)
depends=(gxde-dtk6-git qt6-base qt6-svg qt6-multimedia ffmpeg ffmpegthumbnailer v4l-utils
         sdl2-compat portaudio libpng alsa-lib libpciaccess libusb systemd-libs libx11 libva
         gstreamer gst-plugins-base-libs deepin-image-editor glib2 hicolor-icon-theme
         libstdc++ libgcc glibc)
makedepends=(git cmake ninja qt6-tools deepin-gettext-tools)
provides=(deepin-camera)
conflicts=(deepin-camera)
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
    -DAPP_VERSION="$_ver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgname"/LICENSES/BSD-3-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
