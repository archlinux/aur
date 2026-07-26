# Maintainer: Shipa Snake <aurahag2@gmail.com>

pkgbase=vulkan-ai-terakan
pkgname=(
  vulkan-ai-terakan
  lib32-vulkan-ai-terakan
)
# Bootstrap value required by makepkg. pkgver() replaces it with the version
# derived from the latest commit fetched from Terakan_state_rework.
pkgver=25.2.0_devel.r208368.ga4099a35bd5
pkgrel=4
pkgdesc="Updated and enhanced fork of the experimental Mesa Terakan Vulkan driver for AMD TeraScale GPUs"
arch=(x86_64)
url="https://github.com/shipa-2/mesa-terakan-ai-upstreamed"
license=(MIT)
options=(!lto !debug)

depends=(
  expat
  libdrm
  libx11
  libxcb
  libxshmfence
  spirv-tools
  systemd-libs
  vulkan-icd-loader
  wayland
  xcb-util-keysyms
  zlib
  zstd
)
makedepends=(
  bison
  byacc
  flex
  git
  glslang
  libxrandr
  lib32-gcc-libs
  lib32-libdrm
  lib32-libx11
  lib32-libxrandr
  lib32-libxcb
  lib32-libxshmfence
  lib32-spirv-tools
  lib32-systemd
  lib32-vulkan-icd-loader
  lib32-wayland
  lib32-xcb-util-keysyms
  lib32-zlib
  lib32-zstd
  meson
  ninja
  pkgconf
  python-mako
  python-packaging
  python-ply
  python-yaml
  vulkan-headers
  wayland-protocols
  xorgproto
)

_branch=Terakan_state_rework
# This is intentionally an unpinned VCS source: makepkg updates the cached
# repository and checks out the current branch HEAD before pkgver() and build().
_source_url=${TERAKAN_MESA_SOURCE:-"${url}.git#branch=${_branch}"}
source=(
  "mesa-terakan::git+${_source_url}"
  terakan-vulkan
  terakan-vulkan32
  terakan-wine
  terakan-test-capabilities
  README.md
)
sha256sums=('SKIP'
            '3feb3a6aaeaa19d3123cf04b10d1b908e27349a6661574ba0453f270ac65d716'
            'd9e147d9b21719c97257c01fe5f6c06169edbb7fcb2bce5abb5119b6a63faee2'
            '7508c7c69bb43e25238b5a1ee7ad53eb44ccea4c4a08f352ca2e706076bff270'
            'eda559db6e40ba21d8d1a66fa0644d9ee7e90c50706d7c50f64977d6cd67317b'
            'a8ae18d0717536880cc23086fd87ca68891e8fb372f3a2987e54635aa8adcf04')

pkgver() {
  cd mesa-terakan

  local mesa_version
  mesa_version=$(<VERSION)
  mesa_version=${mesa_version//-/_}
  printf '%s.r%s.g%s' \
    "$mesa_version" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=11 HEAD)"
}

_meson_common=(
  -Dwrap_mode=nodownload
  --buildtype=release
  -Dvulkan-drivers=amd_terascale
  -Dgallium-drivers=
  -Dglx=disabled
  -Degl=disabled
  -Dgbm=disabled
  -Dopengl=false
  -Dgles1=disabled
  -Dgles2=disabled
  -Dllvm=disabled
  -Dvalgrind=disabled
  -Dlmsensors=disabled
  -Dzstd=enabled
  -Dshader-cache=enabled
  -Dlibunwind=disabled
  -Dplatforms=x11,wayland
  -Dbuild-tests=false
  '-Dtools=[]'
)

prepare() {
  cd mesa-terakan

  test -f src/amd/terascale/vulkan/terakan_instance.c
  test -f src/amd/terascale/vulkan/meta/terakan_meta_resolve.c
  grep -q 'TERAKAN_API_VERSION' src/amd/terascale/vulkan/terakan_instance.h
}

