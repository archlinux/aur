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
  libcap.so
  libdisplay-info.so
  libglvnd
  libdrm
  libinput
  libpipewire-0.3.so
  libpixman-1.so
  libseat.so
  libudev.so
  libvulkan.so
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
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  chimeraos.patch
  crashfix.patch
  add_720p_var.patch
  crashfix.patch
  0001-disable-steam-touch-click-atom.patch
)

sha256sums=('9ba53bdbae2407d74f35345c720b25977f46b1745df83214c9894b50e842afd2'
            'e39e0c91b297bfd707afcda84ecdc15a08c22e2ad4c347fc3533b1ed98fb3f85'
            'SKIP'
            '03726f2fb44ae79e6a398e8f9aaaf8054800dda9b8298726157522fe5f7296b1'
            'SKIP'
            '3da074f82c7cc68f28a371c2711306e1e3cef38b36598c87693183147924e3ac'
            '184a8660cc789e31573edfdadb0f79b7f90714e8ee6b5bc9e70f8ed88fad1e5a'
            'ecd03eef896e6c5edfed6d5eeaa2f6a27a0fba25852f2efd57dc3ddbf7fd5f5e'
            '184a8660cc789e31573edfdadb0f79b7f90714e8ee6b5bc9e70f8ed88fad1e5a'
            'f908e641be087b3c01b2f43dd3c5d2ea4435080421c0660fa15a8337285fcb03')

prepare() {
  cd "$srcdir/$_pkgname"
   
  #  meson subprojects download
  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update   
  
  # make stb.wrap use our local clone
  rm -rf subprojects/stb
  git clone "$srcdir/stb" subprojects/stb
  cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
  
  
#  patch -Np1 -i ../chimeraos.patch
#  patch -Np1 -i ../crashfix.patch
#  patch -Np1 -i ../add_720p_var.patch
#  patch -Np1 -i ../0001-disable-steam-touch-click-atom.patch

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

