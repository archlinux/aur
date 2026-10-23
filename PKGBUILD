# Maintainer: Gabantax <ve20@web.de>
pkgname=switch-frame-tap
pkgver=0.7.14
pkgrel=1
pkgdesc='PC viewer for Switch Frame Tap: watch and record your Nintendo Switch streamed over USB or network'
arch=('x86_64')
url='https://github.com/TomasUribe/switch-frame-tap'
license=('GPL-2.0-only')
depends=('ffmpeg' 'sdl2' 'libusb' 'libva' 'systemd-libs')
optdepends=('libva-mesa-driver: VAAPI decoding on AMD'
            'intel-media-driver: VAAPI decoding on Intel'
            'nvidia-utils: NVDEC decoding on NVIDIA')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92ba8ebfd07bab4134c9b6177e6d91a65a152ba6f31bf0c93595f7a464f972fe')

build() {
  cd "$pkgname-$pkgver"
  gcc -O2 -Wall -Wextra \
    -DSFT_H264 -DSFT_MP4 -DSFT_VERSION="\"$pkgver\"" \
    $(pkg-config --cflags sdl2 libusb-1.0 libavformat libavcodec libavutil libva) \
    -o switch-frame-tap-viewer tools/raw-recv/raw-view.c \
    $(pkg-config --libs sdl2 libusb-1.0 libavformat libavcodec libavutil libva libva-drm libudev) \
    -lpthread -lm -ldl
}

package() {
  cd "$pkgname-$pkgver"
  local id=io.github.TomasUribe.SwitchFrameTap

  install -Dm755 switch-frame-tap-viewer "$pkgdir/usr/bin/switch-frame-tap-viewer"
  install -Dm644 tools/raw-recv/switch-frame-tap.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"

  install -Dm644 "flatpak/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "flatpak/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"

  install -Dm644 tools/raw-recv/99-switch-frame-tap.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-switch-frame-tap.rules"
}
