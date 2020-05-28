# Maintainer:  John Schoenick <johns@valvesoftware.com>
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

pkgname=mesa-aco-git
pkgdesc="Mesa with the ACO compiler patchset, git version"
pkgver=20.1.0_rc4.20200527.648768b32a6
pkgrel=10
arch=('x86_64')
makedepends=('git' 'python-mako' 'xorgproto'
              'libxml2' 'libx11'  'libvdpau' 'libva' 'elfutils' 'libomxil-bellagio' 'libxrandr'
              'ocl-icd' 'libgcrypt'  'wayland' 'wayland-protocols' 'meson' 'ninja')
depends=('libdrm' 'libxxf86vm' 'libxdamage' 'libxshmfence' 'libelf'
         'libomxil-bellagio' 'libunwind' 'libglvnd>=1.2' 'wayland' 'lm_sensors' 'libclc' 'glslang' 'vulkan-icd-loader' 'zstd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=("mesa=$pkgver-$pkgrel"
          "opencl-mesa=$pkgver-$pkgrel"
          "mesa-git=$pkgver-$pkgrel"
          "vulkan-intel=$pkgver-$pkgrel"
          "vulkan-radeon=$pkgver-$pkgrel"
          "libva-mesa-driver=$pkgver-$pkgrel"
          "mesa-vdpau=$pkgver-$pkgrel"
          "vulkan-driver=$pkgver-$pkgrel"
          "opencl-mesa=$pkgver-$pkgrel"
          # mesa-vulkan-layer was renamed as it was brought in from AUR
          "mesa-vulkan-layer=$pkgver-$pkgrel"
          "vulkan-mesa-layer=$pkgver-$pkgrel"
          "opengl-driver"
          "opencl-driver"
          "mesa-libgl=$pkgver-$pkgrel")
conflicts=('mesa' 'mesa-git' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'libva-mesa-driver' 'mesa-vdpau' 'mesa-vulkan-layer' 'vulkan-mesa-layer')
url="https://www.mesa3d.org"
license=('custom')
source=('mesa-aco::git+https://github.com/daniel-schuermann/mesa'
        'LICENSE'
        'mesa-headers.patch'
        '0001-spirv-radv-anv-implement-no-op-VK_GOOGLE_user_type.patch')

sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'f83d52292f9b5144fc2f5b568cfb1d4bdebd37b877d34d9002335d79f66612123001c36a9615ed13f474771002672f2a445a89f3220d16b962e17087b6111644'
            '0bbc44131ba0f682caa9da0d61497272768ca98655e1df698580aee8fa66a61ed33193281e5ede8953b541cfd6a68c6c9cd51ff5c445830a21a5cb0dc8d7c09d')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# Users of alternative llvm packages may need to tweak the hard version dependency here, which ensures this package is
# rebuilt if the underlying llvm updates.
makedepends+=('llvm>=10.0.0' 'llvm<10.1' 'clang>=10.0.0' 'clang<10.1')
depends+=('llvm-libs>=10.0.0' 'llvm-libs<10.1')
# LLVM NOTE: The upstream mesa-git package provides these alternative suggestions.  Really, these packages should all
#            have the necessary provides to make selecting these manually here unnecessary, and we've disabled them
#            because they break aurhelpers such as yay.
#

### NOTE: Aur helpers don't handle this method well, check the sticky comments on mesa-git aur page .
###
### 1: llvm-minimal-git (aur) preferred value
### 2: AUR llvm-git
### 3: llvm-git from LordHeavy unofficial repo 
### 4  llvm (stable from extra) Default value
### 
##
##if [[ ! $MESA_WHICH_LLVM ]] ; then
##    MESA_WHICH_LLVM=4
##fi
##
##case $MESA_WHICH_LLVM in
##    1)
##        # aur llvm-minimal-git
##        makedepends+=('llvm-minimal-git')
##        depends+=('llvm-libs-minimal-git')
##        optdepends+=('llvm-minimal-git: opencl')
##        ;;
##    2)
##        # aur llvm-git
##        # depending on aur-llvm-* to avoid mixup with LH llvm-git
##        makedepends+=('aur-llvm-git')
##        depends+=('aur-llvm-libs-git')
##        optdepends+=('llvm-git: opencl')
##        ;;
##    3)
##        # mesa-git/llvm-git (lordheavy unofficial repo)
##        makedepends+=('llvm-git' 'clang-git')
##        depends+=('llvm-libs-git')
##        optdepends+=('clang-git: opencl' 'compiler-rt: opencl')
##        ;;
##    4)
##        # extra/llvm
##        makedepends+=(llvm=10.0.0 clang=10.0.0)
##        depends+=(llvm-libs=10.0.0)
##        optdepends+=('clang: opencl' 'compiler-rt: opencl')
##        ;;
##    *)
##esac
        
        
        
        
        
pkgver() {
    cd mesa-aco
    read -r _ver <VERSION
    echo ${_ver/-/_}.$(git log -n1 --format="%cd" --date=format:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    # although removing _build folder in build() function feels more natural,
    # that interferes with the spirit of makepkg --noextract
    if [  -d _build ]; then
        rm -rf _build
    fi

    cd "$srcdir"/mesa-aco

    # Apply this until ACO is rebased and contains it
    if ! git show b57fa7ca49f7ddb67ac47f392de05af388e73565 &>/dev/null; then
      patch -Np1 -i "$srcdir"/mesa-headers.patch
    fi

    # Path of Exile fix, similarly pull forward until ACO rebase
    if ! git show 10c4a7cf59733ae2058a76b880ea0767a59dad4f &>/dev/null; then
      patch -Np1 -i "$srcdir"/0001-spirv-radv-anv-implement-no-op-VK_GOOGLE_user_type.patch
    fi
}

build () {
    meson setup mesa-aco _build \
       -D b_ndebug=true \
       -D b_lto=true \
       -D buildtype=plain \
       --wrap-mode=nofallback \
       -D prefix=/usr \
       -D sysconfdir=/etc \
       -D platforms=x11,wayland,drm,surfaceless \
       -D dri-drivers=i915,i965,r200,r100,nouveau \
       -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl,iris,zink \
       -D vulkan-drivers=amd,intel \
       -D dri3=true \
       -D egl=true \
       -D gallium-extra-hud=true \
       -D gallium-nine=true \
       -D gallium-omx=bellagio \
       -D gallium-va=true \
       -D gallium-vdpau=true \
       -D gallium-xa=true \
       -D gallium-xvmc=false \
       -D gbm=true \
       -D gles1=false \
       -D gles2=true \
       -D glvnd=true \
       -D glx=dri \
       -D libunwind=true \
       -D llvm=true \
       -D lmsensors=true \
       -D osmesa=gallium \
       -D shared-glapi=true \
       -D gallium-opencl=icd \
       -D valgrind=false \
       -D vulkan-overlay-layer=true \
       -D vulkan-device-select-layer=true \
       -D tools=[] \
       -D zstd=true \
       
    meson configure _build
    
    # quoted from https://www.mesa3d.org/meson.html
    # Note: autotools automatically updated translation files (used by the DRI configuration tool) as part of the build process, Meson does not do this. 
    # Instead, you will need do this: 
    ninja $NINJAFLAGS -C _build xmlpool-pot xmlpool-update-po xmlpool-gmo
    #
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
  
    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
