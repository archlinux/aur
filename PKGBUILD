# PKGBUILD based on the official Arch gamescope PKGBUILD
# Maintainer - Laurentiu Trofosila <trofosila at gmail dot com>
# Contributor - Antheas Kapenekakis <github dot com slash antheas>

pkgname=gamescope-shortcuts
pkgver=3.15.5
pkgrel=1
pkgdesc='SteamOS session compositing window manager patched to allow accessing Performance Overlay from within games'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(
  BSD-2-Clause
  BSD-3-Clause
  LicenseRef-Reshade
)
depends=(
  gcc-libs
  glibc
  lcms2
  libavif
  libcap.so
  libdecor
  libdrm
  libei
  libinput
  libpipewire-0.3.so
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  pixman
  sdl2
  seatd
  systemd-libs
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-wm
  xorg-server-xwayland
)
makedepends=(
  benchmark
  cmake
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
_tag=b1886b8bb7c92a4aa045a79c5e3a76c8bf83a55e
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${_tag}
  git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git
  git+https://gitlab.freedesktop.org/emersion/libliftoff.git
  git+https://github.com/ValveSoftware/openvr.git
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  git+https://github.com/Joshua-Ashton/vkroots.git
  git+https://github.com/Joshua-Ashton/wlroots.git
  https://raw.githubusercontent.com/hhd-dev/handheld-gamescope/master/v3-0001-always-send-ctrl-1-2-to-steam-s-wayland-session.patch
)
b2sums=('02d47333a879bd8e6a7c274a3a2fa399c8c379782292db610df3b1daf6768649526242f7a5b51bc0e7af000ea05ee947b24b14a7f6563f29e8d9bda0186c4ed0'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd gamescope

  meson subprojects download

  for submodule in src/reshade subprojects/{libdisplay-info,libliftoff,openvr,vkroots,wlroots} thirdparty/SPIRV-Headers; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../${submodule##*/}
  done
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i ../v3-0001-always-send-ctrl-1-2-to-steam-s-wayland-session.patch
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=glm,stb,libdisplay-info,libliftoff,vkroots,wlroots \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
