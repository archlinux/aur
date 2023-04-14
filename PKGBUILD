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
pkgname=('mesa-minimal-git' 'rusticl-mesa-minimal-git')
pkgdesc="an open-source implementation of the OpenGL specification, stripped down git version"
pkgver=23.2.0_devel.169840.bfce57c7a5b
pkgrel=1
arch=('x86_64')
makedepends=('git' 'meson' 'ninja' 'libglvnd' 'python-mako' 'xorgproto' 'libxml2' 'libx11'  'libva' 'elfutils' 'libxrandr'
              'wayland-protocols' 'glslang' 'llvm-minimal-git' 'libdrm' 'libclc-minimal-git' 'llvm-libs<16' 'rust' 'rust-bindgen' 'spirv-tools-git' 'spirv-llvm-translator-minimal-git' 'libvdpau')
# In order to keep the package simple and ease troubleshooting only use one llvm implementation
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'vulkan-swrast' 'mesa-vdpau' 'vulkan-driver' 'opengl-driver')
conflicts=('mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'vulkan-swrast' 'mesa-vdpau')
# mixing components from different mesa versions is a bad idea, conflict with everything unique provided by extra/mesa
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git'
                'LICENSE'
                '0001-gallivm-llvm17-deleted-includefiles.patch'
                '0002-fix-build-with-rust-bindgen-0.65+.patch'
)
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '942f95c6f7e795abd9df755b43cf0239'
         '4f2fad69745219180595fff70a9cdd07')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'ee81e9a1d23ff7265310da3231b7eebe1f6d49dd4c568781e2da0ac494e04ff074901cedc66e04c727eb120fad563db9693da509d69f738e3e2f108afc383c0a'
            'baf53a7af70d066d992ef3aec16eb81a9fb1b1e3fc86ea56ee66f8f1522ab5c7f0c0d01a9fbfe9fbbfa117d68e149eb218ff01df1c5080f597c37f20a25c9094')
options=(!emptydirs)

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {

    patch --directory="mesa" --forward --strip=1 --input="${srcdir}"/0001-gallivm-llvm17-deleted-includefiles.patch
    patch --directory="mesa" --forward --strip=1 --input="${srcdir}"/0002-fix-build-with-rust-bindgen-0.65+.patch

}

build () {
    
    meson setup mesa _build \
       -D b_ndebug=true \
       -D b_lto=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D rust_std=2021 \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D gallium-drivers=radeonsi,swrast,iris,zink,virgl \
       -D vulkan-drivers=amd,intel,swrast \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=false \
       -D gallium-omx=disabled \
       -D gallium-va=enabled \
       -D gallium-vdpau=enabled \
       -D gallium-xa=disabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=enabled \
       -D llvm=enabled \
       -D lmsensors=enabled \
       -D osmesa=false \
       -D shared-glapi=enabled \
       -D gallium-opencl=disabled \
       -D valgrind=disabled \
       -D vulkan-layers=device-select,overlay \
       -D tools=[] \
       -D zstd=enabled \
       -D microsoft-clc=disabled \
       -D video-codecs=vc1dec,h264dec,h264enc,h265dec,h265enc \
       -D gallium-rusticl=true \
       -D rust_std=2021

    meson configure --no-pager _build
    ninja $NINJAFLAGS -C _build
}

package_mesa-minimal-git() {
    depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
                        'libunwind' 'libglvnd' 'wayland' 'lm_sensors' 'vulkan-icd-loader' 'zstd' 'llvm-libs-minimal-git' 'systemd-libs')

    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"

    # rusticl files go to a separate package
    mkdir -p "$srcdir"/rusticl/{etc/OpenCL/vendors,usr/lib} 
    mv "$pkgdir"/etc/OpenCL/vendors/rusticl.icd "$srcdir"/rusticl/etc/OpenCL/vendors
    mv "$pkgdir"/usr/lib/libRusticlOpenCL* "$srcdir"/rusticl/usr/lib

    # indirect rendering
    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}

# I dislike splitting packages, but rusticl has several dependencies that are not needed by other mesa components
package_rusticl-mesa-minimal-git() {
    pkgdesc="OpenCL support in rust for mesa drivers (git version)"
    # In repos rusticl is combined with clover under opencl-mesa
    conflicts=(opencl-mesa)
    provides=(opencl-mesa opencl-driver)
    depends=(libdrm spirv-tools-git libclc-minimal-git mesa-minimal-git=$pkgver-$pkgrel)
    
    cp --preserve --recursive "$srcdir"/rusticl/* "$pkgdir"/
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
