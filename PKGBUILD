# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=mesa-minimal-git
pkgname=(mesa-minimal-git opencl-mesa-minimal-git)
pkgdesc="an open-source implementation of the OpenGL specification, stripped down git version"
pkgver=26.3.0_devel.227796.c5138d5f2bf
pkgrel=1
arch=('x86_64')
makedepends=(git meson ninja libglvnd python-packaging python-mako xorgproto libxml2 libx11  libva elfutils libxrandr
                            wayland-protocols glslang llvm-minimal-git libdrm libclc-minimal-git clang-minimal-git
                            rust rust-bindgen spirv-tools spirv-llvm-translator-minimal-git systemd-libs clang-opencl-headers-minimal-git
                            python-ply libunwind libxdamage vulkan-icd-loader xcb-util-keysyms python-pyaml libdisplay-info libpng
                            cbindgen)

optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(mesa opengl-driver vulkan-driver libva-mesa-driver vulkan-mesa-layers vulkan-mesa-implicit-layers
          vulkan-radeon vulkan-intel vulkan-nouveau vulkan-swrast vulkan-virtio)
conflicts=(mesa vulkan-intel vulkan-radeon vulkan-mesa-layers libva-mesa-driver vulkan-swrast mesa-vdpau vulkan-virtio
                vulkan-nouveau mesa-libgl vulkan-gfxstream vulkan-dzn vulkan-mesa-implicit-layers
)
# mixing components from different mesa versions is a bad idea, conflict with everything unique provided by extra/mesa

url="https://www.mesa3d.org"
license=("MIT AND BSD-3-Clause AND SGI-B-2.0")
source=("mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git"
        "venus-protocol-1.1::git+https://gitlab.freedesktop.org/virgl/venus-protocol.git"
)

# Rust crates for NVK, used as Meson subprojects
# shellcheck disable=SC2190
declare -A _crates=(
  proc-macro2     1.0.86
  quote           1.0.35
  syn             2.0.87
  unicode-ident   1.0.12
  paste           1.0.14
  rustc-hash      2.1.1
)

for _crate in "${!_crates[@]}"; do
  _ver="${_crates[$_crate]}"
  source+=(
    "$_crate-$_ver.tar.gz::https://static.crates.io/crates/$_crate/$_ver/download"
  )
done

sha512sums=('SKIP'
            'SKIP'
            '87097d98d47f327d000041ab13acddc366f1500d9c3e5c82169c3358112c7a7c03701c9b3c2c81d9f9da65b7ebac1c479b179dfaf7c059cd0b929b4673e51084'
            '1cdb7e22a35ae231d880c9420784c9acf97bda2db258b3d34aae5061dc1858449defe19a49e12c6a4173906aa72a4115059ac2db0fc760205fd2ab8b5b414434'
            'bc1824e1e4452a40732fc69874d7e1a66f7803717a314790dcf48867eba34bc9441331ef031e386912e52c385645c25b6ed39d4f149973b5b97371b1b96b1920'
            'f5314fb6af17cf36c228e1970c569c29ec248954a450a5f90ba9e2896d04f74904c9cec5a1f74325f2489295a94491eee4ce8fb461e22cd4b34e53f1f881efd2'
            '3a793f0e5e773a7f7defc798a4c17ae9a40d715144632ea6cb0a8c785e14c4212046491df016bb9838281f8eaf327a79f01c1e2ac5f26785c028bc880faff9ee'
            'bcfff545d6dfefd81e09f8f30a86bdd85759b3a7d4093ef3365ed02718e10dbd604c52b94c9d7fa955d339fdc5b6c079940c6f345b5a48c52b5c8607794ca6f2')
options=(!emptydirs !lto !debug)

pkgver() {
    cd mesa
    local _ver
    read -r _ver < VERSION || [ -n "_ver" ]
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    
    # Inject subproject packages
    export MESON_PACKAGE_CACHE_DIR="$srcdir"
    
    meson setup mesa _build \
      -D b_ndebug=true \
      -D b_lto=false \
      -D b_pie=true \
      -D buildtype=plain \
      --wrap-mode=nofallback \
      --force-fallback-for=syn,paste,rustc-hash,venus-protocol \
      -D rust_std=2021 \
      -D prefix=/usr \
      -D sysconfdir=/etc \
      -D platforms=x11,wayland \
      -D gallium-drivers=radeonsi,llvmpipe,zink,virgl,iris \
      -D gallium-extra-hud=true \
      -D gallium-va=enabled \
      -D egl=enabled \
      -D gbm=enabled \
      -D gles1=disabled \
      -D gles2=enabled \
      -D glvnd=enabled \
      -D glx=dri \
      -D libunwind=enabled \
      -D valgrind=disabled \
      -D llvm=enabled \
      -D lmsensors=enabled \
      -D vulkan-drivers=amd,intel,nouveau,virtio,swrast \
      -D vulkan-layers=device-select,overlay,screenshot,anti-lag,vram-report-limit \
      -D vulkan-manifest-per-architecture=false \
      -D zstd=enabled \
      -D tools=[] \
      -D microsoft-clc=disabled \
      -D gallium-mediafoundation=disabled \
      -D video-codecs=all \
      -D gallium-rusticl=true \
      -D gallium-rusticl-enable-drivers=radeonsi

    meson configure --no-pager _build
    meson compile -C _build
}

package_mesa-minimal-git() {
    depends=(libdrm libxxf86vm libxdamage libxshmfence libelf
                        libunwind libglvnd wayland lm_sensors vulkan-icd-loader
                        zstd llvm-libs-minimal-git zlib expat libxext libxcb systemd-libs
                        glibc libx11 libxfixes libstdc++ libgcc
                        xcb-util-keysyms spirv-tools libdisplay-info libpng
    )
    optdepends=('python3: for some commands')
    conflicts+=("opencl-mesa<$pkgver-$pkgrel")

    meson install -C _build --destdir "$pkgdir"

    # rusticl files go to a separate package
    mkdir -p "$srcdir"/rusticl/{etc/OpenCL/vendors,usr/lib} 
    mv "$pkgdir"/etc/OpenCL/vendors/rusticl.icd "$srcdir"/rusticl/etc/OpenCL/vendors
    mv "$pkgdir"/usr/lib/libRusticlOpenCL* "$srcdir"/rusticl/usr/lib

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "$pkgdir"/usr/share/licenses/$pkgname mesa/docs/license.rst
}

# I dislike splitting packages, but rusticl has several dependencies that are not needed by other mesa components
package_opencl-mesa-minimal-git() {
    pkgdesc="OpenCL support in rust for mesa drivers (git version)"
    conflicts=(opencl-mesa opencl-rusticl-mesa-minimal-git)
    provides=(opencl-mesa opencl-driver)
    depends=(libdrm spirv-llvm-translator-minimal-git libclc-minimal-git spirv-tools
                    mesa-minimal-git=$pkgver-$pkgrel llvm-libs-minimal-git clang-libs-minimal-git
                    expat libelf zstd lm_sensors zlib glibc clang-opencl-headers-minimal-git libstdc++ libgcc
    )
    
    cp --preserve --recursive "$srcdir"/rusticl/* "$pkgdir"/
        install -m644 -Dt "$pkgdir"/usr/share/licenses/$pkgname mesa/docs/license.rst
}
