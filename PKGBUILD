# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.43
pkgrel=3
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/Plagman/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  libcap.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
  libwlroots.so
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxrender
  libxres
  libxtst
  libxxf86vm
  sdl2
  vulkan-icd-loader
  wayland
  wayland-protocols
  #wlroots
  libinput
  pixman
  xcb-util-renderutil
  xcb-util-wm
  xcb-util-errors
  xorg-server-xwayland
)
makedepends=(
  git
  glslang
  meson
  ninja
  vulkan-headers
)
_tag=c5269642a293ce5e91d3d644ee15a3f3bcc3c5f3
source=("git+https://github.com/Plagman/gamescope.git#tag=${_tag}"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "0001-Add-force-orientation-option.patch"
        "0002-Force-orientation-only-to-internal-display.patch")
b2sums=('SKIP'
        'SKIP'
        '86d47b63f3d2a4d2bc94e30b197ddc4c3563b2e57f0e98537a3eea4dcb90b7b9ba686b44e646f37e41ae46f36c3d33184b66f6597eeefe77b01f2e44c5c84662'
        'd594fc79b9f0a348d2b760aaef0f513c9202de5c5ca8b66575a9b7a3d628be728027a7effa119552616578b4d04bec40dd1f163f7df70d503b9d631280acbab7')

prepare() {
  cd "$srcdir/$_pkgname"

  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      git apply "../$src"
  done

  git submodule init
  git config submodule.subprojects/wlroots.url "$srcdir/wlroots"
  git submodule update

  meson subprojects download
}

#pkgver() {
#  cd gamescope
#  git describe --tags | sed 's/-//'
#}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=wlroots,stb \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build

  rm -rfv "$pkgdir/usr/include/wlr" "$pkgdir/usr/lib/libwlroots.a" "$pkgdir/usr/lib/libwlroots*" "$pkgdir/usr/lib/pkgconfig/wlroots.pc"

  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
