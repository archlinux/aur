# Maintainer: SovietReimu1228 <reimussr at protonmail dot ch>

pkgname=mesa-rusticl-git
pkgdesc="An open-source implementation of the OpenGL specification, with Rusticl"
pkgver=23.2.0_devel.169785.8adea15f913.d41d8cd98f00b204e9800998ecf8427e
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'libxml2' 'libx11' 'xorgproto' 'libdrm' 'libxshmfence' 'libxxf86vm'
             'libxdamage' 'libvdpau' 'libva' 'wayland' 'wayland-protocols' 'zstd' 'elfutils' 'llvm'
             'libomxil-bellagio' 'libclc' 'clang' 'libglvnd' 'libunwind' 'lm_sensors' 'libxrandr'
             'systemd' 'valgrind' 'glslang' 'vulkan-icd-loader' 'cmake' 'meson'
             'directx-headers-git' 'git' 'ninja' 
             'rust' 'rust-bindgen' 'spirv-tools' 'spirv-llvm-translator')
depends=('libdrm' 'libxcb' 'wayland' 'python'
         'libclc' 'clang' 'expat' 'spirv-llvm-translator'
         'wayland' 'libx11' 'libxshmfence' 'zstd' 'systemd-libs'
         'libelf' 'llvm-libs'
         'libunwind'
         'libxxf86vm' 'libxdamage' 'libomxil-bellagio' 'lm_sensors' 'libglvnd' 'vulkan-icd-loader')
optdepends=('opencl-headers: headers necessary for OpenCL development'
            'opengl-man-pages: for the OpenGL API man pages')
provides=('vulkan-mesa-layers' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
          'vulkan-mesa-layer' 'mesa-libgl' 'opencl-driver' 'vulkan-driver' 'libva-driver' 'vdpau-driver' 'opengl-driver')
conflicts=('vulkan-mesa-layers' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-virtio' 'libva-mesa-driver' 'mesa-vdpau' 'mesa'
           'vulkan-mesa-layer' 'vulkan-mesa' 'mesa-libgl')

url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/antoniospg100/mesa.git#branch=improvs_nir_copyto'
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

    # Vulkan microsoft-experimental disabled
    meson setup mesa _build \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D buildtype=release \
       -D b_ndebug=true \
       -D b_lto=true \
       -D platforms=auto \
       -D gallium-drivers=r300,r600,radeonsi,i915,crocus,iris,nouveau,d3d12,zink,svga,virgl,swrast \
       -D vulkan-drivers=amd,intel_hasvk,intel,virtio-experimental,swrast \
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
       -D gles1=enabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=true \
       -D shared-glapi=enabled \
       -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc \
       -D valgrind=disabled \
       -D gallium-rusticl=true \
       -D rust_std=2021 \
       -D opencl-spirv=true \
       -D shader-cache=enabled

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
