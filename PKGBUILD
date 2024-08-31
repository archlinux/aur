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

pkgname=lib32-mesa-minimal-git
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=24.3.0_devel.194283.b78a3d4de90
pkgrel=1
arch=('x86_64')
makedepends=(python-mako python-packaging lib32-libxml2 lib32-libx11 xorgproto lib32-gcc-libs lib32-libelf git lib32-libglvnd
                        wayland-protocols lib32-wayland meson lib32-libva lib32-libxrandr mesa-minimal-git lib32-llvm-minimal-git lib32-libvdpau 
                        libclc-minimal-git lib32-spirv-tools lib32-spirv-llvm-translator-minimal-git lib32-clang-libs-minimal-git clang-minimal-git
                        clang-opencl-headers-minimal-git lib32-clang-opencl-headers-minimal-git python-pyaml
)
depends=(mesa-minimal-git lib32-gcc-libs lib32-libdrm lib32-wayland lib32-libxxf86vm lib32-libxdamage lib32-libxshmfence
            lib32-libelf lib32-libunwind lib32-lm_sensors glslang lib32-vulkan-icd-loader lib32-zstd lib32-llvm-libs-minimal-git
            lib32-spirv-tools lib32-systemd lib32-expat lib32-zlib lib32-libxcb lib32-libx11 lib32-glibc lib32-libxext)
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=(lib32-mesa lib32-vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vulkan lib32-vulkan-mesa-layers lib32-mesa-vdpau lib32-opengl-driver lib32-vulkan-driver)
conflicts=(lib32-mesa lib32-vulkan-intel lib32-vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vulkan lib32-vulkan-mesa-layers lib32-mesa-vdpau lib32-vulkan-nouveau)
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git'
                LICENSE
                llvm32.native
                llvm20-change-in-GetResourcesPath.patch #adjustment needed because of https://github.com/llvm/llvm-project/commit/924a7d83b4287b3b85dd1ca29d2d3e1f0a10ea68
)

md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '6b4a19068a323d7f90a3d3cd315ed1f9'
         '56d38c1a761737627c9faaaa063dd616')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'c7dbb390ebde291c517a854fcbe5166c24e95206f768cc9458ca896b2253aabd6df12a7becf831998721b2d622d0c02afdd8d519e77dea8e1d6807b35f0166fe'
            'e368e876955000273372c782e593501a865d40d1acf952d94e8b8e5ff8d3cc68c29d9cb190f20f4adbc4a9bb95e9dd77047d8d90f0aabcae565a70e49dac3bcf')
options=(!lto !debug)

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

prepare() {
    patch --directory mesa --strip=1 --forward --input="$srcdir"/llvm20-change-in-GetResourcesPath.patch
}

pkgver() {
    cd mesa
    read -r _ver <VERSION || [ -n "_ver" ]
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

    meson setup mesa _build \
        --native-file llvm32.native \
        -D b_ndebug=true \
        -D b_lto=false \
        -D buildtype=plain \
        --wrap-mode=nofallback \
        -D prefix=/usr \
        -D sysconfdir=/etc \
        --libdir=/usr/lib32 \
        -D platforms=x11,wayland \
        -D gallium-drivers=radeonsi,llvmpipe,zink,iris \
        -D vulkan-drivers=amd,swrast,intel \
        -D dri3=enabled \
        -D egl=enabled \
        -D gallium-extra-hud=true \
        -D vulkan-layers=device-select,overlay \
        -D gallium-nine=false \
        -D gallium-omx=disabled \
        -D gallium-opencl=disabled \
        -D gallium-va=enabled \
        -D gallium-vdpau=enabled \
        -D gallium-xa=disabled \
        -D gbm=enabled \
        -D gles1=disabled \
        -D gles2=enabled \
        -D glvnd=enabled \
        -D glx=dri \
        -D libunwind=enabled \
        -D llvm=enabled \
        -D lmsensors=enabled \
        -D osmesa=false \
        -D shared-glapi=enabled \
        -D valgrind=disabled \
        -D tools=[] \
        -D zstd=enabled \
        -D microsoft-clc=disabled \
        -D video-codecs=all

    meson configure  --no-pager _build
    
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
