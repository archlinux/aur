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

#Set compiler
#Set '1' to use gcc
#Set '2' to use clang
#If not set is will build with gcc
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#Set compiler optimization for GCC
#Set '1' to use optimization
#Set '2' to disable optimization
#If not set is will build with no optimization
if [ -z ${_optimization+x} ]; then
  _optimization=
fi

#This set lto/pgo value for GCC or CLANG
#For now LTO/PGO is turn off for CLANG because of build issues
#Do not eddit unless you know what you are doing
if [[ $_compiler = "1" ]]; then
  if [[ $_optimization = "1" ]]; then
    lto1=false
    pgo1=generate
    lto2=true
    pgo2=use
  elif [[ $_optimization = "2" ]]; then
    lto1=false
    pgo1=off
    lto2=false
    pgo2=off
  else
    lto1=false
    pgo1=off
    lto2=false
    pgo2=off
  fi
elif [[ $_compiler = "2" ]]; then
  lto1=false
  pgo1=off
  lto2=false
  pgo2=off
else
  lto1=false
  pgo1=generate
  lto2=true
  pgo2=use
fi

#######################################

#Build lib32 package
#Set 'y' to build lib32
#Set 'n' to not build lib32
#Default is set to empty
if [ -z ${_lib32+x} ]; then
  _lib32=
fi

#######################################

pkgbase=mesa-stable
pkgname=("${pkgbase}" "lib32-${pkgbase}")
pkgver=20.3.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://mesa3d.org/"
license=('MIT')
makedepends=("bison" "flex" "valgrind" "meson" "ninja" "git" "ninjas2" "libxvmc" "python" "python-appdirs" "python-mako" "python-evdev" "elfutils"
             "glslang" "libva" "libepoxy" "libxv" "libvdpau" "libx11" "libxml2" "libxrandr" "llvm" "libconfig" "gtk3" "wayland-protocols" "xorgproto"
             "lua" "polly" "gcc" "gcc-libs" "ncurses" "libarchive" "libclc" "vulkan-icd-loader" "clang" "compiler-rt" "glibc" "ocl-icd")
# Makedepend for lib32
makedepends+=("lib32-flex" "lib32-libxvmc" "lib32-libva" "lib32-libepoxy" "lib32-libxv" "lib32-libvdpau" "lib32-libx11" "lib32-libxml2"
             "lib32-libxrandr" "lib32-llvm" "lib32-gtk3" "lib32-gcc-libs" "lib32-ncurses" "lib32-vulkan-icd-loader" "lib32-clang" "lib32-glibc" "lib32-ocl-icd")
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

  cd mesa-$pkgver

  # remove build dir if there is one
  if dir build_64; then
    rm -rf -v build_64
  fi

  # create build dir
  mkdir -p -v build_64

if [[ $_compiler = "1" ]]; then
  export CC='gcc -m64'
  export CXX='g++ -m64'
elif [[ $_compiler = "2" ]]; then
  export CC='clang -m64'
  export CXX='clang++ -m64'
else
  export CC='gcc -m64'
  export CXX='g++ -m64'
fi

  # build with meson
  meson setup build_64/ \
  -D b_ndebug=true \
  -D b_lto=$lto1 \
  -D b_pgo=$pgo1 \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -Dc_args="-Ofast -m64" \
  -Dcpp_args="-Ofast -m64" \
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
  -Dllvm=enabled \
  -Dshared-llvm=enabled \
  -Dvalgrind=enabled \
  -Dlibunwind=enabled \
  -Dlmsensors=enabled \
  -Dselinux=false \
  -Dosmesa=gallium \
  -Dswr-arches=avx,avx2,knl,skx \
  -Dshared-swr=true \
  -Dxlib-lease=enabled \
  -Dglx-direct=true \
  -Dzstd=enabled

  meson configure build_64/

  meson compile -C build_64/

  ninja -C build_64/

  # build with meson
  meson configure build_64/ \
  -D b_lto=$lto2 \
  -D b_pgo=$pgo2

  meson configure build_64/

  meson compile -C build_64/

  ninja -C build_64/

  # remove build dir if there is one
  if dir build_32; then
    rm -rf -v build_32
  fi

  # create build dir
  mkdir -p -v build_32

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
export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config
cat >crossfile.ini <<END
[binaries]
llvm-config = '/usr/bin/llvm-config32'
END

  # build with meson
  meson setup build_32/ \
  --native-file crossfile.ini \
  -D b_ndebug=true \
  -D b_lto=$lto1 \
  -D b_pgo=$pgo1 \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -Dprefix=/usr \
  -D sysconfdir=/etc \
  --libdir=/usr/lib32 \
  -Dc_args="-Ofast -m32" \
  -Dcpp_args="-Ofast -m32" \
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
  -Dllvm=enabled \
  -Dshared-llvm=enabled \
  -Dvalgrind=disabled \
  -Dlibunwind=enabled \
  -Dlmsensors=enabled \
  -Dselinux=false \
  -Dosmesa=gallium \
  -Dswr-arches=avx,avx2,knl,skx \
  -Dshared-swr=true \
  -Dxlib-lease=enabled \
  -Dglx-direct=true \
  -Dzstd=enabled

  meson configure build_32/

  meson compile -C build_32/

  ninja -C build_32/

  # build with meson
  meson configure build_32/ \
  -D b_lto=$lto2 \
  -D b_pgo=$pgo2

  meson configure build_32/

  meson compile -C build_32/

  ninja -C build_32/
}

package_mesa-stable(){
  pkgdesc="An open-source implementation of the OpenGL specification. (64-bit) (stable release)"
  depends=("libdrm" "libelf" "libglvnd" "libomxil-bellagio" "libunwind" "libxdamage" "libxxf86vm" "llvm-libs" "lm_sensors" "wayland" "zstd" "libxshmfence"
           "libclc" "expat" "vulkan-icd-loader")
  conflicts=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-mesa" "vulkan-swrast" "vulkan-mesa-layers" "libva-mesa-driver" "mesa-vdpau" "mesa-rc" "mesa-git")
  provides=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-swrast" "vulkan-driver" "vulkan-mesa-layers" "libva-mesa-driver" "mesa-vdpau" "opengl-driver" "opencl-driver"
            "mesa-libgl")

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

package_lib32-mesa-stable(){
   pkgdesc="An open-source implementation of the OpenGL specification. (32-bit) (stable release)"
   depends=("lib32-libdrm" "lib32-libelf" "lib32-libglvnd" "libomxil-bellagio" "lib32-libunwind" "lib32-libxdamage" "lib32-libxxf86vm" "lib32-llvm-libs"
            "lib32-lm_sensors" "lib32-wayland" "lib32-zstd" "lib32-libxshmfence" "libclc" "lib32-expat" "lib32-vulkan-icd-loader")
   conflicts=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-mesa" "lib32-vulkan-swrast" "lib32-vulkan-mesa-layers" "lib32-libva-mesa-driver" "lib32-mesa-vdpau"
              "lib32-mesa-rc" "lib32-mesa-git")
   provides=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-swrast" "lib32-vulkan-driver" "lib32-vulkan-mesa-layers" "lib32-libva-mesa-driver"
             "lib32-mesa-vdpau" "lib32-opengl-driver" "lib32-opencl-driver" "lib32-mesa-libgl")

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
