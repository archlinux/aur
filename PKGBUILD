# Maintainer:  Vincent Grande <shoober420@gmail.com>
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

pkgname=mesa-minimal+-git
pkgdesc="an open-source implementation of the OpenGL specification, stripped down git version"
pkgver=21.0.0_devel.133218.b634d7f3e2b
pkgrel=1
arch=('x86_64')
makedepends=('git' 'python-mako' 'xorgproto'
             'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libxrandr'
             'ocl-icd' 'wayland-protocols' 'meson' 'ninja' 'glslang' 'llvm')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libglvnd' 'wayland' 'vulkan-icd-loader' 'zstd' 'llvm-libs')
# In order to keep the package simple and ease troubleshooting only use one llvm implementation
optdepends=('opengl-man-pages: for the OpenGL API man pages'
            'llvm-minimal-git: opencl'
            'libclc: opencl')
provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver' 'vulkan-swrast' 'vulkan-driver' 'opengl-driver' 'opencl-driver')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa-layer' 'libva-mesa-driver'  'vulkan-swrast' 'mesa-vdpau')
# mixing components from different mesa versions is a bad idea, conflict with everything unique provided by extra/mesa
url="https://www.mesa3d.org"
license=('custom')
source=('mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git'
        'LICENSE')
sha512sums=('SKIP'
            'SKIP')

# ninja grabs all available cores and leaves almost nothing for other processes.
# this package uses the environment variable NINJAFLAGS to allow the user to change this behaviour
# The responsibility to validate the value of NINJAFLAGS lies with the user.
# If unsure, use NINJAFLAGS=""

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
    MESA_WHICH_LLVM=1
fi

case $MESA_WHICH_LLVM in
    1)
        # aur lone_wolf-llvm-git
        makedepends+=('llvm-minimal-git')
        depends+=('llvm-libs-minimal-git')
        ;;
    2)
        # aur llvm-git
        # depending on aur-lib32-llvm-* to avoid mixup with LH llvm-git
        makedepends+=('aur-llvm-git')
        depends+=('aur-llvm-libs-git')
        ;;
    3)
        # mesa-git/llvm-git (lordheavy unofficial repo)
        makedepends+=('llvm-git')
        depends+=('llvm-libs-git')
        ;;
    4)
        # extra/llvm
        makedepends+=(llvm=11.1.0)
        depends+=(llvm-libs=11.1.0)
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

  cd mesa
  patch --forward --strip=1 --input="${srcdir}/0001-clover-llvm13-use-FixedVectorType.patch"
}

build () {
    meson setup mesa _build \
       -D b_ndebug=false \
       -D b_lto=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland \
       -D dri-drivers=[] \
       -D gallium-drivers=radeonsi,swrast,iris,zink \
       -D vulkan-drivers=amd,intel,swrast \
       -D dri3=enabled \
       -D egl=enabled \
       -D gallium-extra-hud=true \
       -D gallium-nine=false \
       -D gallium-omx=disabled \
       -D gallium-va=enabled \
       -D gallium-vdpau=disabled \
       -D gallium-xa=disabled \
       -D gallium-xvmc=disabled \
       -D gbm=enabled \
       -D gles1=disabled \
       -D gles2=enabled \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=disabled \
       -D llvm=enabled \
       -D lmsensors=disabled \
       -D osmesa=false \
       -D shared-glapi=enabled \
       -D gallium-opencl=disabled \
       -D valgrind=disabled \
       -D vulkan-layers=device-select,overlay \
       -D tools=[] \
       -D zstd=enabled \
       -D microsoft-clc=disabled \
       -D selinux=false \
       -D sse2=true \
       -D debug=false \
       -D enable-glcpp-tests=false \
       -D opencl-native=false

    meson configure _build
    
    ninja $NINJAFLAGS -C _build
}

package() {
    DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C _build install

    # remove script file from /usr/bin
    # https://gitlab.freedesktop.org/mesa/mesa/issues/2230
    rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
    rmdir "${pkgdir}/usr/bin"
    
    # indirect rendering
#    ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"
  
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
