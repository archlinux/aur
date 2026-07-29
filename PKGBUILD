# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=asteroidz
pkgver=0.20.8
pkgrel=1
pkgdesc='wlroots compositor with HDR10 and dwm-style tags (GLES2 daily driver, experimental Vulkan renderer)'
arch=('x86_64')
url='https://github.com/asteroidzman/asteroidz'
license=('GPL3' 'MIT' 'CC0')
depends=(
  'wlroots0.20' 'wayland' 'libinput' 'libxkbcommon' 'pcre2' 'pixman'
  'cjson' 'pango' 'gdk-pixbuf2' 'libdrm' 'systemd-libs'
  'vulkan-icd-loader'
  'xcb-util-wm' 'libxcb'
  # asteroidz-scenefx is NOT a dependency any more: it lives in-tree at
  # subprojects/asteroidz-scenefx and is linked statically, so there is no
  # libasteroidz-scenefx-0.5.so to install or keep in version lockstep. What
  # remains are the libraries IT pulls in, which the static link now makes
  # asteroidz's own runtime dependencies:
  'libglvnd'   # libEGL, libGLESv2 -- the GLES2 renderer
  'mesa'       # libgbm
  'lcms2'      # colour management
)
makedepends=('meson' 'ninja' 'wayland-protocols' 'vulkan-headers' 'glslang' 'git')
optdepends=(
  'xorg-xwayland: run X11 applications under XWayland'
)
# Default session runs the GLES2 renderer (the daily driver); an
# "Asteroidz (Vulkan, experimental)" session (WLR_RENDERER=vulkan) is also
# installed, pending future wlroots enhancements. One binary, both renderers.
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  # -Dtracy=false is the default and is stated anyway: an accidental profiling
  # build would try to fetch subprojects/tracy.wrap from the network, which a
  # clean-chroot build cannot do and should not want to.
  arch-meson "$pkgname" build \
    -Dtracy=false \
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
