#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Lone_Wolf <lone_wolf@klaas-de-kat.nl> ---> For the base PKGBULD
#Credits: Laurent Carlier <lordheavym@gmail.com> ---> For the base PKGBUILD

#######################################

#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

#Set compiler
#Set '1' to use gcc
#Set '2' to use clang
#If not set is will build with gcc
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=lib32-mesa-stable
pkgdesc='An open-source implementation of the OpenGL specification. (32-bit) (stable release)'
pkgver=21.0.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://mesa3d.org/"
license=('MIT')
makedepends=('meson' 'ninja' 'bison' 'lib32-flex' 'python' 'python-mako' 'python-appdirs' 'python-evdev' 'lua' 'polly' 'valgrind'
             'xorgproto' 'wayland-protocols' 'glslang' 'libclc' 'elfutils' 'libarchive' 'libconfig' 'compiler-rt' 'lib32-libxcb'
             'lib32-wayland' 'lib32-libxml2' 'lib32-libx11' 'lib32-libvdpau' 'lib32-libelf' 'lib32-libglvnd' 'lib32-ncurses'
             'lib32-libva' 'lib32-libxrandr' 'lib32-expat' 'lib32-libdrm' 'lib32-libxvmc' 'lib32-libepoxy' 'lib32-libxv'
             'lib32-libxshmfence' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-zstd' 'lib32-lm_sensors' 'lib32-libunwind'
             'lib32-vulkan-icd-loader' 'lib32-llvm' 'lib32-llvm-libs' 'lib32-glibc' 'gcc' 'lib32-gcc-libs')
depends=('lib32-libdrm' 'lib32-libxcb' 'lib32-wayland' 'python' 'libclc' 'lib32-libx11' 'lib32-libxshmfence' 'lib32-zstd' 'lib32-libelf'
         'lib32-llvm-libs' 'lib32-expat' 'lib32-libxxf86vm' 'lib32-libxdamage' 'lib32-libunwind' 'lib32-lm_sensors' 'lib32-libglvnd'
         'lib32-vulkan-icd-loader' 'lib32-llvm' 'lib32-clang' 'lib32-gcc-libs' 'gcc' 'glslang' 'vulkan-mesa-layers' 'opencl-mesa' 'mesa')
conflicts=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-vulkan-mesa' 'lib32-vulkan-swrast'
           'lib32-vulkan-mesa-layers' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-mesa-rc' 'lib32-mesa-git')
provides=('lib32-mesa' 'lib32-opencl-mesa' 'lib32-vulkan-intel' 'lib32-vulkan-radeon' 'lib32-vulkan-swrast' 'lib32-vulkan-driver'
          'lib32-vulkan-mesa-layers' 'lib32-libva-mesa-driver' 'lib32-mesa-vdpau' 'lib32-opengl-driver' 'lib32-opencl-driver' 'lib32-mesa-libgl')
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
  export CC='gcc -m32'
  export CXX='g++ -m32'
elif [[ $_compiler = "2" ]]; then
  export CC='clang -m32'
  export CXX='clang++ -m32'
else
  export CC='gcc -m32'
  export CXX='g++ -m32'
fi

  cd mesa-$pkgver

cat >crossfile.ini <<END
[binaries]
llvm-config = '/usr/bin/llvm-config32'
END

  rm -rf -v build_32

  mkdir -p -v build_32

  meson setup build_32/ \
  --native-file crossfile.ini \
  -D b_ndebug=true \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -Dprefix=/usr \
  -D sysconfdir=/etc \
  --libdir=/usr/lib32 \
  -Dplatforms=x11,wayland \
  -Ddri3=enabled \
  -Ddri-drivers=i915,i965,r100,r200,nouveau \
  -Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink \
  -Dgallium-extra-hud=true \
  -Dgallium-vdpau=enabled \
  -Dgallium-xvmc=enabled \
  -Dgallium-omx=disabled \
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
  -Dvalgrind=disabled \
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

  meson configure build_32/

  meson compile -C build_32/

  ninja -C build_32/
}

package_lib32-mesa-stable(){
  # compiling mesa and installing to "$pkgdir"
  DESTDIR="${pkgdir}" ninja -C mesa-$pkgver/build_32/ install

  #Remove files provided by standard mesa build
  rm -rf -v "$pkgdir"/etc
  rm -rf -v "$pkgdir"/usr/include
  rm -rf -v "$pkgdir"/usr/share/glvnd
  rm -rf -v "$pkgdir"/usr/share/drirc.d
  rm -rf -v "$pkgdir"/usr/share/freedreno
  rm -rf -v "$pkgdir"/usr/share/vulkan/explicit_layer.d
  rm -rf -v "$pkgdir"/usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
  rm -rf -v "$pkgdir"/usr/share/vulkan/implicit_layer.d
  rm -rf -v "$pkgdir"/usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json

  # remove script file from /usr/bin
  rm -v "${pkgdir}/usr/bin/mesa-overlay-control.py"
  rm -rf -v "${pkgdir}/usr/bin"

  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"

  # installing license
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" -m644 LICENSE
}
