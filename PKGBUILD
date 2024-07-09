# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Co-Maintainer: Matthew Anderson <ruinairas1992 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.14.18.plus2
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ChimeraOS/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  glm
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
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  opengl-driver
  openvr
  sdl2
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-renderutil
  xcb-util-wm
  xorg-server-xwayland
)

makedepends=(
  benchmark
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)

_tag=0c4390c8dcecd3ae399da20866d5f15fb76bfd02
source=("git+https://github.com/ChimeraOS/gamescope.git#commit=${_tag}"
        "git+https://github.com/Joshua-Ashton/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1"
        # FIXME Upstream gamescope is just selecting master branch at build time, so we are arbitrarily snapshotting a
        #       revision when bumping the version here such that the build is reproducible.
        "git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a")

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  meson subprojects download
  git submodule init src/reshade
  git config submodule.src/reshade.url "$srcdir/reshade"
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update

  # make stb.wrap use our local clone
  rm -rf subprojects/stb
  git clone "$srcdir/stb" subprojects/stb
  cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/\-/\./g'
}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build
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
