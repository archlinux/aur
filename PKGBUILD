# Maintainer : Alexey Andreyev <aa13q@ya.ru>

_realname=mesa
pkgname=('mesa-grate-git')
pkgdesc="An open-source implementation of the OpenGL specification. NVidia Tegra 2 grate git"
pkgver=r100834.e84d295e03
pkgrel=1
arch=('armv7h')
makedepends=('python2-mako' 'libxml2' 'libx11' 'glproto' 'libdrm-grate-git' 'dri2proto' 'dri3proto' 'presentproto'
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'wayland' 'wayland-protocols'
             'elfutils' 'llvm' 'libomxil-bellagio' 'clang' 'libglvnd' 'lm_sensors' 'meson' 'libvdpau-tegra-git')
url="https://www.mesa3d.org/"
license=('custom')
source=('git://github.com/grate-driver/mesa.git')
sha512sums=('SKIP')
provides=('mesa' 'opengl-driver' 'mesa-dri' 'libglvnd' 'libgl' 'libegl' 'libgles')
conflicts=('mesa' 'opengl-driver' 'mesa-dri' 'libglvnd' 'libgl' 'libegl' 'libgles')


pkgver() {
  cd "${srcdir}/${_realname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/$_realname"
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd "${srcdir}/$_realname"
  make check
}

build() {
  cd "${srcdir}/${_realname}"
  ./configure --prefix=/usr \
         --enable-dri \
         --enable-glx \
         --enable-shared-glapi \
         --enable-texture-float \
         --disable-nine \
         --enable-debug \
         --enable-dri3 \
         --enable-egl \
         --enable-gbm \
         --enable-gles1 \
         --enable-gles2 \
         --enable-glx-tls \
         --enable-valgrind=auto \
         --enable-llvm-shared-libs \
         --with-dri-drivers=swrast \
         --with-gallium-drivers=swrast,grate \
         --with-vulkan-drivers=no \
         --with-platforms=x11,drm \
         --disable-nine \
         --disable-llvm \
         --disable-omx-bellagio \
         --disable-va \
         --disable-vdpau \
         --disable-xa \
         --disable-xvmc \
         --disable-gallium-osmesa \
         --disable-libunwind # https://github.com/grate-driver/mesa/issues/6#issuecomment-393329241
    make
}


package() {
  cd "${srcdir}/${_realname}"
  DESTDIR="$pkgdir" make install
  cd "${pkgdir}"
  mkdir -p usr/lib/arm-linux-gnueabihf/dri/
  mkdir -p usr/lib/arm-linux-gnueabihf/dri/
  # https://github.com/grate-driver/mesa/issues/6#issuecomment-393177315
  ln -s usr/lib/arm-linux-gnueabihf/dri/grate_dri.so usr/lib/arm-linux-gnueabihf/dri/tegra_dri.so
}
