# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=mesa-aliveos
pkgver=26.3.1
pkgrel=2
pkgdesc="Open-source OpenGL and VA-API drivers (AliveOS patched Mesa)"
url="https://github.com/Twilight0/mesa-aliveos"
arch=('x86_64')
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
depends=(
  'expat'
  'glibc'
  'libdrm'
  'libelf'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxext'
  'libxshmfence'
  'libxxf86vm'
  'llvm-libs'
  'lm_sensors'
  'spirv-tools'
  'wayland'
  'zlib'
  'zstd'
)
makedepends=(
  'bison'
  'clang'
  'flex'
  'glslang'
  'libva'
  'libxrandr'
  'llvm'
  'meson'
  'python-mako'
  'python-packaging'
  'python-yaml'
  'spirv-llvm-translator'
  'wayland-protocols'
  'xorgproto'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
  "mesa=1:${pkgver}-${pkgrel}"
  "libva-mesa-driver=1:${pkgver}-${pkgrel}"
  "mesa-libgl=1:${pkgver}-${pkgrel}"
  'libva-driver'
  'opengl-driver'
)
conflicts=(
  'mesa'
  'libva-mesa-driver'
  'mesa-libgl'
)
replaces=(
  'libva-mesa-driver<1:24.2.7-1'
  'mesa-libgl<17.0.1-2'
)
options=(
  # GCC LTO causes segfaults in LLVM under si_llvm_optimize_module
  # https://gitlab.freedesktop.org/mesa/mesa/-/issues/11140
  !lto
  !debug
)
source=(
  "https://archive.mesa3d.org/mesa-${pkgver}.tar.xz"
  "0001-panfrost-Fix-types-of-panfrost_vdrm-functions.patch"
  "0002-Revert-mesa-don-t-advertise-APIs-that-are-not-built.patch"
  "0003-nouveau-vaapi-vp4-fix-teardown-sync-and-m2mf-bounds.patch"
  "0004-vl-compositor-fix-yuv420p-plane-order-and-v-plane.patch"
  "0005-nvc0-increase-ra-spill-retries-and-glsl-460.patch"
  "0006-nouveau-nvc0-progressive-nv12-msppp-and-yuv-modifiers.patch"
)
sha256sums=(
  '4e4e438eac7b840a9383988cbb7c08dad8041da544b9319fc26d319fa7348961'
  'c637763ede739aaedd7527e2cc224243d661156fde7983e6ed52a30a7db8961d'
  '91306d2f4d5373d6db98ea53dc4824ccf2ddd5d6c8be352081aabe75f4000a56'
  'e7fee31b145500b795f4e551ff6da37c0001216789b3cf38923cf497448b58fd'
  'b90431e9382805a1018632572da38fce895a8836068b662bc5aea61458fe4cc0'
  'd084d055d5270c843262314f4322ee103f5cd6a47a733c33d164692e34a08581'
  'cc2f7bc15f798d5ed1aefb374ed89dae6799dbfbbe6622b9d80495f560c4bad9'
)

prepare() {
  cd "mesa-${pkgver}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Include package release in version string so Chromium invalidates
  # its GPU cache on upgrades.
  echo "${pkgver}-aliveos.${pkgrel}" > VERSION
}

build() {
  local meson_options=(
    --optimization 2
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D egl=enabled
    -D expat=enabled
    -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,llvmpipe,softpipe,iris,crocus,i915,zink
    -D gallium-extra-hud=true
    -D gallium-mediafoundation=disabled
    -D gallium-rusticl=false
    -D gallium-va=enabled
    -D gbm=enabled
    -D gles1=disabled
    -D gles2=enabled
    -D glvnd=enabled
    -D html-docs=disabled
    -D intel-rt=disabled
    -D libunwind=disabled
    -D llvm=enabled
    -D lmsensors=enabled
    -D microsoft-clc=disabled
    -D platforms=x11,wayland
    -D shader-cache=enabled
    -D shared-glapi=enabled
    -D shared-llvm=enabled
    -D spirv-tools=enabled
    -D teflon=false
    -D valgrind=disabled
    -D video-codecs=all
    -D vulkan-drivers=
    -D xmlconfig=enabled
    -D zlib=enabled
    -D zstd=enabled
  )

  arch-meson "mesa-${pkgver}" build --auto-features=auto "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild

  # Indirect rendering symlink (matches Arch Linux extra/mesa)
  ln -sr "$pkgdir/usr/lib/libGLX_mesa.so.0" "$pkgdir/usr/lib/libGLX_indirect.so.0"

  install -Dm644 "mesa-${pkgver}/docs/license.rst" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
