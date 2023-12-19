# Maintainer: Denis Benato <benato.denis96 [at] gmail dot com>
# Contributor: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com
# Contributor: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=lib32-mesa-amdonly-gaming-git
pkgver=24.0.0_devel.181988.9ca9b674462.d954e6c2b60b8d8c955b77483af4bdfb
options=(!lto) # LTO is bad for mesa, makes random applications crash on my system

pkgname=(
  'lib32-amdonly-gaming-vulkan-mesa-layers'
  'lib32-amdonly-gaming-opencl-clover-mesa'
  'lib32-amdonly-gaming-opencl-rusticl-mesa'
  'lib32-amdonly-gaming-vulkan-radeon'
  'lib32-amdonly-gaming-vulkan-swrast'
  'lib32-amdonly-gaming-vulkan-virtio'
  'lib32-amdonly-gaming-libva-mesa-driver'
  'lib32-amdonly-gaming-mesa-vdpau'
  'lib32-amdonly-gaming-mesa'
)
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (32-bit)"
url="https://www.mesa3d.org/"
arch=('x86_64')
license=('custom')
makedepends=(
  'lib32-clang'
  'lib32-expat'
  'lib32-libdrm'
  'lib32-libelf'
  'lib32-libglvnd'
  'lib32-libva'
  'lib32-libvdpau'
  'lib32-libx11'
  'lib32-libxdamage'
  'lib32-libxml2'
  'lib32-libxrandr'
  'lib32-libxshmfence'
  'lib32-libxxf86vm'
  'lib32-llvm'
  'lib32-lm_sensors'
  'lib32-rust-libs'
  'lib32-spirv-llvm-translator'
  'lib32-spirv-tools'
  'lib32-systemd'
  'lib32-vulkan-icd-loader'
  'lib32-wayland'
  'lib32-zstd'

  # shared between mesa and lib32-mesa
  'git'
  'clang'
  'cmake'
  'elfutils'
  'glslang'
  'libclc'
  'meson>=1.3.0'
  'python-mako'
  'python-ply'
  'rust-bindgen'
  'wayland-protocols'
  'xorgproto'

)
source=(
  'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
  'LICENSE'
)
b2sums=('SKIP'
        'cc60238726b35133b5b729fb4ed1e76e04136588533615d84b4a54656d5b41727d5e7ff06ef4de3eb102eed6669d6c5c5cb8ac9fbdf6fc25aa477877c5c3ba87' # LICENSE
)
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>


# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

pkgver() {
    cd mesa
    local _ver
    read -r _ver <VERSION

    local _patchver
    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        _patchver="${_patchver}$(md5sum ${srcdir}/${_patchfile} | cut -c1-32)"
    done
    _patchver="$(echo -n $_patchver | md5sum | cut -c1-32)"

    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD).${_patchver}
}

prepare() {
  # although removing _build folder in build() function feels more natural,
  # that interferes with the spirit of makepkg --noextract
  if [  -d _build ]; then
    rm -rf _build
  fi

  # Ugly hack to allow recompilation using gamescope.path
  if [ -f "mesa/src/egl/wayland/wayland-drm/gamescope-commit-queue-v1.xml" ]; then
    rm -rf "mesa/src/egl/wayland/wayland-drm/gamescope-commit-queue-v1.xml"
  fi

  # Include package release in version string so Chromium invalidates
  # its GPU cache; otherwise it can cause pages to render incorrectly.
  # https://bugs.launchpad.net/ubuntu/+source/chromium-browser/+bug/2020604
  echo "$pkgver-$pkgrel" >VERSION

  local _patchfile
  for _patchfile in "${source[@]}"; do
      _patchfile="${_patchfile%%::*}"
      _patchfile="${_patchfile##*/}"
      [[ $_patchfile = *.patch ]] || continue
      echo "Applying patch $_patchfile..."
      patch --directory=mesa --forward --strip=1 --input="${srcdir}/${_patchfile}"
  done
}

