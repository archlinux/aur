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

pkgname=lib32-mesa-amdonly-gaming-git
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=23.2.0_devel.169866.c6906448425.d41d8cd98f00b204e9800998ecf8427e
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'lib32-libxml2' 'lib32-libx11' 'xorgproto'
             'lib32-libvdpau' 'git' 'lib32-libglvnd' 'wayland-protocols' 
             'meson' 'lib32-libva' 'lib32-libxrandr' 'lib32-llvm' 'lib32-clang')
depends=('mesa-amdonly-gaming-git' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 
         'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-libelf'
         'lib32-lm_sensors' 'glslang' 'lib32-vulkan-icd-loader' 'lib32-zstd' 'lib32-llvm-libs')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('lib32-mesa' 'lib32-vulkan-radeon' 'lib32-vulkan-mesa-layer' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-mesa-libgl' 'lib32-opengl-driver' 'lib32-vulkan-driver' 'lib32-opencl-mesa')
conflicts=('lib32-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-vulkan-mesa-layer' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-mesa-libgl' 'lib32-opencl-mesa')
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
        'LICENSE'
        'llvm32.native')
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '6b4a19068a323d7f90a3d3cd315ed1f9')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'c7dbb390ebde291c517a854fcbe5166c24e95206f768cc9458ca896b2253aabd6df12a7becf831998721b2d622d0c02afdd8d519e77dea8e1d6807b35f0166fe')

options=(!lto) # LTO is bad for mesa, makes random applications crash on my system

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

    arch-meson mesa _build \
        --native-file llvm32.native \
        -D b_ndebug=true \
        --wrap-mode=nofallback \
        -D sysconfdir=/etc \
        --libdir=/usr/lib32 \
        -D platforms=x11,wayland \
        -D gallium-d3d12-video=disabled \
        -D gallium-drivers=radeonsi,swrast,zink \
        -D vulkan-drivers=amd,swrast \
        -D dri3=enabled \
        -D egl=enabled \
        -D gallium-extra-hud=true \
        -D vulkan-beta=true\
        -D vulkan-layers=device-select,overlay \
        -D gallium-nine=false \
        -D gallium-omx=disabled \
        -D gallium-opencl=icd \
        -D gallium-va=enabled \
        -D gallium-vdpau=enabled \
        -D gallium-xa=disabled \
        -D gbm=enabled \
        -D gles1=disabled \
        -D gles2=enabled \
        -D glvnd=true \
        -D glx=dri \
        -D libunwind=disabled \
        -D android-libbacktrace=disabled \
        -D llvm=enabled \
        -D shared-llvm=enabled \
        -D lmsensors=enabled \
        -D osmesa=true \
        -D shared-glapi=enabled \
        -D valgrind=disabled \
        -D tools=[] \
        -D zstd=enabled \
        -D microsoft-clc=disabled

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
