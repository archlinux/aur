# Maintainer: Tomasz Pakuła <forest10pl at gmail dot com>
# Based on PKGBUILD of mesa-git

pkgname=mesa-fp8-git
pkgdesc="Semi-reguraly updated mainline mesa with fp8 hacks"
pkgver=0.0.5
pkgrel=1
arch=('x86_64')
makedepends=(
    'git'
    'xorgproto'
    'libxml2'
    'libvdpau'
    'libva'
    'elfutils'
    'libxrandr'
    'meson'
    'ninja'
    'glslang'
    'directx-headers'
    'python-mako'
    'python-ply'
    'cbindgen'
    'wayland-protocols'
    'python-packaging'
    'python-pyaml'
)
depends=(
    'libdrm'
    'libxxf86vm'
    'libxdamage'
    'libxshmfence'
    'libelf'
    'libunwind'
    'libglvnd'
    'wayland'
    'lm_sensors'
    'vulkan-icd-loader'
    'zstd'
    'expat'
    'gcc-libs'
    'libxfixes'
    'libx11'
    'systemd-libs'
    'libxext'
    'libxcb'
    'glibc'
    'zlib'
    'python'
    'xcb-util-keysyms'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
    'vulkan-mesa-layers'
    'opencl-driver'
    'opengl-driver'
    'vulkan-driver'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-vdpau'
    'mesa-libgl'
    'mesa'
)
conflicts=(
    'vulkan-mesa-layers'
    'opencl-clover-mesa'
    'vulkan-intel'
    'vulkan-nouveau'
    'vulkan-radeon'
    'vulkan-swrast'
    'vulkan-virtio'
    'libva-mesa-driver'
    'mesa-vdpau'
    'mesa-libgl'
    'mesa'
)
url="https://www.mesa3d.org"
license=('custom')
# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29275
source=(
    'mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#commit=d983280da9daf017e8898cf19ddaea57f2a3bf55'
    'LICENSE'
    '0001-radv-nir-lower_cmat-gfx12-fix-8bit-A-B-matrix-layout.patch'
    '0002-radv-nir-lower_cmat-gfx12-fix-A-B-8bit-16bit-convers.patch'
    '0003-hack-e4m3fn-nir-opcodes.patch'
    '0004-glsl_type-garbage.patch'
    '0005-spirv-convert-e4m3fn.patch'
    '0006-spirv-create-e4m3fn-type.patch'
    '0007-aco-emit-v_wmma_f32_16x16x16_fp8_fp8.patch'
    '0008-aco-select-f2e4m3fn.patch'
    '0009-aco-isel-fix-get_alu_src-with-8bit-vec2-source.patch'
    '0010-aco-select-e4m3fn2f.patch'
    '0011-radv-keep-fp8-conversions-vectorized.patch'
    '0012-radv-nir-lower_cmat-handle-e4m3fn-conversions.patch'
    '0013-hack-set-FP16_OVFL-for-shaders-that-use-conversions-.patch'
    '0014-Swapchain-patch.patch'
)
sha256sums=('SKIP'
            '7fdc119cf53c8ca65396ea73f6d10af641ba41ea1dd2bd44a824726e01c8b3f2'
            'e7e6d8a50cdfb4cef295907b048dd3dfe13d6602597edb5417bbdf1063174383'
            '56ee2ac3c79523967fe11d7b92f5567053d7cc6856e35187791b83f5b38d68d8'
            'a04af615ce2f785eef22cf1f8b3331b32bb9517eed91faa3a36131fa6df3fa06'
            '49883d4865cdd055bf79d11607adf05fc0e9484cc6797f45d94a86dd5a874cbd'
            '56cc2abef6664c8d9700ab0ddb059323594008e2bbf869ef9c81535b1613815d'
            '6220d39ba56eeec717a7781f866d2574deff320aaf087607d0d53df8ff0b5036'
            '48c5b996fae4e137e49df852761c427c2b30cb7611ef787e708d71fcff5ddae5'
            '96cf840439644878948418259086b264fcfce8ba140cd936d290cb4044507e2d'
            'b17afd2c1d26fa3a2f279dd491c9a4c318cda77dfb26dc898c9e697ffce3a949'
            '684e68ea6efa28262274cf44b6cbec03db61e86fb4066e030548bb44c7cb46e9'
            '1a3afb0da12c05c6c13487ce9a38e24fec7f81f93ee9de5e6da71c5e440b951c'
            '5f0fb8a45e0cd17c9ed2ce9ffaeb8a2683f04a571986a5f46f81e89b0b612f9e'
            'b96e41a0accfbdb3622906e536dc010081a38a957d804181d56b472126083b67'
            'd3cee4b72710b124822310010b9ba31169cfdb8a4a626db0e9d1da79d43bb55c'
            '39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b'
            '3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b'
            '5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae'
            '23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a')