build() {
  local meson_options=(
    --cross-file lib32
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D dri3=enabled
    -D egl=enabled
    -D gallium-drivers=radeonsi,virgl,svga,swrast,crocus,zink
    -D gallium-extra-hud=true
    -D gallium-nine=true
    -D gallium-omx=disabled
    -D gallium-opencl=icd
    -D gallium-rusticl=true
    -D gallium-va=enabled
    -D gallium-vdpau=enabled
    -D gallium-xa=enabled
    -D gbm=enabled
    -D gles1=disabled
    -D gles2=enabled
    -D glvnd=true
    -D glx=dri
    -D intel-clc=enabled
    -D libunwind=disabled
    -D llvm=enabled
    -D lmsensors=enabled
    -D microsoft-clc=disabled
    -D osmesa=true
    -D platforms=x11,wayland
    -D rust_std=2021
    -D shared-glapi=enabled
    -D valgrind=disabled
    -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc
    -D vulkan-drivers=amd,swrast,virtio
    -D vulkan-layers=device-select,overlay
  )

  # Build only minimal debug info to reduce size
  #CFLAGS+=' -g1'
  #CXXFLAGS+=' -g1'

  export BINDGEN_EXTRA_CLANG_ARGS="-m32"

  arch-meson mesa build "${meson_options[@]}"
  meson configure build --no-pager # Print config

  #if [ ! -f "build/build.ninja.bak" ]; then
  #  cp build/build.ninja build/build.ninja.back
  #fi

  # Evil: Hack build to make proc-macro crate native
  # Should become unnecessary with Meson 1.3
  #sed -e '/^rule rust_COMPILER$/irule rust_HACK\n command = rustc -C linker=gcc $ARGS $in\n deps = gcc\n depfile = $targetdep\n description = Compiling native Rust source $in\n' \
  #    -e '/^build src\/gallium\/frontends\/rusticl\/librusticl_proc_macros\.so:/s/rust_COMPILER/rust_HACK/' \
  #    -e '/^ LINK_ARGS =/s/ src\/gallium\/frontends\/rusticl\/librusticl_proc_macros\.so//' \
  #    -i build/build.ninja

  $NINJAFLAGS meson compile -C build

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

_libdir=usr/lib32

package_lib32-amdonly-gaming-vulkan-mesa-layers() {
  pkgdesc="Mesa's Vulkan layers (32-bit)"
  depends=(
    'lib32-libdrm'
    'lib32-libxcb'
    'lib32-wayland'

    'amdonly-gaming-vulkan-mesa-layers'
  )
  conflicts=(
    'lib32-vulkan-mesa-layers'
    'lib32-vulkan-mesa-layer'
  )
  replaces=(
    'lib32-vulkan-mesa-layers'
    'lib32-vulkan-mesa-layer'
  )

  rm -rv fakeinstall/usr/share/vulkan/explicit_layer.d
  rm -rv fakeinstall/usr/share/vulkan/implicit_layer.d
  _install fakeinstall/$_libdir/libVkLayer_*.so
  rm -v fakeinstall/usr/bin/mesa-overlay-control.py

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-opencl-clover-mesa() {
  pkgdesc="OpenCL support with clover for mesa drivers (32-bit)"
  depends=(
    'lib32-clang'
    'lib32-expat'
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-spirv-llvm-translator'
    'lib32-zstd'

    'libclc'
    'amdonly-gaming-opencl-clover-mesa'
  )
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=(
    'lib32-opencl-clover-mesa'
    'lib32-opencl-driver'
  )
  replaces=(
    'lib32-opencl-clover-mesa'
    "lib32-opencl-mesa<=23.1.4-1"
  )
  conflicts=(
    'lib32-opencl-clover-mesa'  
    'lib32-opencl-mesa'
  )

  rm -v fakeinstall/etc/OpenCL/vendors/mesa.icd
  _install fakeinstall/$_libdir/libMesaOpenCL*
  _install fakeinstall/$_libdir/gallium-pipe

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-opencl-rusticl-mesa() {
  pkgdesc="OpenCL support with rusticl for mesa drivers (32-bit)"
  depends=(
    'lib32-clang'
    'lib32-expat'
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-lm_sensors'
    'lib32-spirv-llvm-translator'
    'lib32-zstd'

    'libclc'
    'amdonly-gaming-opencl-rusticl-mesa'
  )
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=(
    'lib32-opencl-rusticl-mesa'
    'lib32-opencl-driver'
  )
  replaces=(
    'lib32-opencl-rusticl-mesa'
    "lib32-opencl-mesa<=23.1.4-1"
  )
  conflicts=(
    'lib32-opencl-rusticl-mesa'
    'lib32-opencl-mesa'
  )

  rm -v fakeinstall/etc/OpenCL/vendors/rusticl.icd
  _install fakeinstall/$_libdir/libRusticlOpenCL*

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-vulkan-radeon() {
  pkgdesc="Radeon's Vulkan mesa driver (32-bit)"
  depends=(
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-libx11'
    'lib32-libxshmfence'
    'lib32-llvm-libs'
    'lib32-systemd'
    'lib32-wayland'
    'lib32-xcb-util-keysyms'
    'lib32-zstd'

    'amdonly-gaming-vulkan-radeon'
  )
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  provides=(
    'lib32-vulkan-radeon'
    'lib32-vulkan-driver'
  )
  replaces=('lib32-vulkan-radeon')
  conflicts=('lib32-vulkan-radeon')

  rm -v fakeinstall/usr/share/drirc.d/00-radv-defaults.conf
  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/$_libdir/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-vulkan-swrast() {
  pkgdesc="Vulkan software rasteriser driver (32-bit)"
  depends=(
    'lib32-libdrm'
    'lib32-libx11'
    'lib32-libxshmfence'
    'lib32-llvm-libs'
    'lib32-systemd'
    'lib32-wayland'
    'lib32-xcb-util-keysyms'
    'lib32-zstd'
  )
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  conflicts=(
    'lib32-vulkan-swrast'
    'lib32-vulkan-mesa'
  )
  replaces=(
    'lib32-vulkan-swrast'
    'lib32-vulkan-mesa'
  )
  provides=(
    'lib32-vulkan-swrast'
    'lib32-vulkan-driver'
  )

  _install fakeinstall/usr/share/vulkan/icd.d/lvp_icd*.json
  _install fakeinstall/$_libdir/libvulkan_lvp.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-vulkan-virtio() {
  pkgdesc="Venus Vulkan mesa driver for Virtual Machines (32-bit)"
  depends=(
    'lib32-libdrm'
    'lib32-libx11'
    'lib32-libxshmfence'
    'lib32-systemd'
    'lib32-wayland'
    'lib32-xcb-util-keysyms'
    'lib32-zstd'
  )
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  provides=(
    'lib32-vulkan-driver'
  )
  replaces=('lib32-vulkan-virtio')
  conflicts=('lib32-vulkan-virtio')

  _install fakeinstall/usr/share/vulkan/icd.d/virtio_icd*.json
  _install fakeinstall/$_libdir/libvulkan_virtio.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-libva-mesa-driver() {
  pkgdesc="VA-API drivers (32-bit)"
  depends=(
    'lib32-expat'
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-libx11'
    'lib32-libxshmfence'
    'lib32-llvm-libs'
    'lib32-zstd'
  )
  provides=('lib32-libva-driver')
  replaces=('lib32-libva-mesa-driver')
  conflicts=('lib32-libva-mesa-driver')

  _install fakeinstall/$_libdir/dri/*_drv_video.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-mesa-vdpau() {
  pkgdesc="VDPAU drivers (32-bit)"
  depends=(
    'lib32-expat'
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-libx11'
    'lib32-libxshmfence'
    'lib32-llvm-libs'
    'lib32-zstd'
  )
  provides=(
    'lib32-vdpau-driver'
    'lib32-mesa-vdpau'
  )
  replaces=('lib32-mesa-vdpau')
  conflicts=('lib32-mesa-vdpau')

  _install fakeinstall/$_libdir/vdpau

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-mesa() {
  depends=(
    'lib32-libdrm'
    'lib32-libelf'
    'lib32-libglvnd'
    'lib32-libxdamage'
    'lib32-libxshmfence'
    'lib32-libxxf86vm'
    'lib32-llvm-libs'
    'lib32-lm_sensors'
    'lib32-vulkan-icd-loader'
    'lib32-wayland'
    'lib32-zstd'

    'amdonly-gaming-mesa'
  )
  optdepends=(
    'opengl-man-pages: for the OpenGL API man pages'
  )
  provides=(
    'lib32-mesa'
    'lib32-mesa-libgl'
    'lib32-opengl-driver'
  )
  conflicts=(
    'lib32-mesa'
    'lib32-mesa-libgl'
  )
  replaces=(
    'lib32-mesa'
    'lib32-mesa-libgl'
  )

  rm -v fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  rm -v fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/$_libdir/dri/*_dri.so

  _install fakeinstall/$_libdir/d3d
  _install fakeinstall/$_libdir/lib{gbm,glapi}.so*
  _install fakeinstall/$_libdir/libOSMesa.so*
  _install fakeinstall/$_libdir/libxatracker.so*

  rm -rv fakeinstall/usr/include
  _install fakeinstall/$_libdir/pkgconfig

  # libglvnd support
  _install fakeinstall/$_libdir/libGLX_mesa.so*
  _install fakeinstall/$_libdir/libEGL_mesa.so*

  # indirect rendering
  ln -sr "$pkgdir"/$_libdir/libGLX_{mesa,indirect}.so.0

  # make sure there are no files left to install
  find fakeinstall -depth -print0 | xargs -0 rmdir

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
