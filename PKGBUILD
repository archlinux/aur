# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: Tavian Barnes <tavianator@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>
# Contributor: Diego Jose <diegoxter1006@gmail.com>

pkgbase=lib32-mesa-intel-iris-git
pkgname="${pkgbase}"
_branch=iris
pkgdesc="Mesa with Intel Iris (Gallium) Driver, 32bit git version"
pkgver=19.0.0_devel.107039.67b79e19e10
pkgrel=1
arch=('x86_64')
makedepends=('python-mako' 'lib32-libxml2' 'lib32-libx11' 'xorgproto'
             'lib32-gcc-libs' 'lib32-libvdpau' 'lib32-libelf' 'lib32-llvm-svn' 'git' 'lib32-libgcrypt' 'lib32-systemd'
             'mesa-git' 'lib32-llvm-libs-svn' 'lib32-libglvnd' 'wayland-protocols' 'lib32-wayland' 'meson' 'lib32-libva' 'lib32-libxrandr')
depends=('mesa-intel-iris-git' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-elfutils'
         'lib32-llvm-libs-svn' 'lib32-libunwind' 'lib32-lm_sensors')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=('lib32-mesa-git' 'lib32-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-opengl-driver')
conflicts=('lib32-mesa-git' 'lib32-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau')
url="https://www.mesa3d.org"
license=('custom')
source=("mesa::git+https://gitlab.freedesktop.org/kwg/mesa.git#branch=${_branch}"
        'LICENSE')

sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2')

pkgver() {
    cd mesa
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build () {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/pkg-config-32
    export LLVM_CONFIG=/usr/bin/llvm-config32

    meson setup mesa _build \
       -D b_ndebug=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       --libdir=/usr/lib32 \
       -D platforms=x11,wayland,drm,surfaceless \
       -D dri-drivers=i915,i965,r200,r100,nouveau \
       -D gallium-drivers=iris,r300,r600,radeonsi,nouveau,svga,swrast,virgl \
       -D vulkan-drivers=amd,intel \
       -D dri3=true \
       -D egl=true \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=disabled \
       -D gallium-opencl=disabled \
       -D gallium-va=true \
       -D gallium-vdpau=true \
       -D gallium-xa=true \
       -D gallium-xvmc=false \
       -D gbm=true \
       -D gles1=true \
       -D gles2=true \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=true \
       -D llvm=true \
       -D lmsensors=true \
       -D osmesa=gallium \
       -D shared-glapi=true \
       -D valgrind=false \
       -D tools=[] \
       -D CMAKE_C_FLAGS="$CFLAGS" \
       -D CMAKE_CXX_FLAGS="$CXXFLAGS"
    meson configure _build
    ninja -C _build
}

package_lib32-mesa-intel-iris-git () {
  DESTDIR="${pkgdir}" ninja -C _build install

  # remove files provided by mesa-git
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share/glvnd/
  rm -rf "${pkgdir}"/usr/share/drirc.d/

  # remove files present in lib32-libglvnd
  rm "${pkgdir}"/usr/lib32/libGLESv{1_CM,2}.so*

  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"
  install -Dt  "${pkgdir}"/usr/share/licenses/"${pkgbase}"/ -m644 "$srcdir"/LICENSE
}
