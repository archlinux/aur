# Maintainer: SovietReimu1228 <reimussr at protonmail dot ch>

pkgname=mesa-rusticl-git
pkgdesc="An open-source implementation of the OpenGL specification, with Rusticl"
pkgver=23.0.0_devel.163990.bc60eca1d95.d41d8cd98f00b204e9800998ecf8427e
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence' 'libxxf86vm'
             'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols' 'zstd' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors' 'libxrandr'
             'systemd' 'valgrind' 'glslang' 'vulkan-icd-loader' 'cmake' 'meson'
             'git' 'ninja'
             'directx-headers-git' 'rust' 'rust-bindgen')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 'libclc' 'vulkan-icd-loader' 'zstd' 'expat'
         'libxcb' 'python' 'libclc' 'clang' 'libx11' 'systemd-libs' 'llvm-libs' 'compiler-rt'
         'spirv-llvm-translator')
optdepends=('opencl-headers: headers necessary for OpenCL development'
            'opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'opencl-mesa' 'vulkan-radeon' 'vulkan-intel' 'vulkan-swrast' 'vulkan-mesa-layers' 'libva-mesa-driver' 'mesa-vdpau'
          'vulkan-mesa-layer' 'mesa-libgl' 'opengl-driver' 'opencl-driver' 'vulkan-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-radeon' 'vulkan-intel' 'vulkan-swrast' 'vulkan-mesa-layers' 'libva-mesa-driver' 'mesa-vdpau'
           'vulkan-mesa-layer' 'mesa-libgl' 'vulkan-mesa')

url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/karolherbst/mesa.git#branch=rusticl/si'
        'LICENSE'
#        'zink_hack.patch'
        )
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
#         'b583d7eef8e4835f6e6acbbe7caf7b7e'
         )
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
#            '1f8c1fa1071fc00b7af67ea979ea8d5ddcaca8f28f14a58ecbccdfc784049f75092f6c69d5cd228ec100a7060f439b0bc278f2b02b32a9f51795993da18f0d65'
            )

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
    export CC="clang"
    export CXX="clang++"

    meson setup mesa _build \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D buildtype=release \
       -D b_lto=true \
       -D b_ndebug=true \
       -D platforms=auto \
       -D gallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,crocus,i915,zink,d3d12 \
       -D vulkan-drivers=amd,intel,intel_hasvk,swrast,virtio-experimental,microsoft-experimental \
       -D vulkan-layers=device-select,intel-nullhw,overlay \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=bellagio \
       -D gallium-va=enabled \
       -D gallium-vdpau=enabled \
       -D gallium-xa=enabled \
       -D gbm=enabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D lmsensors=enabled \
       -D osmesa=true \
       -D shared-glapi=enabled \
       -D valgrind=disabled \
       -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc \
       -D gallium-rusticl=true \
       -D opencl-spirv=true \
       -D shader-cache=enabled \
       -D llvm=enabled \
       -D rust_std=2021

    meson configure --no-pager _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
