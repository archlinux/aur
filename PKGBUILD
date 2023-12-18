# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

pkgname=gamescope-nvidia
_pkgname=gamescope
pkgver=3.13.19
pkgrel=1
pkgdesc='SteamOS session compositing window manager (NVIDIA patch)'
arch=(x86_64)
url=https://github.com/sharkautarch/gamescope
license=(BSD)
install="$_pkgname.install"
depends=(
  gcc-libs
  glibc
  libcap.so
  libdisplay-info.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
  libwlroots.so
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
  openvr
  sdl2
  vulkan-icd-loader
  wayland
  xorg-server-xwayland
)
makedepends=(
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
  vkroots
  glm
)
provides=(
  "$_pkgname"
)
conflicts=(
  "$_pkgname"
)
source=(
  0001-Revert-rendervulkan-Get-a-general-graphics-compute-q.patch
  0002-fix-error-due-to-removed-general-command-pool.patch
  0003-oops.patch
  0004-fix-removed-general-queue.patch
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
)
b2sums=('f0a7562a7825df16878f733669056dc5ecda36e62afc945e745b6746ee7ecf6983d4659b0061f73852165537479fac68ecd59913b2ff6fdc5ac18ff23d891d97'
        '6c5e3cc88cd4882ea6a1a1afa7a47d93dcc665128d7fa125d619440303530f4f774046ae157134521b15df022fc389241b7a58cf386aec53de98a67983a3589a'
        '62a07d81a63d390be1c4bc838b4dea920c41efb37ca6aff919696f8ca104b688eeeea896fb2a4706b20f487578864bbaee4f09fe4b764b5a17cc6384bed1cd38'
        'bde7af1325b29ee4456272cf04c999d9248d320334d1794ebf3181962b93f8d30c31e308d73b4d67f592729bda59763f790890b7d82e7d8e951ed2f8415d9b36'
        'SKIP'
        'SKIP'
        'SKIP'
)

prepare() {
  # apply nvidia-fix patchs from
  # https://github.com/sharkautarch/gamescope/tree/nvidia-fix
  for patch in "${source[@]}"; do
    if [[ $patch == *.patch ]]; then
      echo "applying $patch"
      patch -d "$_pkgname" -Np1 < "$patch"
    fi
  done

  cd gamescope
  meson subprojects download stb
  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=stb \
    -Dbenchmark=disabled \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
