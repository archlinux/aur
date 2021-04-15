#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Lone_Wolf <lone_wolf@klaas-de-kat.nl> ---> For the base PKGBULD
#Credits: Laurent Carlier <lordheavym@gmail.com> ---> For the base PKGBUILD

#######################################

#Enable llvm by default
#Set 'y' to enable
#Default is set to empty, so no llvm by default patch
if [ -z ${_llvm+x} ]; then
  _llvm=
fi

#######################################

#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=mesa-stable
pkgdesc='An open-source implementation of the OpenGL specification. (stable release)'
pkgver=21.0.2
pkgrel=1
arch=('x86_64')
url="https://mesa3d.org/"
license=('MIT')
makedepends=('meson' 'ninja' 'bison' 'flex' 'python' 'python-mako' 'python-appdirs' 'python-evdev' 'lua' 'polly' 'valgrind'
             'xorgproto' 'wayland-protocols' 'glslang' 'libclc' 'elfutils' 'libarchive' 'libconfig' 'compiler-rt' 'libxcb'
             'wayland' 'libxml2' 'libx11' 'libvdpau' 'libelf' 'libglvnd' 'ncurses' 'libva' 'libxrandr' 'expat' 'libdrm' 'libxvmc'
             'libepoxy' 'libxv' 'libxshmfence' 'libxxf86vm' 'libxdamage' 'zstd' 'lm_sensors' 'libunwind' 'vulkan-icd-loader'
             'llvm' 'clang' 'llvm-libs' 'glibc' 'gcc' 'gcc-libs' 'libomxil-bellagio')
depends=('libdrm' 'libxcb' 'wayland' 'python' 'libclc' 'clang' 'libx11' 'libxshmfence' 'zstd' 'libelf' 'llvm-libs' 'expat' 'libxxf86vm'
         'libxdamage' 'libomxil-bellagio' 'libunwind' 'lm_sensors' 'libglvnd' 'vulkan-icd-loader' 'llvm' 'clang' 'gcc-libs' 'gcc'
         'glslang')
#depends+=('libsensors.so' 'libexpat.so' 'libvulkan.so')
conflicts=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-mesa' 'vulkan-swrast' 'vulkan-mesa-layers' 'libva-mesa-driver' 'mesa-vdpau'
           'mesa-rc' 'mesa-git')
provides=('mesa' 'opencl-mesa' 'vulkan-intel' 'vulkan-radeon' 'vulkan-swrast' 'vulkan-driver' 'vulkan-mesa-layers' 'libva-mesa-driver' 'mesa-vdpau'
          'opengl-driver' 'opencl-driver' 'mesa-libgl')
source=("https://archive.mesa3d.org/mesa-$pkgver.tar.xz"
        "LICENSE")
md5sums=("SKIP"
         "SKIP")
if [[ $_llvm = "y" ]]; then
  source+=("0001-enable-llvm-by-default.patch")
  md5sums+=("SKIP") #0001-enable-llvm-by-default.patch
fi
# clover patch for llvm 12.0.0 and 13.0.0. Not commited in master branch for now
source+=("0001-4114.patch"
         "0001-4200.patch")
md5sums+=("SKIP"
          "SKIP")

prepare(){
  cd mesa-$pkgver

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build(){
if [[ $_compiler = "1" ]]; then
  export CC='gcc'
  export CXX='g++'
elif [[ $_compiler = "2" ]]; then
  export CC='clang'
  export CXX='clang++'
else
  export CC='gcc'
  export CXX='g++'
fi

  cd mesa-$pkgver

  rm -rf -v build_64

  mkdir -p -v build_64

  meson setup build_64/ \
  -D b_ndebug=true \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -Dprefix=/usr \
  -D sysconfdir=/etc \
  -Dplatforms=x11,wayland \
  -Ddri3=enabled \
  -Ddri-drivers=i915,i965,r100,r200,nouveau \
  -Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink \
  -Dgallium-extra-hud=true \
  -Dgallium-vdpau=enabled \
  -Dgallium-xvmc=enabled \
  -Dgallium-omx=bellagio \
  -Dgallium-va=enabled \
  -Dgallium-xa=enabled \
  -Dgallium-nine=true \
  -Dgallium-opencl=icd \
  -Dopencl-spirv=false \
  -Dopencl-native=true \
  -Dvulkan-drivers=amd,intel,swrast \
  -Dshader-cache=enabled \
  -Dvulkan-overlay-layer=true \
  -Dvulkan-device-select-layer=true \
  -Dshared-glapi=enabled \
  -Dgles1=enabled \
  -Dgles2=enabled \
  -Dopengl=true \
  -Dgbm=enabled \
  -Dglx=dri \
  -Degl=enabled \
  -Dglvnd=true \
  -Dmicrosoft-clc=disabled \
  -Dspirv-to-dxil=false \
  -Dllvm=enabled \
  -Dshared-llvm=enabled \
  -Dvalgrind=enabled \
  -Dlibunwind=enabled \
  -Dlmsensors=enabled \
  -Dselinux=false \
  -Dosmesa=true \
  -Dswr-arches=avx,avx2,knl,skx \
  -Dshared-swr=true \
  -Dxlib-lease=enabled \
  -Dglx-direct=true \
  -Dzstd=enabled \
  -Dzlib=enabled \
  -Dsse2=false

  meson configure build_64/

  meson compile -C build_64/

  ninja -C build_64/
}

package_mesa-stable(){
  # compiling mesa and installing to "$pkgdir"
  DESTDIR="${pkgdir}" ninja -C mesa-$pkgver/build_64/ install

  # remove script file from /usr/bin
  rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
  rm -rf -v "${pkgdir}/usr/bin"

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

  # installing license
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" -m644 LICENSE
}