build() {
  local source_dir="$srcdir/mesa-terakan"
  local build_cflags="$CFLAGS"
  local build_cxxflags="$CXXFLAGS"
  local build_ldflags="$LDFLAGS"

  rm -rf "$source_dir/build-terakan64" "$source_dir/build-terakan32"
  export CCACHE_DIR="$BUILDDIR/ccache"
  mkdir -p "$CCACHE_DIR"

  export PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig
  export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
  export CC=gcc
  export CXX=g++
  export CFLAGS="$build_cflags"
  export CXXFLAGS="$build_cxxflags"
  export LDFLAGS="$build_ldflags"
  meson setup "$source_dir/build-terakan64" "$source_dir" \
    --prefix=/usr \
    --libdir=lib \
    "${_meson_common[@]}"
  meson compile -C "$source_dir/build-terakan64"

  export PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig:/usr/share/pkgconfig
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export CFLAGS="$build_cflags -m32"
  export CXXFLAGS="$build_cxxflags -m32"
  export LDFLAGS="$build_ldflags -m32"
  meson setup "$source_dir/build-terakan32" "$source_dir" \
    --prefix=/usr \
    --libdir=lib32 \
    "${_meson_common[@]}"
  meson compile -C "$source_dir/build-terakan32"
}

_remove_shared_mesa_files() {
  rm -rf \
    "$pkgdir/usr/include" \
    "$pkgdir/usr/share/drirc.d" \
    "$pkgdir/usr/share/glvnd"
}

package_vulkan-ai-terakan() {
  pkgdesc="Updated and enhanced 64-bit fork of the Mesa Terakan Vulkan driver"
  depends=(
    expat
    libdrm
    libx11
    libxcb
    libxshmfence
    spirv-tools
    systemd-libs
    vulkan-icd-loader
    wayland
    xcb-util-keysyms
    zlib
    zstd
  )
  provides=(
    vulkan-driver
    vulkan-terakan
    vulkan-terakan-git
  )
  conflicts=(
    vulkan-terakan
    vulkan-terakan-git
  )
  install=vulkan-ai-terakan.install

  DESTDIR="$pkgdir" meson install \
    -C "$srcdir/mesa-terakan/build-terakan64" --no-rebuild

  install -Dm755 terakan-vulkan "$pkgdir/usr/bin/terakan-vulkan"
  install -Dm755 terakan-wine "$pkgdir/usr/bin/terakan-wine"
  ln -s terakan-vulkan "$pkgdir/usr/bin/terakan-vulkan-setup"
  ln -s terakan-wine "$pkgdir/usr/bin/terakan-dx-setup"
  install -Dm755 terakan-test-capabilities \
    "$pkgdir/usr/bin/terakan-test-capabilities"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/vulkan-ai-terakan/README.md"
  install -Dm644 "$srcdir/mesa-terakan/docs/license.rst" \
    "$pkgdir/usr/share/licenses/vulkan-ai-terakan/LICENSE"

  _remove_shared_mesa_files
}

package_lib32-vulkan-ai-terakan() {
  pkgdesc="Updated and enhanced 32-bit Terakan Vulkan fork for Wine and games"
  depends=(
    "vulkan-ai-terakan=$pkgver"
    lib32-expat
    lib32-gcc-libs
    lib32-libdrm
    lib32-libx11
    lib32-libxcb
    lib32-libxshmfence
    lib32-spirv-tools
    lib32-systemd
    lib32-vulkan-icd-loader
    lib32-wayland
    lib32-xcb-util-keysyms
    lib32-zlib
    lib32-zstd
  )
  provides=(
    lib32-vulkan-driver
    lib32-vulkan-terakan
    lib32-vulkan-terakan-git
  )
  conflicts=(
    lib32-vulkan-terakan
    lib32-vulkan-terakan-git
  )

  DESTDIR="$pkgdir" meson install \
    -C "$srcdir/mesa-terakan/build-terakan32" --no-rebuild

  local icd_dir="$pkgdir/usr/share/vulkan/icd.d"
  if [[ -f "$icd_dir/terascale_icd.${CARCH}.json" ]]; then
    mv "$icd_dir/terascale_icd.${CARCH}.json" \
      "$icd_dir/terascale_icd.i686.json"
  fi

  install -Dm755 terakan-vulkan32 "$pkgdir/usr/bin/terakan-vulkan32"
  ln -s terakan-vulkan32 "$pkgdir/usr/bin/terakan-vulkan32-setup"
  install -Dm644 "$srcdir/mesa-terakan/docs/license.rst" \
    "$pkgdir/usr/share/licenses/lib32-vulkan-ai-terakan/LICENSE"

  _remove_shared_mesa_files
}
