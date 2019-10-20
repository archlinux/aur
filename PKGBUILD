# Maintainer:  John Schoenick <johns@valvesoftware.com>
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

pkgname=lib32-mesa-aco-git
pkgdesc="Mesa with the ACO compiler patchset, git version"
pkgver=19.3.0_devel.20191017.fe930ad92ab
pkgrel=8
arch=('x86_64')
makedepends=('python-mako' 'lib32-libxml2' 'lib32-libx11' 'xorgproto'
             'lib32-gcc-libs' 'lib32-libvdpau' 'lib32-libelf' 'git' 'lib32-libgcrypt' 'lib32-systemd'
             'mesa' 'lib32-libglvnd>=1.2' 'wayland-protocols' 'lib32-wayland' 'meson' 'lib32-libva' 'lib32-libxrandr')
depends=('mesa' 'lib32-gcc-libs' 'lib32-libdrm' 'lib32-wayland' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libxshmfence' 'lib32-elfutils'
         'lib32-libunwind' 'lib32-lm_sensors' 'glslang')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
provides=("lib32-mesa=$pkgver-$pkgrel"
          "lib32-mesa-git=$pkgver-$pkgrel"
          "lib32-vulkan-intel=$pkgver-$pkgrel"
          "lib32-vulkan-radeon=$pkgver-$pkgrel"
          "lib32-libva-mesa-driver=$pkgver-$pkgrel"
          "lib32-vulkan-mesa-layer=$pkgver-$pkgrel"
          "lib32-mesa-vdpau=$pkgver-$pkgrel"
          'lib32-opengl-driver'
          "lib32-mesa-libgl=$pkgver-$pkgrel")
conflicts=('lib32-mesa' 'lib32-mesa-git' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-vulkan-mesa-layer')
url="https://www.mesa3d.org"
license=('custom')
source=('mesa-aco::git+https://github.com/daniel-schuermann/mesa'
        'LICENSE'
        'llvm32.native'
        'mesa-headers.patch')
sha512sums=('SKIP'
            '25da77914dded10c1f432ebcbf29941124138824ceecaf1367b3deedafaecabc082d463abcfa3d15abff59f177491472b505bcb5ba0c4a51bb6b93b4721a23c2'
            'c7dbb390ebde291c517a854fcbe5166c24e95206f768cc9458ca896b2253aabd6df12a7becf831998721b2d622d0c02afdd8d519e77dea8e1d6807b35f0166fe'
            'f83d52292f9b5144fc2f5b568cfb1d4bdebd37b877d34d9002335d79f66612123001c36a9615ed13f474771002672f2a445a89f3220d16b962e17087b6111644')

# NINJAFLAGS is an env var used to pass commandline options to ninja
# NOTE: It's your responbility to validate the value of $NINJAFLAGS. If unsure, don't set it.

# Users of alternative llvm packages may need to tweak the hard version dependency here, which ensures this package is
# rebuilt if the underlying llvm updates.
makedepends+=('lib32-llvm>=9.0.0' 'lib32-llvm<9.1')
depends+=('lib32-llvm-libs>=9.0.0' 'lib32-llvm-libs<9.1')

# LLVM NOTE: The upstream mesa-git package provides these alternative suggestions.  Really, these packages should all
#            have the necessary provides to make selecting these manually here unnecessary, and we've disabled them
#            because they break aurhelpers such as yay.
#
## MESA_WHICH_LLVM is an environment variable used to determine which llvm package tree is used to built mesa-git against.
## Adding a line to makepkg.conf that sets this value is the simplest way to ensure a specific choice.
##
## 1: llvm-minimal-git (aur) preferred value
## 2: llvm-git (aur)
## 3  llvm-git (lordheavy unoffical repo)
## 4  llvm (stable from extra) default value
##
## N.B. make sure lib32-mesa-git uses same value for this as mesa-git to avoid problems !
##
###if [[ ! $MESA_WHICH_LLVM ]] ; then
###    MESA_WHICH_LLVM=4
###fi
###
###case $MESA_WHICH_LLVM in
###    1)
###        # aur lone_wolf-llvm-git
###        makedepends+=('lib32-llvm-minimal-git')
###        depends+=('lib32-llvm-libs-minimal-git')
###        ;;
###    2)
###        # aur llvm-git
###        # depending on aur-lib32-llvm-* to avoid mixup with LH llvm-git
###        makedepends+=('aur-lib32-llvm-git')
###        depends+=('aur-lib32-llvm-libs-git')
###        ;;
###    3)
###        # mesa-git/llvm-git (lordheavy unofficial repo)
###        makedepends+=('lib32-llvm-git')
###        depends+=('lib32-llvm-libs-git')
###        ;;
###    4)
###        # extra/llvm
###        makedepends+=(lib32-llvm=8.0.0)
###        depends+=(lib32-llvm-libs=8.0.0)
###        ;;
###    *)
###esac


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
}

build () {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

    meson setup mesa-aco _build \
        --native-file llvm32.native \
        -D b_ndebug=true \
        -D buildtype=plain \
        --wrap-mode=nofallback \
        -D prefix=/usr \
        -D sysconfdir=/etc \
        --libdir=/usr/lib32 \
        -D platforms=x11,wayland,drm,surfaceless \
        -D dri-drivers=i915,i965,r200,r100,nouveau \
        -D gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast,virgl,iris \
        -D vulkan-drivers=amd,intel \
        -D dri3=true \
        -D egl=true \
        -D gallium-extra-hud=true \
        -D vulkan-overlay-layer=true \
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

  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"
  install -Dt  "$pkgdir"/usr/share/licenses/$pkgbase/ -m644 "$srcdir"/LICENSE
}
