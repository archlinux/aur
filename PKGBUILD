# Maintainer: Tomek Szczęsny <mctom at tlen, polish domain>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgbase=mesa-i915g
pkgname=('mesa-i915g')
pkgdesc="Mesa with i915 Gallium driver"
pkgver=21.2.3
pkgrel=2
arch=('x86_64')
makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence'
             'wayland' 'wayland-protocols' 'zstd' 
             'clang' 'libglvnd' 'llvm' 'lm_sensors' 'libxrandr'
             'cmake' 'meson')
url="https://www.mesa3d.org/"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mesa/trunk/LICENSE)
sha512sums=('a5841c200416c19b60563a3823dd51592627e64f5f794c9fa3fba630e33a126048866e9b425739d88f2832770646a7ba8752a718a50d06266392b92d1a7370ea'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>

build() {
  arch-meson mesa-$pkgver build \
    -D b_lto=true \
    -D b_ndebug=true \
    -D platforms=x11,wayland \
    -D dri-drivers= \
    -D gallium-drivers=i915,swrast \
    -D vulkan-drivers= \
    -D vulkan-layers= \
    -D dri3=enabled \
    -D egl=enabled \
    -D gallium-extra-hud=true \
    -D gallium-nine=false \
    -D gallium-omx=disabled \
    -D gallium-opencl=disabled \
    -D gallium-va=disabled \
    -D gallium-vdpau=disabled \
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
    -D osmesa=false \
    -D shared-glapi=enabled \
    -D microsoft-clc=disabled \
    -D valgrind=disabled \
    -D zstd=enabled

  # Print config
  meson configure build

  ninja -C build
  meson compile -C build

  # fake installation to be seperated into packages
  # outside of fakeroot but mesa doesn't need to chown/mod
  DESTDIR="${srcdir}/fakeinstall" meson install -C build
}

_install() {
  local src f dir
  for src; do
    f="${src#fakeinstall/}"
    dir="${pkgdir}/${f%/*}"
    install -m755 -d "${dir}"
    mv -v "${src}" "${dir}/"
  done
}

package_mesa-i915g() {
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
           'lm_sensors' 'libglvnd'
           'zstd' )
  depends+=('libsensors.so')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau: for accelerated video playback'
              'libva-mesa-driver: for accelerated video playback')
  provides=('mesa' 'mesa-libgl' 'opengl-driver')
  conflicts=('mesa' 'mesa-libgl')
  replaces=('mesa' 'mesa-libgl')

  _install fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  _install fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/usr/lib/dri/*_dri.so

#  _install fakeinstall/usr/lib/d3d
  _install fakeinstall/usr/lib/lib{gbm,glapi}.so*
#  _install fakeinstall/usr/lib/libOSMesa.so*
  _install fakeinstall/usr/lib/libxatracker.so*

  _install fakeinstall/usr/include
  _install fakeinstall/usr/lib/pkgconfig

  # libglvnd support
  _install fakeinstall/usr/lib/libGLX_mesa.so*
  _install fakeinstall/usr/lib/libEGL_mesa.so*

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
