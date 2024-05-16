# Maintainer: FML128 <fml128@fml128.ch>

_pkgname=gamescope
pkgname=gamescope-fml
pkgver=3.14.14
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
  libdecor
  libdisplay-info.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
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
  cmake
)
source=(
  git+https://github.com/ValveSoftware/gamescope.git#tag=${pkgver}
  git+https://github.com/nothings/stb.git#commit=af1a5bc352164740c1cc1354942b1c6b72eacb8a
  git+https://github.com/Joshua-Ashton/reshade.git
  git+https://github.com/Joshua-Ashton/GamescopeShaders.git#tag=v0.1
  git+https://github.com/KhronosGroup/SPIRV-Headers.git
  720p.patch
  disable-steam-touch-click-atom.patch
  external-rotation.patch
  panel-type.patch
)

sha256sums=('e9bb0560dcf6e9ba3a6b0a47b005609d9efea80d4fcb064b0aa4f60681338f4a'
            'e39e0c91b297bfd707afcda84ecdc15a08c22e2ad4c347fc3533b1ed98fb3f85'
            'SKIP'
            '03726f2fb44ae79e6a398e8f9aaaf8054800dda9b8298726157522fe5f7296b1'
            'SKIP'
            '63a9c78d2871b5f53e037b43929a9db5fac1d464a0026d0d0b207227bbd9dcd5'
            'b12682ccaf9e0fd25bfed37c16f79d79ce418564b73b2ed1e4a81b2b03dc43cf'
            '86f0832f00f5c4f75df8bd5d2a434a31ae4879b59dbee63239d4035b75c56b02'
            '5b09480791d07f76df4da2fafc54336ad6806d3eaaf57ab81c651ebd3b56ff51')

prepare() {
  cd "$srcdir/$_pkgname"
   
  #  meson subprojects download
  meson subprojects download
  git submodule init src/reshade
  git config submodule.src/reshade.url ../reshade
  git submodule init thirdparty/SPIRV-Headers
  git config submodule.thirdparty/SPIRV-Headers.url ../SPIRV-Headers
  git -c protocol.file.allow=always submodule update   
  
  # make stb.wrap use our local clone
  rm -rf subprojects/stb
  git clone "$srcdir/stb" subprojects/stb
  cp -av subprojects/packagefiles/stb/* subprojects/stb/ # patch from the .wrap we elided
  
  patch -Np1 -i ../720p.patch
  patch -Np1 -i ../disable-steam-touch-click-atom.patch
  patch -Np1 -i ../external-rotation.patch
  patch -Np1 -i ../panel-type.patch
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
