# Maintainer: Robin Lange <robin.langenc@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-vulkan-mesa-layer
pkgver=19.3.2
pkgrel=1
pkgdesc="Vulkan overlay layer to display information about the application (32-bit)"
arch=('x86_64')
depends=('vulkan-mesa-layer') # Needed to provide the layer manifest JSON file
makedepends=('meson' 'lib32-gcc-libs' 'python-mako' 'lib32-libdrm' 'lib32-llvm' 'glslang' 'lib32-libelf' 'lib32-expat')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig}
        LICENSE)
sha512sums=('fb69999fa7a15cd6f2c254fb6e8fe635e56dc49a5c2c762a96c77815cbad77060b8f81a02e67ac9ec58092ab866e080fb928086a5ac1e61c3efe882e5825cd28'
            'SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>"
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC') # Dylan Baker <dylan@pnwbakers.com>
  
prepare() {
  cd mesa-${pkgver}

}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  arch-meson mesa-$pkgver build \
    --libdir=/usr/lib32 \
    -D b_lto=false \
    -D b_ndebug=true \
    -D platforms=[] \
    -D dri-drivers=[] \
    -D gallium-drivers=[] \
    -D vulkan-drivers=intel \
    -D swr-arches=avx,avx2 \
    -D dri3=false \
    -D egl=false \
    -D gallium-extra-hud=false \
    -D gallium-nine=false \
    -D gallium-omx=disabled \
    -D gallium-opencl=disabled \
    -D gallium-va=false \
    -D gallium-vdpau=false \
    -D gallium-xa=false \
    -D gallium-xvmc=false \
    -D gbm=false \
    -D gles1=false \
    -D gles2=false \
    -D glvnd=false \
    -D glx=disabled \
    -D libunwind=false \
    -D llvm=true \
    -D lmsensors=false \
    -D osmesa=none \
    -D opengl=false \
    -D shader-cache=true \
    -D shared-glapi=true \
    -D valgrind=false \
    -D vulkan-overlay-layer=true

  # Print config
  meson configure build

  ninja -C build

  # fake installation to be seperated into packages
  # outside of fakeroot but mesa doesn't need to chown/mod
  DESTDIR="${srcdir}/fakeinstall" ninja -C build install
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

package() {

  _install fakeinstall/usr/lib32/libVkLayer_MESA_overlay.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
