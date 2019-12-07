# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - Removed DRI and Gallium3D drivers/packages for chipsets that don't exist in our ARM devices (intel, radeon, VMware svga).
#  - disable assembly and rip out VC4 forced NEON for v6/v7
#  - remove makedepend on valgrind, -Dvalgrind=false

pkgbase=mesa-arm-git
pkgname=('libva-mesa-driver-arm-git' 'mesa-vdpau-arm-git' 'mesa-arm-git')
pkgdesc="An open-source implementation of the OpenGL specification"
pkgver=20.0.0_devel.118258.865ffe4e020
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'dri3proto' 'presentproto'
             'libxshmfence' 'libxxf86vm' 'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols'
             'elfutils' 'llvm' 'libomxil-bellagio' 'clang' 'libglvnd' 'lm_sensors'
             'libxrandr' 'meson')
url="https://www.mesa3d.org/"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git'
        LICENSE)
sha512sums=('SKIP'
            'f9f0d0ccf166fe6cb684478b6f1e1ab1f2850431c06aa041738563eb1808a004e52cdec823c103c9e180f03ffc083e95974d291353f0220fe52ae6d4897fecc7')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC') # Dylan Baker <dylan@pnwbakers.com>

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  MESON_OPT="-D asm=false"
  case "${CARCH}" in
    armv6h)  GALLIUM=",vc4" ;;
    armv7h)  GALLIUM=",etnaviv,kmsro,lima,panfrost,tegra,vc4" ;;
    aarch64) GALLIUM=",kmsro,lima,panfrost,v3d,vc4" ;;
  esac

  arch-meson mesa build \
    -D b_lto=false \
    -D b_ndebug=true \
    -D platforms=x11,wayland,drm,surfaceless \
    -D dri-drivers=nouveau \
    -D gallium-drivers=freedreno,nouveau,swrast,virgl${GALLIUM} \
    -D vulkan-drivers= \
    -D dri3=true \
    -D egl=true \
    -D gallium-extra-hud=true \
    -D gallium-nine=true \
    -D gallium-omx=bellagio \
    -D gallium-va=true \
    -D gallium-vdpau=true \
    -D gallium-xa=false \
    -D gallium-xvmc=false \
    -D gbm=true \
    -D gles1=false \
    -D gles2=true \
    -D glvnd=true \
    -D glx=dri \
    -D libunwind=false \
    -D llvm=true \
    -D lmsensors=true \
    -D osmesa=gallium \
    -D shared-glapi=true \
    -D valgrind=false $MESON_OPT

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

package_libva-mesa-driver-arm-git() {
  pkgdesc="VA-API implementation for gallium"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')
  provides=('libva-mesa-driver')
  conflicts=('libva-mesa-driver')
  _install fakeinstall/usr/lib/dri/*_drv_video.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-vdpau-arm-git() {
  pkgdesc="Mesa VDPAU drivers"
  depends=('libdrm' 'libx11' 'llvm-libs' 'expat' 'libelf' 'libxshmfence')
  provides=('mesa-vdpau')
  conflicts=('mesa-vdpau')
  _install fakeinstall/usr/lib/vdpau

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_mesa-arm-git() {
  depends=('libdrm' 'wayland' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
           'libomxil-bellagio' 'llvm-libs' 'lm_sensors' 'libglvnd')
  optdepends=('opengl-man-pages: for the OpenGL API man pages'
              'mesa-vdpau: for accelerated video playback'
              'libva-mesa-driver: for accelerated video playback')
  provides=('mesa' 'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl' 'opengl-driver')
  conflicts=('mesa' 'ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')
  replaces=('ati-dri' 'intel-dri' 'nouveau-dri' 'svga-dri' 'mesa-dri' 'mesa-libgl')

  _install fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  _install fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/usr/lib/dri/*_dri.so

  _install fakeinstall/usr/lib/bellagio
  _install fakeinstall/usr/lib/d3d
  _install fakeinstall/usr/lib/lib{gbm,glapi}.so*
  _install fakeinstall/usr/lib/libOSMesa.so*

  # in vulkan-headers
  rm -rfv fakeinstall/usr/include/vulkan

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
