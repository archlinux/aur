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

pkgname=mesa-amdonly-gaming-git
pkgdesc="an open-source implementation of the OpenGL specification, git version"
pkgver=23.1.0_devel.167746.399012a911b.932463d268438ce945b21718552d92ab
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python-mako' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libxrandr'
              'wayland-protocols' 'meson' 'ninja' 'glslang' 'libclc'
              'llvm' 'clang'
)
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libglvnd' 'wayland' 'lm_sensors' 'libclc' 'vulkan-icd-loader' 'zstd' 'expat' 'llvm-libs')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'opencl-mesa' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-swrast' 'vulkan-driver' 'mesa-libgl' 'opengl-driver' 'opencl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'mesa-vdpau' 'vulkan-swrast' 'mesa-libgl')
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main'
        '0002-intel-fs-always-mask-the-bottom-bits-of-the-sampler-.patch'
        'LICENSE')
md5sums=('SKIP'
         '094f900983f68bec0325bd29d4789ad5'
         '5c65a0fe315dd347e09b1f2826a1df5a')
sha512sums=('SKIP'
            '5dd0cb8affa9cfe6e7d94f59b8e23727036fd8ab76938321f8d266315f30611584da6f6277fe2aa920130483302adab5e57e2bc08f1bd3c62ea57b3e4b007305'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')

optdepends=('clang: opencl' 'compiler-rt: opencl')

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
    arch-meson mesa _build \
       -D b_ndebug=true \
       -D b_lto=false \
       -D platforms=x11,wayland \
       -D gallium-d3d12-video=disabled \
       -D gallium-drivers=radeonsi,swrast,zink \
       -D vulkan-drivers=amd,swrast \
       -D vulkan-beta=true\
       -D vulkan-layers=device-select,overlay \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=false \
       -D gallium-omx=bellagio \
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
       -D microsoft-clc=disabled \
       -D valgrind=disabled \
       -D tools=[] \
       -D zstd=enabled \
       -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc \
       --wrap-mode=nofallback \
       -D sysconfdir=/etc
    
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
