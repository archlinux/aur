# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=mesa-d3d12
pkgdesc="Mesa with D3D12 Gallium backend"
pkgver=21.3.3
pkgrel=1
arch=('x86_64')
depends=(
  # mesa
  'libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
  'libomxil-bellagio' 'libunwind' 'llvm-libs' 'lm_sensors' 'libglvnd'
  'zstd' 'vulkan-icd-loader'
  'libsensors.so' 'libexpat.so' 'libvulkan.so'
  # mesa-vulkan-layers
  'libdrm' 'libxcb' 'wayland' 'python'
  # opencl-mesa
  'libdrm' 'libclc' 'clang'
  # vulkan-intel vulkan-radeon vulkan-swrast
  'wayland' 'libx11' 'libxshmfence' 'libdrm' 'zstd' 'libelf' 'llvm-libs'
  # libva-mesa-driver mesa-vdpau
  'libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence'
  'libexpat.so'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
  'mesa' 'mesa-libgl' 'opengl-driver'
  'vulkan-mesa-layers'
  'opencl-mesa' 'opencl-driver'
  'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-driver'
  'libva-mesa-driver'
  'mesa-vdpau'
)
conflicts=(
  'mesa'
  'vulkan-mesa-layers'
  'opencl-mesa'
  'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast'
  'libva-mesa-driver'
  'mesa-vdpau'
)

makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence' 'libxxf86vm'
             'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols' 'zstd' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors' 'libxrandr'
             'valgrind' 'glslang' 'vulkan-icd-loader' 'cmake' 'meson' 'directx-headers')

url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE)
sha512sums=('0263d75435f8c16d40eba3eae29bf372e8994816718deec153c582a17c4dd6ef1c67b3236ed31e63f98bf4e1089fac5cfafae9fb84d3e1fa919b274f43e7e673'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>
install='mesa-d3d12.install'

build() {
  arch-meson mesa-$pkgver build \
    -D b_lto=true \
    -D b_ndebug=true \
    -D platforms=x11,wayland \
    -D dri-drivers=i915,i965,r100,r200,nouveau \
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,crocus,zink,d3d12 \
    -D vulkan-drivers=amd,intel,swrast \
    -D vulkan-layers=device-select,intel-nullhw,overlay \
    -D swr-arches=avx,avx2 \
    -D dri3=enabled \
    -D egl=enabled \
    -D gallium-extra-hud=true \
    -D gallium-nine=true \
    -D gallium-omx=bellagio \
    -D gallium-opencl=icd \
    -D gallium-va=enabled \
    -D gallium-vdpau=enabled \
    -D gallium-xa=enabled \
    -D gallium-xvmc=disabled \
    -D gbm=enabled \
    -D gles1=disabled \
    -D gles2=enabled \
    -D glvnd=true \
    -D glx=dri \
    -D libunwind=enabled \
    -D llvm=enabled \
    -D lmsensors=enabled \
    -D osmesa=true \
    -D shared-glapi=enabled \
    -D microsoft-clc=disabled \
    -D valgrind=enabled

  # Print config
  meson configure build

  ninja -C build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
