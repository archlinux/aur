# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Co-Maintainer: Matthew Anderson <ruinairas1992 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.15.13.plus1
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ChimeraOS/gamescope
license=(BSD-2-Clause)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  glm
  lcms2
  libavif
  libdecor
  libcap.so
  libglvnd
  libdrm
  libinput
  libpipewire-0.3.so
  libpixman-1.so
  libseat.so
  libudev.so
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  luajit
  opengl-driver
  sdl2
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-renderutil
  xcb-util-wm
  xorg-server-xwayland
)

makedepends=(
  cmake
  benchmark
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)

source=("git+https://github.com/ChimeraOS/gamescope.git#commit=${pkgver}"
        "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
        "git+https://github.com/Joshua-Ashton/reshade.git"
        "git+https://github.com/Joshua-Ashton/wlroots.git"
        "git+https://github.com/ValveSoftware/openvr.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
        # FIXME Upstream gamescope is just selecting master branch at build time, so we are arbitrarily snapshotting a
        #       revision when bumping the version here such that the build is reproducible.
        "git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a")

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"

  # git submodules
  git submodule init
  git config submodule.src/reshade.url "$srcdir/reshade"
  git config submodule.subprojects/wlroots.url "$srcdir/wlroots"
  git config submodule.subprojects/libliftoff.url "$srcdir/libliftoff"
  git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
  git config submodule.thirdparty/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git -c protocol.file.allow=always submodule update

  # meson submodules
  rm -rf subprojects/stb
  git clone "$srcdir/stb" subprojects/stb
  cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
}

build() {
  cd "$srcdir/$_pkgname"

  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson --buildtype release --prefix /usr build
  ninja -C build
}

package() {

  install -d "$pkgdir"/usr/share/gamescope/reshade
  cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
  chmod -R 655 "$pkgdir"/usr/share/gamescope

  cd "$srcdir/$_pkgname"
  meson install -C build --skip-subprojects --destdir="${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope-plus/
}

# vim: ts=2 sw=2 et:
