# Maintainer: FML128 <fml128@fml128.ch>

_pkgname=gamescope
pkgname=gamescope-fml
pkgver=3.14.2
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/ValveSoftware/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  glm
  libavif
  libcap.so
  libdisplay-info.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
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
  benchmark
  git
  glslang
  meson
  ninja
  vulkan-headers
  wayland-protocols
)
_tag=3.14.2
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${_tag}
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  add_720p_var.patch
  chimeraos.patch
  crashfix.patch
)

sha256sums=('9ba53bdbae2407d74f35345c720b25977f46b1745df83214c9894b50e842afd2'
            'SKIP'
            '03726f2fb44ae79e6a398e8f9aaaf8054800dda9b8298726157522fe5f7296b1'
            'SKIP'
            'f3e7e62c92eda9848cf4f93c1975155288a1f8cd0efb55a73e39472c7780d05a'
            '44e84780277ebdf8f46955b9964890e8719fe4fd10432d696d860d883ffee023'
            'bdd1dd6e9d82df745970715c2284458ba651fcf05cbc58e7b1e75551db681d46')

prepare() {
  cd gamescope

#  patch -Np1 -i ../add_720p_var.patch
#  patch -Np1 -i ../chimeraos.patch
#  patch -Np1 -i ../crashfix.patch

  meson subprojects download
  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update


}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/-//'
}

build() {
  arch-meson gamescope build \
    -Dforce_fallback_for=stb \
    -Dpipewire=enabled \
    -Denable_gamescope=true \
    -Denable_gamescope_wsi_layer=true \
    -Denable_openvr_support=true
  meson compile -C build
}

package() {
  install -d "$pkgdir"/usr/share/gamescope/reshade
  cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
  chmod -R 655 "$pkgdir"/usr/share/gamescope

  DESTDIR="${pkgdir}" meson install -C build \
    --skip-subprojects
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

