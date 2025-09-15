# Maintainer: Denis Benato <benato.denis96 [at] gmail dot com>
# Maintainer: Chris Lane <aur at chrislane dot com>
# Maintainer: DexterHaxxor <fox@dexterhaxxor.dev>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
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

pkgbase=mesa-amdonly-gaming-git
pkgver=25.3.0_devel.212049.1c57f889082.d41d8cd
options=(!lto) # LTO is bad for mesa, makes random applications crash on my system
pkgname=(
  'amdonly-gaming-vulkan-mesa-layers-git'
  'amdonly-gaming-opencl-rusticl-mesa-git'
  'amdonly-gaming-vulkan-radeon-git'
  'amdonly-gaming-mesa-git'
)
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification"
url="https://www.mesa3d.org/"
arch=('x86_64')
license=('LicenseRef-mesa')
makedepends=(
  'expat'
  'libdrm'
  'libelf'
  'libglvnd'
  'libva'
  'libx11'
  'libxdamage'
  'libxml2'
  'libxrandr'
  'libxshmfence'
  'libxxf86vm'
  'llvm'
  'lm_sensors'
  'rust'
  'spirv-llvm-translator'
  'spirv-tools'
  'systemd'
  'vulkan-icd-loader'
  'wayland'
  'xcb-util-keysyms'
  'zstd'

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

  # d3d12 deps
  'directx-headers'
)
source=(
  'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
  'rusticl-radeonsi.conf'
  'LICENSE'
)
b2sums=('SKIP'
        '35c88904596100f29830bebb1a3d1a9a90e01b12c8311980d6da5476372ea5c1930f296958ee3b5cbadb62b644f43b18e2791275b65c2fa6e1278674714469a7'
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
    -D sysconfdir=/etc
    --buildtype=release
  )

  # Build only minimal debug info to reduce size
  #CFLAGS+=' -g1'
  #CXXFLAGS+=' -g1'

  CFLAGS+=" -march=native "

  arch-meson mesa build "${meson_options[@]}"
  meson configure build --no-pager # Print config
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

_libdir=usr/lib

package_amdonly-gaming-vulkan-mesa-layers-git() {
  pkgdesc="Mesa's Vulkan layers"
  depends=(
    'libdrm'
    'libxcb'
    'wayland'

    'python'
  )
  conflicts=(
    'vulkan-mesa-layers'
    'vulkan-mesa-layer'
  )
  provides=(
    'vulkan-mesa-layers'
  )

  _install fakeinstall/usr/share/vulkan/explicit_layer.d
  _install fakeinstall/usr/share/vulkan/implicit_layer.d
  _install fakeinstall/$_libdir/libVkLayer_*.so
  _install fakeinstall/usr/bin/mesa-overlay-control.py

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_amdonly-gaming-opencl-rusticl-mesa-git() {
  pkgdesc="OpenCL support with rusticl for mesa drivers"
  depends=(
    'clang'
    'expat'
    'libdrm'
    'libelf'
    'lm_sensors'
    'spirv-llvm-translator'
    'zstd'

    'libclc'
  )
  optdepends=('opencl-headers: headers necessary for OpenCL development')
  provides=(
    'opencl-rusticl-mesa'
    'opencl-driver'
  )
  conflicts=(
    'opencl-rusticl-mesa'
    'opencl-mesa'
  )

  _install fakeinstall/etc/OpenCL/vendors/rusticl.icd
  _install fakeinstall/$_libdir/libRusticlOpenCL*

  # enable Rusticl with radeonsi driver
  install -m644 -Dt "${pkgdir}/etc/environment.d" rusticl-radeonsi.conf
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_amdonly-gaming-vulkan-radeon-git() {
  pkgdesc="Radeon's Vulkan mesa driver"
  depends=(
    'libdrm'
    'libelf'
    'libx11'
    'libxshmfence'
    'llvm-libs'
    'systemd'
    'wayland'
    'xcb-util-keysyms'
    'zstd'
  )
  optdepends=('vulkan-mesa-layers: additional vulkan layers')
  provides=(
    'vulkan-driver'
    'vulkan-radeon'
  )
  conflicts=('vulkan-radeon')

  _install fakeinstall/usr/share/drirc.d/00-radv-defaults.conf
  _install fakeinstall/usr/share/vulkan/icd.d/radeon_icd*.json
  _install fakeinstall/$_libdir/libvulkan_radeon.so

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_amdonly-gaming-mesa-git() {
  depends=(
    'libdrm'
    'libelf'
    'libglvnd'
    'libxdamage'
    'libxshmfence'
    'libxxf86vm'
    'llvm-libs'
    'lm_sensors'
    'vulkan-icd-loader'
    'wayland'
    'zstd'
  )
  optdepends=(
    'opengl-man-pages: for the OpenGL API man pages'
  )
  provides=(
    "mesa"
    "libva-mesa-driver=$epoch:$pkgver-$pkgrel"
    "mesa-libgl=$epoch:$pkgver-$pkgrel"
    "libva-driver"
    "opengl-driver"
  )
  conflicts=(
    'mesa'
    'mesa-libgl'
  )

  _install fakeinstall/usr/share/drirc.d/00-mesa-defaults.conf
  _install fakeinstall/usr/share/glvnd/egl_vendor.d/50_mesa.json

  # ati-dri, nouveau-dri, intel-dri, svga-dri, swrast, swr
  _install fakeinstall/$_libdir/dri/*_dri.so
  _install fakeinstall/$_libdir/gbm/dri_gbm.so*

  _install fakeinstall/$_libdir/libgbm.so*
  _install fakeinstall/$_libdir/libgallium*.so*

  # dri
  _install fakeinstall/$_libdir/dri/*.so*

  # only needed when gallium-xa is enabled
  #_install fakeinstall/$_libdir/libxatracker.so*

  _install fakeinstall/usr/include
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
