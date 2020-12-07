# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgname=lib32-mesa-git
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=21.0.0_devel.132039.6df572532dc
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'lib32-libxml2' 'lib32-libx11' 'xorgproto'
             'lib32-gcc-libs' 'lib32-libvdpau' 'lib32-libelf' 'git' 'mesa-git' 'lib32-libglvnd' 
             'wayland-protocols' 'lib32-wayland' 'meson' 'lib32-libva' 'lib32-libxrandr')
depends=('mesa-git' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence'
            'lib32-elfutils' 'lib32-libunwind' 'lib32-lm_sensors' 'glslang' 'lib32-vulkan-icd-loader' 'lib32-zstd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('lib32-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-opengl-driver' 'lib32-vulkan-driver')
conflicts=('lib32-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git'
                'LICENSE'
                'llvm32.native'
)

md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '6b4a19068a323d7f90a3d3cd315ed1f9')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'c7dbb390ebde291c517a854fcbe5166c24e95206f768cc9458ca896b2253aabd6df12a7becf831998721b2d622d0c02afdd8d519e77dea8e1d6807b35f0166fe')

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
        makedepends+=('lib32-llvm-minimal-git')
        depends+=('lib32-llvm-libs-minimal-git')
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
        makedepends+=(lib32-llvm=11.0.0)
        depends+=(lib32-llvm-libs=11.0.0)
        ;;
    *)
esac


pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi
}
build () {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

    meson setup mesa _build \
        --native-file llvm32.native \
        -D b_ndebug=true \
        -D b_lto=true \
        -D buildtype=plain \
        --wrap-mode=nofallback \
        -D prefix=/usr \
        -D sysconfdir=/etc \
        --libdir=/usr/lib32 \
        -D platforms=x11,wayland \
        -D dri-drivers=i915,i965,r200,r100,nouveau \
        -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl,iris,zink \
        -D vulkan-drivers=amd,intel \
        -D dri3=enabled \
        -D egl=enabled \
        -D gallium-extra-hud=true \
        -D vulkan-overlay-layer=true \
        -D vulkan-device-select-layer=true \
        -D gallium-nine=true \
        -D gallium-omx=disabled \
        -D gallium-opencl=disabled \
        -D gallium-va=enabled \
        -D gallium-vdpau=enabled \
        -D gallium-xa=enabled \
        -D gallium-xvmc=disabled \
        -D gbm=enabled \
        -D gles1=disabled \
        -D gles2=enabled \
        -D glvnd=true \
        -D glx=dri \
        -D libunwind=enabled \
        -D llvm=enabled \
        -D lmsensors=enabled \
        -D osmesa=gallium \
        -D shared-glapi=enabled \
        -D valgrind=disabled \
        -D tools=[] \
        -D zstd=enabled \
        -D microsoft-clc=disabled

    meson configure _build
    
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
