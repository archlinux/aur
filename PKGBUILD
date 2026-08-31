# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=asteroidz
pkgver=0.28.1
pkgrel=1
pkgdesc='wlroots compositor with HDR10, dwm-style tags and its own Vulkan renderer'
arch=('x86_64')
url='https://github.com/asteroidzman/asteroidz'
license=('GPL3' 'MIT' 'CC0')
depends=(
  'wlroots0.20' 'wayland' 'libinput' 'libxkbcommon' 'pcre2' 'pixman'
  'cjson' 'pango' 'gdk-pixbuf2' 'libdrm' 'systemd-libs'
  # azview's, not the compositor's: HEIF and AVIF come through libheif, and
  # everything else through gdk-pixbuf, which is here for the wallpapers too.
  'libheif'
  'vulkan-icd-loader'
  'xcb-util-wm' 'libxcb'
  # asteroidz-scenefx is GONE, not merely un-packaged. Its scene graph is now
  # asteroidz source (src/scene/), so there is no subproject, no static library
  # and no ABI marker to keep in lockstep. Two of the libraries it used to pull
  # in are asteroidz's own direct link now, and are listed for that reason:
  'mesa'       # libgbm
  'lcms2'      # colour management
  # NOT a direct link: libEGL/libGLESv2 do not appear in asteroidz's NEEDED at
  # all -- they arrive through libwlroots-0.20, whose own GLES renderer
  # asteroidz never selects. Listed because the runtime still resolves them,
  # not because anything here composites with GLES.
  'libglvnd'
)
makedepends=('meson' 'ninja' 'wayland-protocols' 'vulkan-headers' 'glslang' 'git')
optdepends=(
  'xorg-xwayland: run X11 applications under XWayland'
)
# Two sessions install, and both run AVK -- asteroidz's own Vulkan renderer,
# which is the only renderer there is. "Asteroidz (AVK native Vulkan)" is the
# session to use; "Asteroidz (AVK + Vulkan validation)" adds the validation
# layers for acceptance runs and is markedly slower.
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build \
    -Db_lto=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # forked-from license texts (dwl/dwm/sway/wlroots/tinywl)
  for l in "$srcdir/$pkgname"/LICENSE.*; do
    install -Dm644 "$l" "$pkgdir/usr/share/licenses/$pkgname/$(basename "$l")"
  done
}
