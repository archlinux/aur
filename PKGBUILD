# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=mesa-d3d12
pkgdesc="Mesa optimized for D3D12 Gallium backend"
pkgver=22.1.4
pkgrel=1
arch=('x86_64')
depends=(
  # mesa
  'libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
  'libomxil-bellagio' 'libunwind' 'llvm-libs' 'lm_sensors' 'libglvnd'
  'zstd' 'vulkan-icd-loader'
  'libsensors.so' 'libexpat.so' 'libvulkan.so'
  # vulkan-mesa-layers
  'libdrm' 'libxcb' 'wayland' 'python'
  # opencl-mesa
  'libdrm' 'libclc' 'clang' 'expat'
  # vulkan-swrast
  'wayland' 'libx11' 'libxshmfence' 'libdrm' 'zstd' 'llvm-libs' 'systemd-libs' 'libunwind'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
  'mesa' 'mesa-libgl' 'opengl-driver'
  'vulkan-mesa-layers'
  'opencl-mesa' 'opencl-driver'
  'vulkan-swrast' 'vulkan-driver'
)
conflicts=(
  'mesa'
  'vulkan-mesa-layers'
  'opencl-mesa'
  'vulkan-swrast'

  # disabled features won't work, mark as conflict
  'vulkan-intel' 'vulkan-radeon'
  'libva-mesa-driver'
  'mesa-vdpau'
)

makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence' 'libxxf86vm'
             'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols' 'zstd' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors' 'libxrandr'
             'systemd' 'valgrind' 'glslang' 'vulkan-icd-loader' 'directx-headers' 'cmake' 'meson')

url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE)
sha512sums=('64f584a70c3c7554682c861444c75433eaa858e86725d9de4c067c234bcae535dffa9dcbab16fb86a1d30680772bd23ea6af336afdf99a50960d6c133592950f'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>

build() {
  # https://gitlab.freedesktop.org/mesa/mesa/-/issues/6229
  CFLAGS+=' -mtls-dialect=gnu'
  CXXFLAGS+=' -mtls-dialect=gnu'

  arch-meson mesa-$pkgver build \
    -D b_ndebug=true \
    -D platforms=x11,wayland \
    -D gallium-drivers=swrast,d3d12 \
    -D vulkan-drivers=swrast \
    -D vulkan-layers=device-select,overlay \
    -D dri3=enabled \
    -D egl=enabled \
    -D gallium-extra-hud=true \
    -D gallium-nine=false \
    -D gallium-omx=disabled \
    -D gallium-opencl=icd \
    -D gallium-va=disabled \
    -D gallium-vdpau=disabled \
    -D gallium-xa=disabled \
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
