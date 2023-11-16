# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Co-Maintainer: Matthew Anderson <ruinairas1992 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.13.5.plus2
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ChimeraOS/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  glm
  libdrm
  libinput
  libxcomposite
  libxkbcommon
  libxmu
  libxres
  libxtst
  pipewire
  pixman
  sdl2
  seatd
  xcb-util-errors
  xcb-util-renderutil
  xcb-util-wm
  xorg-xwayland
)
makedepends=(
  benchmark
  git
  meson
  ninja
  cmake
  glslang
  vulkan-headers
  wayland-protocols
)
_tag=485490294855313ac85fc4cb46371b2b6922c527
source=("git+https://github.com/ChimeraOS/gamescope.git#commit=${_tag}"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
        "git+https://github.com/ValveSoftware/openvr.git"
        "git+https://github.com/Joshua-Ashton/vkroots.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/Joshua-Ashton/reshade.git"
        "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
        )

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule init
  git config submodule.subprojects/wlroots.url "$srcdir/wlroots"
  git config submodule.subprojects/libliftoff.url "$srcdir/libliftoff"
  git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
  git config submodule.subprojects/openvr.url "$srcdir/openvr"
  git config submodule.subprojects/vkroots.url "$srcdir/vkroots"
  git config submodule.src/reshade.url "$srcdir/reshade"
  git -c protocol.file.allow=always submodule update

  # make stb.wrap use our local clone
  sed -i "s|https://github.com/nothings/stb.git|$srcdir/stb|" "subprojects/stb.wrap"

  meson subprojects download
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/\-/\./g'
}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=stb,libliftoff,wlroots \
    -Dpipewire=enabled \
    -Dwlroots:backends=drm,libinput,x11 \
    -Dwlroots:renderers=gles2,vulkan
  ninja -C build
}

package() {
  install -d "$pkgdir"/usr/share/gamescope/reshade
  cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
  chmod -R 655 "$pkgdir"/usr/share/gamescope

  meson install -C build --skip-subprojects --destdir="${pkgdir}"
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
