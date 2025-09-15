# Maintainer: Denis Benato <benato.denis96 [at] gmail dot com>
# Maintainer: Chris Lane <aur at chrislane dot com>
# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>
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
# Contributor: Supdrewin <supdrewin at gmail dot com>

pkgbase=lib32-mesa-amdonly-gaming-git
pkgver=25.3.0_devel.212049.1c57f889082.d41d8cd
options=(!lto) # LTO is bad for mesa, makes random applications crash on my system

pkgname=(
  'lib32-amdonly-gaming-vulkan-mesa-layers-git'
  'lib32-amdonly-gaming-opencl-rusticl-mesa-git'
  'lib32-amdonly-gaming-vulkan-radeon-git'
  'lib32-amdonly-gaming-mesa-git'
)
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (32-bit)"
url="https://www.mesa3d.org/"
arch=('x86_64')
license=('LicenseRef-mesa')
makedepends=(
  'lib32-clang'
  'lib32-expat'
  'lib32-libdrm'
  'lib32-libelf'
  'lib32-libglvnd'
  'lib32-libva'
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
  'meson'
  'python-mako'
  'python-ply'
  'python-yaml'
  'python-setuptools'
  'rust-bindgen'
  'wayland-protocols'
  'xorgproto'

)
source=(
  'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
  'LICENSE'
)
b2sums=('SKIP'
        'cc60238726b35133b5b729fb4ed1e76e04136588533615d84b4a54656d5b41727d5e7ff06ef4de3eb102eed6669d6c5c5cb8ac9fbdf6fc25aa477877c5c3ba87')


# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

pkgver() {
  cd mesa
  local _ver
  _ver=$(<VERSION)

  local _patchver
  local _patchfile
  for _patchfile in "${source[@]}"; do
    _patchfile="${_patchfile%%::*}"
    _patchfile="${_patchfile##*/}"
    [[ $_patchfile = *.patch ]] || continue
    _patchver="${_patchver}$(md5sum ${srcdir}/${_patchfile} | cut -c1-32)"
  done
  _patchver="$(echo -n $_patchver | md5sum | cut -c1-7)"

  echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD).${_patchver}
}

prepare() {
  # although removing _build folder in build() function feels more natural,
  # that interferes with the spirit of makepkg --noextract
  if [  -d build ]; then
    rm -rf build
  fi

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
    -D display-info=disabled
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D b_lto=false
    -D egl=enabled
    -D gallium-drivers=radeonsi
    -D gallium-extra-hud=true
    -D gallium-rusticl=true
    -D gallium-va=enabled
    -D gallium-mediafoundation=disabled
    -D gbm=enabled
    -D gles1=disabled
    -D gles2=enabled
    -D glvnd=enabled
    -D glx=dri
    -D intel-rt=disabled
    -D libunwind=disabled
    -D llvm=enabled
    -D lmsensors=enabled
    -D microsoft-clc=disabled
    -D platforms=x11,wayland
    -D valgrind=disabled
    -D video-codecs=all
    -D vulkan-drivers=amd
    -D vulkan-layers=device-select,overlay
    -D vulkan-beta=true
    --wrap-mode=nofallback
    --buildtype=release
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

  meson compile $NINJAFLAGS -C build

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

package_lib32-amdonly-gaming-vulkan-mesa-layers-git() {
  pkgdesc="Mesa's Vulkan layers (32-bit)"
  depends=(
    'lib32-libdrm'
    'lib32-libxcb'
    'lib32-wayland'

    'amdonly-gaming-vulkan-mesa-layers-git'
  )
  conflicts=(
    'lib32-vulkan-mesa-layers'
    'lib32-vulkan-mesa-layer'
  )
  provides=(
    'lib32-vulkan-mesa-layers'
  )

  rm -rv fakeinstall/usr/share/vulkan/explicit_layer.d
  rm -rv fakeinstall/usr/share/vulkan/implicit_layer.d
  _install fakeinstall/$_libdir/libVkLayer_*.so
  rm -v fakeinstall/usr/bin/mesa-overlay-control.py

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-opencl-rusticl-mesa-git() {
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
    'amdonly-gaming-opencl-rusticl-mesa-git'
  )
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=(
    'lib32-opencl-rusticl-mesa'
    'lib32-opencl-driver'
  )
  conflicts=(
    'lib32-opencl-rusticl-mesa'
    'lib32-opencl-mesa'
  )

  rm -v fakeinstall/etc/OpenCL/vendors/rusticl.icd
  _install fakeinstall/$_libdir/libRusticlOpenCL*

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-vulkan-radeon-git() {
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

    'amdonly-gaming-vulkan-radeon-git'
  )
  optdepends=('lib32-vulkan-mesa-layers: additional vulkan layers')
  provides=(
    'lib32-vulkan-driver'
    'lib32-vulkan-radeon'
  )
  conflicts=('lib32-vulkan-radeon')

  rm -v fakeinstall/usr/share/drirc.d/00-radv-defaults.conf
  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/$_libdir/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_lib32-amdonly-gaming-mesa-git() {
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

    'amdonly-gaming-mesa-git'
  )
  optdepends=(
    'opengl-man-pages: for the OpenGL API man pages'
  )
  provides=(
    "lib32-mesa"
    "lib32-libva-mesa-driver=$epoch:$pkgver-$pkgrel"
    "lib32-mesa-libgl=$epoch:$pkgver-$pkgrel"
    "lib32-libva-driver"
    "lib32-opengl-driver"
    "lib32-opengl-driver"
  )
  conflicts=(
    'lib32-mesa'
    'lib32-mesa-libgl'
  )

  rm -v fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  rm -v fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/$_libdir/dri/*_dri.so
  _install fakeinstall/$_libdir/gbm/dri_gbm.so*

  _install fakeinstall/$_libdir/libgbm.so*
  _install fakeinstall/$_libdir/libgallium*.so*

  # only needed when gallium-xa is enabled
  #_install fakeinstall/$_libdir/libxatracker.so*

  # dri
  _install fakeinstall/$_libdir/dri/*.so*

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

# vim:set ts=2 sw=2 et:
