# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com
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

pkgname=lib32-mesa-ps4
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=26.0.0_devel.214240.b2badb2b241.d41d8cd
pkgrel=1
arch=('x86_64')
makedepends=(
        'python-mako'
        'lib32-libxml2'
        'xorgproto'
        'git'
        'lib32-libglvnd'
        'wayland-protocols' 
        'meson'
        'lib32-libva'
        'lib32-libxrandr'
        'python-packaging'
        'python-pyaml'
)
depends=(
        'mesa-ps4'
        'lib32-gcc-libs'
        'lib32-libdrm'
        'lib32-wayland'
        'lib32-libxxf86vm'
        'lib32-libxdamage'
        'lib32-libxshmfence'
        'lib32-libelf'
        'lib32-libunwind'
        'lib32-lm_sensors'
        'glslang'
        'lib32-vulkan-icd-loader'
        'lib32-zstd'
        'lib32-libxcb'
        'lib32-libxfixes'
        'lib32-expat'
        'lib32-libxext'
        'lib32-libx11'
        'lib32-zlib'
        'lib32-glibc'
        'lib32-spirv-tools'
)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(
        'lib32-mesa'
        'lib32-vulkan-intel'
        'lib32-vulkan-radeon'
        'lib32-vulkan-mesa-layers'
        'lib32-libva-mesa-driver'
        'lib32-mesa-libgl'
        'lib32-opengl-driver'
        'lib32-vulkan-driver'
        'lib32-vulkan-mesa-device-select'
)
conflicts=(
        'lib32-mesa'
        'lib32-vulkan-intel'
        'lib32-vulkan-radeon'
        'lib32-vulkan-mesa-layers'
        'lib32-libva-mesa-driver'
        'lib32-mesa-libgl'
        'lib32-vulkan-mesa-device-select'
)
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
        'LICENSE'
        'llvm32.native'
        'mesa-24.0.9.patch'
        'mesa-ps4-9999-r1.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# MESA_WHICH_LLVM is an environment variable used to determine which llvm package tree is used to built mesa-git against.
# Adding a line to ~/.bash_rc that sets this value is the simplest way to ensure a specific choice.
# 
# 1: llvm-minimal-git (aur) preferred value
# 2: llvm-git (aur)
# 3  llvm-git (lordheavy unoffical repo)
# 4  llvm (stable from extra) default value
# 
# N.B. make sure lib32-mesa-git uses same value for this as mesa-git to avoid problems !
#

if [[ ! $MESA_WHICH_LLVM ]] ; then
    MESA_WHICH_LLVM=4
fi

case $MESA_WHICH_LLVM in
    1)
        # aur lone_wolf-llvm-git
        makedepends+=('lib32-llvm-minimal-git' 'libclc-minimal-git' 'lib32-spirv-tools' 'lib32-spirv-llvm-translator-minimal-git' 'lib32-clang-libs-minimal-git' 'clang-minimal-git'
                        'clang-opencl-headers-minimal-git' 'lib32-clang-opencl-headers-minimal-git'
        )
        depends+=('lib32-llvm-libs-minimal-git'  'lib32-spirv-tools')
        ;;
    2)
        # aur llvm-git
        # depending on aur-lib32-llvm-* to avoid mixup with LH llvm-git
        makedepends+=('aur-lib32-llvm-git')
        depends+=('aur-lib32-llvm-libs-git')
        ;;
    3)
        # mesa-git/llvm-git (lordheavy unofficial repo)
        makedepends+=('lib32-llvm-git')
        depends+=('lib32-llvm-libs-git')
        ;;
    4)
        # extra/llvm
        makedepends+=(
            'lib32-llvm'
            'lib32-spirv-llvm-translator'
            'lib32-spirv-tools')
        depends+=(
            'lib32-clang'
            'lib32-llvm-libs'
            'lib32-spirv-llvm-translator'
            'lib32-spirv-tools')
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
    export CC="${CC:-gcc}"
    export CXX="${CXX:-g++}"
    CC="$CC -m32"
    CXX="$CXX -m32"

    export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

    meson setup mesa _build \
        --native-file llvm32.native \
        -D b_ndebug=true \
        -D buildtype=plain \
        --wrap-mode=nofallback \
        -D prefix=/usr \
        -D sysconfdir=/etc \
        --libdir=/usr/lib32 \
        -D platforms=x11,wayland \
        -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,softpipe,llvmpipe,virgl,iris,zink,crocus \
        -D vulkan-drivers=amd,intel,swrast,virtio,intel_hasvk \
        -D egl=enabled \
        -D gallium-extra-hud=true \
        -D vulkan-layers=device-select,overlay \
        -D gallium-va=enabled \
        -D gbm=enabled \
        -D gles1=disabled \
        -D gles2=enabled \
        -D glvnd=enabled \
        -D glx=dri \
        -D libunwind=enabled \
        -D llvm=enabled \
        -D lmsensors=enabled \
        -D valgrind=disabled \
        -D tools=[] \
        -D zstd=enabled \
        -D microsoft-clc=disabled \
        -D legacy-x11=dri2 \
        -D video-codecs=all

    meson configure --no-pager _build

    ninja  $NINJAFLAGS -C _build
}

package() {
    DESTDIR="$pkgdir" ninja $NINJAFLAGS -C _build install

    # remove files provided by mesa-git
    rm -rf "$pkgdir"/etc
    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/share/glvnd/
    rm -rf "$pkgdir"/usr/share/drirc.d/
    rm -rf "$pkgdir"/usr/share/vulkan/explicit_layer.d/
    rm -rf "$pkgdir"/usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # indirect rendering
    ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"
    install -m644 -Dt  "$pkgdir"/usr/share/licenses/$pkgbase/ "$srcdir"/LICENSE 
}
