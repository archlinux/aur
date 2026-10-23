# Maintainer: Gabantax <ve20@web.de>
pkgname=switch-frame-tap
pkgver=0.7.14
pkgrel=2
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

prepare() {
  # sdl2-compat: SDL_RenderGetScale() includes the logical-size scale, but
  # SDL_RenderSetScale() sets only the renderer's own one. The viewer saves and
  # restores the scale around its overlays each frame, so in a window bigger
  # than the picture the scale compounds to inf and the picture goes black
  # (upscaling off). Hand back what SDL_RenderSetScale() needs; SDL 2: no change.
  cat > sdl2-compat-scale.h <<'EOF'
#include <SDL2/SDL.h>
static inline void sft_render_get_scale(SDL_Renderer *ren, float *scaleX, float *scaleY)
{
    float sx = 1.0f, sy = 1.0f, ux = 1.0f, uy = 1.0f;
    int lw = 0, lh = 0;
    SDL_RenderGetScale(ren, &sx, &sy);
    SDL_RenderGetLogicalSize(ren, &lw, &lh);
    if (lw > 0 && lh > 0) {
        SDL_RenderSetScale(ren, 1.0f, 1.0f);
        SDL_RenderGetScale(ren, &ux, &uy);
        if (ux > 0.0f) sx /= ux;
        if (uy > 0.0f) sy /= uy;
        SDL_RenderSetScale(ren, sx, sy);
    }
    if (scaleX) *scaleX = sx;
    if (scaleY) *scaleY = sy;
}
#define SDL_RenderGetScale sft_render_get_scale
EOF
}

build() {
  cd "$pkgname-$pkgver"
  gcc -O2 -Wall -Wextra \
    -include "$srcdir/sdl2-compat-scale.h" \
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
