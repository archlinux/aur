#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Lone_Wolf <lone_wolf@klaas-de-kat.nl> ---> For the base PKGBULD
#Credits: Laurent Carlier <lordheavym@gmail.com> ---> For the base PKGBUILD

pkgbase=mesa-llvm
pkgname=("${pkgbase}" "lib32-${pkgbase}")
pkgver=20.2.3
pkgrel=1
arch=(x86_64)
url="https://mesa3d.org/"
license=('MIT')
makedepends=("bison" "flex" "valgrind" "meson" "ninja" "git" "ninjas2" "clang" "libxvmc" "python" "python-appdirs" "python-mako" "python-evdev" "elfutils"
             "glslang" "libva" "libepoxy" "libxv" "libvdpau" "libx11" "libxml2" "libxrandr" "llvm" "libconfig" "gtk3" "wayland-protocols" "xorgproto" "lib32-flex"
             "lib32-clang" "lib32-libxvmc" "lib32-elfutils" "lib32-libva" "lib32-libepoxy" "lib32-libxv" "lib32-libvdpau" "lib32-libx11" "lib32-libxml2"
             "lib32-libxrandr" "lib32-llvm" "lib32-gtk3" "lua" "polly" "gcc" "gcc-libs" "lib32-gcc-libs" "ncurses" "lib32-ncurses" "libarchive")
source=("https://archive.mesa3d.org/mesa-${pkgver}.tar.xz"
        "LICENSE"
        "0001-ENABLE-LLVM-BY-DEFAULT.patch")
md5sums=("SKIP"
         "SKIP"
         "SKIP")

prepare(){
  cd mesa-${pkgver}

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
  cd mesa-${pkgver}

export CC="gcc"
export CXX="g++"

  # remove build dir if there is one
  if dir build_64; then
    rm -rf -v build_64
  fi

  # create build dir
  mkdir -p -v build_64

  # build with meson
  meson build_64/ \
  -D b_ndebug=true \
  -D b_lto=true \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -D sysconfdir=/etc \
  -Dprefix=/usr \
  -Dplatforms=x11,wayland \
  -Ddri3=enabled \
  -Ddri-drivers=i915,i965,r100,r200,nouveau \
  -Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink,freedreno,v3d,vc4,etnaviv,tegra,kmsro \
  -Dgallium-extra-hud=true \
  -Dgallium-vdpau=enabled \
  -Dgallium-xvmc=enabled \
  -Dgallium-omx=bellagio \
  -Dgallium-va=enabled \
  -Dgallium-xa=enabled \
  -Dgallium-nine=true \
  -Dgallium-opencl=icd \
  -Dopencl-spirv=false \
  -Dvulkan-drivers=amd,intel \
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
  -Dshared-llvm=disabled \
  -Dvalgrind=enabled \
  -Dlibunwind=enabled \
  -Dlmsensors=enabled \
  -Dselinux=false \
  -Dosmesa=gallium \
  -Dswr-arches=avx,avx2,knl,skx \
  -Dshared-swr=true \
  -Dpower8=enabled \
  -Dxlib-lease=enabled \
  -Dglx-direct=true \
  -Dzstd=enabled

export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config
cat >crossfile.ini <<END
[binaries]
llvm-config = '/usr/bin/llvm-config32'
END

    # remove build dir if there is one
    if dir build_32; then
      rm -rf -v build_32
    fi

    # create build dir
    mkdir -p -v build_32

    # build with meson
    meson build_32/ \
    --native-file crossfile.ini \
    --libdir=/usr/lib32 \
    -D b_ndebug=true \
    -D b_lto=true \
    -D buildtype=plain \
    --wrap-mode=nofallback \
    -D sysconfdir=/etc \
    -Dprefix=/usr \
    -Dplatforms=x11,wayland \
    -Ddri3=enabled \
    -Ddri-drivers=i915,i965,r100,r200,nouveau \
    -Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink,freedreno,v3d,vc4,etnaviv,tegra,kmsro \
    -Dgallium-extra-hud=true \
    -Dgallium-vdpau=enabled \
    -Dgallium-xvmc=enabled \
    -Dgallium-omx=disabled \
    -Dgallium-va=enabled \
    -Dgallium-xa=enabled \
    -Dgallium-nine=true \
    -Dgallium-opencl=icd \
    -Dopencl-spirv=false \
    -Dvulkan-drivers=amd,intel \
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
    -Dshared-llvm=disabled \
    -Dvalgrind=disabled \
    -Dlibunwind=enabled \
    -Dlmsensors=enabled \
    -Dselinux=false \
    -Dosmesa=gallium \
    -Dswr-arches=avx,avx2,knl,skx \
    -Dshared-swr=true \
    -Dpower8=enabled \
    -Dxlib-lease=enabled \
    -Dglx-direct=true \
    -Dzstd=enabled
}

package_mesa-llvm(){
  pkgdesc="Mesa stable release. LLVM enable by default. More options are enable than the standard mesa package. (64-bit)"
  depends=("libdrm" "libelf" "libglvnd" "libomxil-bellagio" "libunwind" "libxdamage" "libxxf86vm" "llvm-libs" "lm_sensors" "wayland" "zstd" "libxshmfence"
           "libclc" "expat" "vulkan-icd-loader")
  conflicts=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "mesa-aco" "mesa-aco-rc" "mesa-llvm-rc"
             "mesa-git")
  replaces=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "mesa-aco" "mesa-aco-rc" "mesa-llvm-rc"
            "mesa-git")
  provides=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-driver" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "opengl-driver" "opencl-driver"
            "mesa-libgl")

  # compiling mesa and installing to "$pkgdir"
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C mesa-${pkgver}/build_64/ install

  # remove script file from /usr/bin
  rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
  rm -rf -v "${pkgdir}/usr/bin"

  # indirect rendering
  ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

  # installing license
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
  cp -v "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}

package_lib32-mesa-llvm(){
   pkgdesc="Mesa stable release. LLVM enable by default. More options are enable than the standard mesa package. (32-bit)"
   depends=("lib32-libdrm" "lib32-libelf" "lib32-libglvnd" "libomxil-bellagio" "lib32-libunwind" "lib32-libxdamage" "lib32-libxxf86vm" "lib32-llvm-libs"
            "lib32-lm_sensors" "lib32-wayland" "lib32-zstd" "lib32-libxshmfence" "libclc" "lib32-expat" "lib32-vulkan-icd-loader")
   conflicts=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver" "lib32-mesa-vdpau"
              "lib32-mesa-aco" "lib32-mesa-aco-rc" "lib32-mesa-llvm-rc" "lib32-mesa-git")
   replaces=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver" "lib32-mesa-vdpau"
             "lib32-mesa-aco" "lib32-mesa-aco-rc" "lib32-mesa-llvm-rc" "lib32-mesa-git")
   provides=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-driver" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver"
             "lib32-mesa-vdpau" "lib32-opengl-driver" "lib32-opencl-driver" "lib32-mesa-libgl")

  # compiling mesa and installing to "$pkgdir"
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C mesa-${pkgver}/build_32/ install

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
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
  cp -v "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}
