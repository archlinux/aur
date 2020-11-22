#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Lone_Wolf <lone_wolf@klaas-de-kat.nl> ---> For the base PKGBULD
#Credits: Laurent Carlier <lordheavym@gmail.com> ---> For the base PKGBUILD

pkgname=lib32-mesa-aco
pkgver=20.2.2
pkgrel=1
pkgdesc="Mesa stable release. ACO enable by default. More options are enable than the standard mesa package. (32-bit)"
arch=(x86_64)
url="https://mesa3d.org/"
license=('MIT')
depends=("lib32-libdrm" "lib32-libelf" "lib32-libglvnd" "libomxil-bellagio" "lib32-libunwind" "lib32-libxdamage" "lib32-libxxf86vm" "lib32-llvm-libs"
         "lib32-lm_sensors" "lib32-wayland" "lib32-zstd" "lib32-libxshmfence" "libclc" "lib32-expat" "lib32-vulkan-icd-loader")
makedepends=("bison" "lib32-flex" "valgrind" "meson" "ninja" "git" "ninjas2" "lib32-clang" "lib32-libxvmc" "python" "python-appdirs" "python-mako" "python-evdev"
             "lib32-elfutils" "glslang" "lib32-libva" "lib32-libepoxy" "lib32-libxv" "lib32-libvdpau" "lib32-libx11" "lib32-libxml2" "lib32-libxrandr" "lib32-llvm"
             "libconfig" "lib32-gtk3" "wayland-protocols" "xorgproto")
conflicts=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver" "lib32-mesa-vdpau"
           "lib32-mesa-aco-rc" "lib32-mesa-llvm" "lib32-mesa-llvm-rc" "lib32-mesa-git")
replaces=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver" "lib32-mesa-vdpau"
          "lib32-mesa-aco-rc" "lib32-mesa-llvm" "lib32-mesa-llvm-rc" "lib32-mesa-git")
provides=("lib32-mesa" "lib32-opencl-mesa" "lib32-vulkan-intel" "lib32-vulkan-radeon" "lib32-vulkan-driver" "lib32-vulkan-mesa-layer" "lib32-libva-mesa-driver"
          "lib32-mesa-vdpau" "lib32-opengl-driver" "lib32-opencl-driver" "lib32-mesa-libgl")
source=("https://archive.mesa3d.org/mesa-${pkgver}.tar.xz"
        "0001-util-workaround-LTO-compilation-break-since-18cb8f23.patch"
        "0003-evergreen-big-endian.patch"
        "LICENSE")
md5sums=("SKIP"
         "SKIP"
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
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
cat >crossfile.ini <<END
[binaries]
llvm-config = '/usr/bin/llvm-config32'
END

  cd mesa-${pkgver}

  # remove build dir if there is one
  msg2 "remove build dir if there is one"
  if dir build; then
  rm -rf build
  fi

  # create build dir
  msg2 "Create build dir"
  mkdir -p -v build

  # build with meson
  msg2 "Build with meson"
  meson build \
  --native-file ../crossfile.ini \
  --libdir=/usr/lib32 \
  -D b_ndebug=true \
  -D b_lto=true \
  -D buildtype=plain \
  --wrap-mode=nofallback \
  -D sysconfdir=/etc \
  -Dprefix=/usr \
  -Dplatforms=x11,wayland \
  -Ddri3=enabled \
  -Ddri-drviers=i915,i965,r100,r200,nouveau \
  -Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink,freedreno,v3d,vc4,etnaviv,tegra,kmsro \
  -Dgallium-extra-hud=true \
  -Dgallium-vdpau=enabled \
  -Dgallium-xvmc=enabled \
  -Dgallium-omx=auto \
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

package(){
  # compiling mesa and installing to "$pkgdir"
  msg2 "Compiling mesa and installing to ${pkgdir}"
  DESTDIR="${pkgdir}" ninja $NINJAFLAGS -C mesa-${pkgver}/build/ install

  #Remove files provided by standard mesa build
  msg2 "Remove files provided by standard mesa build"
  rm -rf "$pkgdir"/etc
  rm -rf "$pkgdir"/usr/include
  rm -rf "$pkgdir"/usr/share/glvnd
  rm -rf "$pkgdir"/usr/share/drirc.d
  rm -rf "$pkgdir"/usr/share/freedreno
  rm -rf "$pkgdir"/usr/share/vulkan/explicit_layer.d
  rm -rf "$pkgdir"/usr/share/vulkan/explicit_layer.d/VkLayer_MESA_overlay.json
  rm -rf "$pkgdir"/usr/share/vulkan/implicit_layer.d
  rm -rf "$pkgdir"/usr/share/vulkan/implicit_layer.d/VkLayer_MESA_device_select.json

  # remove script file from /usr/bin
  msg2 "Remove ${pkgdir}/usr/bin/mesa-overlay-control.py"
  rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
  msg2 "Remove ${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/bin"

  # indirect rendering
  ln -s /usr/lib32/libGLX_mesa.so.0 "${pkgdir}/usr/lib32/libGLX_indirect.so.0"

  # installing license
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
  cp -v -r "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}
