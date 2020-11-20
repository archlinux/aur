#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Lone_Wolf <lone_wolf@klaas-de-kat.nl> ---> For the base PKGBULD
#Credits: Laurent Carlier <lordheavym@gmail.com> ---> For the base PKGBUILD

pkgname=mesa-aco
pkgver=20.2.2
pkgrel=1
pkgdesc="Mesa stable release. ACO enable by default. More options are enable than the standard mesa package. Provides ocl-icd and libglvnd."
arch=(x86_64)
url="https://mesa3d.org/"
license=('MIT')
depends=("libdrm" "libelf" "libglvnd" "libomxil-bellagio" "libunwind" "libxdamage" "libxxf86vm" "llvm-libs"
	       "lm_sensors" "wayland" "zstd" "libxshmfence" "libclc" "expat" "vulkan-icd-loader")
makedepends=("bison" "flex" "valgrind" "meson" "ninja" "git" "ninjas2" "clang" "libxvmc"
             "python" "python-appdirs" "python-mako" "python-evdev" "elfutils" "glslang" "libva" "libepoxy" "libxv" "libvdpau"
	           "libx11" "libxml2" "libxrandr"  "llvm" "libconfig" "gtk3" "wayland-protocols" "xorgproto" "patch" "libxv" "libxvmc"
	           "libepoxy")
conflicts=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "libglvnd" "ocl-icd"
	         "mesa-aco-rc" "mesa-llvm" "mesa-llvm-rc" "mesa-git")
replaces=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "libglvnd" "ocl-icd"
          "mesa-aco-rc" "mesa-llvm" "mesa-llvm-rc" "mesa-git")
provides=("mesa" "opencl-mesa" "vulkan-intel" "vulkan-radeon" "vulkan-driver" "vulkan-mesa-layer" "libva-mesa-driver" "mesa-vdpau" "opengl-driver"
	        "opencl-driver" "mesa-libgl" "libglvnd" "libgl" "libegl" "libgles" "ocl-icd" "opencl-icd-loader")
source=("https://archive.mesa3d.org/mesa-${pkgver}.tar.xz"
        "LICENSE")
md5sums=("SKIP"
         "SKIP")

package() {
	cd mesa-${pkgver}

	# remove build dir if there is one
	msg2 "Remove build dir if there is one"
	if dir build; then
	rm -rf build
	fi

	# create build dir
	msg2 "Create build dir"
	mkdir -p -v build

	# build
	msg2 "Build with meson"
	meson build/ \
  -D b_ndebug=true \
  -D b_lto=true \
	-Dprefix=/usr \
	-Dplatforms=x11,wayland \
	-Ddri3=enabled \
	-Ddri-drivers=i915,i965,r100,r200,nouveau \
	-Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,iris,zink,freedreno,v3d,vc4,etnaviv,tegra,kmsro \
	-Dgallium-extra-hud=true \
	-Dgallium-vdpau=enabled \
	-Dgallium-xvmc=enabled \
	-Dgallium-omx=auto \
	-Dgallium-va=enabled \
	-Dgallium-xa=enabled \
	-Dgallium-nine=true \
	-Dgallium-opencl=standalone \
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
	-Dglvnd=false \
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

	# compiling mesa and installing to "$pkgdir"
	msg2 "Compiling mesa and installing to "$pkgdir""
	DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build/ install

	# remove script file from /usr/bin
	# https://gitlab.freedesktop.org/mesa/mesa/issues/2230
	rm "${pkgdir}/usr/bin/mesa-overlay-control.py"
	rm -rf "${pkgdir}/usr/bin"

	#Recompile for libEGL_mesa libGLX_mesa libMesaOpenCL
	msg2 "Recompile mesa for libEGL_mesa libGLX_mesa libMesaOpenCL"

	# remove build dir if there is one
	msg2 "Remove build dir if there is one"
	if dir build; then
	rm -rf build
	fi

	# create build dir
	msg2 "Create build dir"
	mkdir -p -v build

	msg2 "Create fakeinstall dir"
	mkdir -p -v "${srcdir}"/fakeinstall

	# build
	msg2 "Build with meson"
	meson build/ \
	-D b_ndebug=true \
	-D b_lto=true \
	-Dprefix=/usr \
	-Dplatforms=x11,wayland \
	-Ddri3=enabled \
	-Ddri-drivers=i915,i965,r100,r200,nouveau \
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

	# compiling mesa and installing to "$pkgdir"
	msg2 "Recompiling mesa and installing to fakeinstall"
	DESTDIR="${srcdir}"/fakeinstall ninja $NINJAFLAGS -C build/ install

	#Copy *libEGL_mesa* to "${pkgdir}"/usr/lib/
	cp -v -r "${srcdir}"/fakeinstall/usr/lib/*libEGL_mesa* "${pkgdir}"/usr/lib/

	#Copy to *libGLX_mesa* "${pkgdir}"/usr/lib/
	cp -v -r "${srcdir}"/fakeinstall/usr/lib/*libGLX_mesa* "${pkgdir}"/usr/lib/

	#Copy to *libMesaOpenCL* "${pkgdir}"/usr/lib/
	cp -v -r "${srcdir}"/fakeinstall/usr/lib/*libMesaOpenCL* "${pkgdir}"/usr/lib/

	#Copy etc/ to ${pkgdir}
	msg2 "Copy etc/ to ${pkgdir}"
	cp -v -r "${srcdir}"/fakeinstall/etc "${pkgdir}"

	# indirect rendering
	ln -s /usr/lib/libGLX_mesa.so.0 "${pkgdir}/usr/lib/libGLX_indirect.so.0"

	# installing licencse
	msg2 "Installing license"
	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
	cp -v -r "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}