options=(!lto !debug)
# lto and debug are disabled manually through meson -D flags, but it feels cleaner to also list them here.

# Rust crates for NVK, used as Meson subprojects
declare -A _crates=(
   proc-macro2    1.0.70
   quote          1.0.33
   syn            2.0.39
   unicode-ident  1.0.12
)

for _crate in "${!_crates[@]}"; do
  source+=($_crate-${_crates[$_crate]}.tar.gz::https://crates.io/api/v1/crates/$_crate/${_crates[$_crate]}/download)
done

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# MESA_WHICH_LLVM is an environment variable that determines which llvm package tree is used to built mesa-git against.
# Adding a line to ~/.bashrc  that sets this value is the simplest way to ensure a specific choice.
#
# NOTE: Aur helpers don't handle this method well, check the sticky comments on mesa-git aur page .
#
# 1: llvm-minimal-git (aur) preferred value
# 2: AUR llvm-git
# 3: llvm-git from LordHeavy unofficial repo
# 4  llvm (stable from extra) Default value
#

_rusticl=false
MESA_WHICH_LLVM=${MESA_WHICH_LLVM:-4}

case $MESA_WHICH_LLVM in
    1)
        # aur llvm-minimal-git
        _rusticl=true
        makedepends+=(
            'llvm-minimal-git'
            'libclc-minimal-git'
            'spirv-llvm-translator-minimal-git'
            'clang-minimal-git'
            'clang-opencl-headers-minimal-git'
            'rust'
            'rust-bindgen'
            'spirv-tools'
            'glslang'
        )
        depends+=(
            'llvm-libs-minimal-git'
            'spirv-llvm-translator-minimal-git'
            'libclc-minimal-git'
            'spirv-tools'
            'clang-libs-minimal-git'
            'clang-opencl-headers-minimal-git'
        )
        conflicts+=('opencl-rusticl-mesa')
        provides+=('opencl-rusticl-mesa')
        ;;
    2)
        # aur llvm-git
        # depending on aur-llvm-* to avoid mixup with LH llvm-git
        makedepends+=(
            'aur-llvm-git'
            'libclc-git'
            'spirv-llvm-translator-git'
            'clang-git'
            'clang-opencl-headers-git'
        )
        depends+=('aur-llvm-libs-git')
        optdepends+=('aur-llvm-git: opencl')
        ;;
    3)
        # mesa-git/llvm-git (lordheavy unofficial repo)
        makedepends+=(
            'llvm-git'
            'clang-git'
            'libclc-git'
            'spirv-tools'
            'spirv-llvm-translator-git'
        )
        depends+=('llvm-libs-git')
        optdepends+=('clang-git: opencl' 'compiler-rt: opencl')
        ;;
    4)
        # extra/llvm
        makedepends+=(
            'llvm'
            'clang'
            'libclc'
            'spirv-llvm-translator'
            'spirv-tools'
            'rust'
            'rust-bindgen'
        )
        depends+=(
            'llvm-libs'
            'clang'
            'libclc'
            'spirv-llvm-translator'
            'spirv-tools'
        )
        conflicts+=('opencl-rusticl-mesa')
        provides+=('opencl-rusticl-mesa')
        _rusticl=true
        ;;
    *)
esac

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
    if [  -d _build ]; then
        rm -rf _build
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

build () {
    local meson_options=(
        -D android-libbacktrace=disabled
        -D b_ndebug=true
        -D b_lto=false
        -D egl=enabled
        -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,softpipe,llvmpipe,i915,iris,crocus,zink
        -D gallium-extra-hud=true
        -D gallium-rusticl=${_rusticl}
        -D gallium-va=enabled
        -D gallium-vdpau=enabled
        -D gbm=enabled
        -D gles1=disabled
        -D gles2=enabled
        -D glvnd=enabled
        -D glx=dri
        -D intel-clc=enabled
        -D libunwind=enabled
        -D llvm=enabled
        -D lmsensors=enabled
        -D microsoft-clc=disabled
        -D platforms=x11,wayland
        -D valgrind=disabled
        -D video-codecs=all
        -D vulkan-drivers=amd,intel,intel_hasvk,swrast,virtio,nouveau
        -D vulkan-layers=device-select,intel-nullhw,overlay
        -D tools=[]
        -D zstd=enabled
        -D buildtype=plain
        --wrap-mode=nofallback
        --force-fallback-for=syn,paste,rustc-hash
        -D prefix=/usr
        -D sysconfdir=/etc
        -D legacy-x11=dri2
    )

    # Build only minimal debug info to reduce size
    CFLAGS+=' -g1'
    CXXFLAGS+=' -g1'

    meson setup mesa _build "${meson_options[@]}"
    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
