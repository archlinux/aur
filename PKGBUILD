#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>

#Choice for compiler are :
#clang
#gcc

_compiler=clang

pkgbase=libdrm-full
pkgname=("$pkgbase" "lib32-libdrm-full")
pkgver=2.4.103
pkgrel=1
arch=(x86_64)
url="https://dri.freedesktop.org/"
license=('custom')
makedepends=("valgrind" "meson" "libxslt" "lib32-libxslt" "docbook-xsl" "ninja" "clang" "lib32-clang" "gcc" "gcc-libs" "lib32-gcc-libs")
checkdepends=("cairo" "lib32-cairo" "cunit")
source=("https://gitlab.freedesktop.org/mesa/drm/-/archive/libdrm-${pkgver}/drm-libdrm-${pkgver}.tar.gz" "COPYING")
md5sums=("SKIP" "SKIP")

build(){
	cd drm-libdrm-${pkgver}

	if [ "$_compiler" = "clang" ]; then
	export CC="clang"
	export CXX="clang++"
	elif [ "$_compiler" = "gcc" ]; then
	export CC="gcc"
	export CXX="g++"
	fi

	if dir build_64; then
	rm -rf -v build_64
	fi

	# create build_64 dir
	mkdir -p -v build_64

	# build
	meson build_64/ \
	-D b_ndebug=true \
	-D b_lto=true \
	-D buildtype=plain \
	--wrap-mode=nofallback \
	-D sysconfdir=/etc \
	--prefix=/usr \
	-Dlibkms=true \
	-Dintel=true \
	-Dradeon=true \
	-Damdgpu=true \
	-Dnouveau=true \
	-Dvmwgfx=true \
	-Domap=true \
	-Dexynos=true \
	-Dfreedreno=true \
	-Dtegra=true \
	-Dvc4=true \
	-Detnaviv=true \
	-Dcairo-tests=true \
	-Dman-pages=false \
	-Dvalgrind=true \
	-Dfreedreno-kgsl=true \
	-Dinstall-test-programs=true \
	-Dudev=true

	if [ "$_compiler" = "clang" ]; then
	export CC="clang -m32"
	export CXX="clang++ -m32"
	elif [ "$_compiler" = "gcc" ]; then
	export CC="gcc -m32"
	export CXX="g++ -m32"
	fi
	export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config

	if dir build_32; then
	rm -rf -v build_32
	fi

	# create build_32 dir
	mkdir -p -v build_32

	# build
	meson build_32/ \
	-D b_ndebug=true \
	-D b_lto=true \
	-D buildtype=plain \
	--wrap-mode=nofallback \
	-D sysconfdir=/etc \
	-Dprefix=/usr \
	--libdir=/usr/lib32 \
	-Dlibkms=true \
	-Dintel=true \
	-Dradeon=true \
	-Damdgpu=true \
	-Dnouveau=true \
	-Dvmwgfx=true \
	-Domap=true \
	-Dexynos=true \
	-Dfreedreno=true \
	-Dtegra=true \
	-Dvc4=true \
	-Detnaviv=true \
	-Dcairo-tests=true \
	-Dman-pages=false \
	-Dvalgrind=false \
	-Dfreedreno-kgsl=true \
	-Dinstall-test-programs=true \
	-Dudev=true
}

check() {
	meson test -C drm-libdrm-${pkgver}/build_64
	meson test -C drm-libdrm-${pkgver}/build_32
}

package_libdrm-full() {
	pkgdesc="Userspace interface to kernel DRM services with more options enable (64-bit)"
	depends=("libpciaccess")
	provides=("libdrm")
	replaces=("libdrm" "libdrm-git")
	conflicts=("libdrm" "libdrm-git")

	#Compiling libdrm and installing to "$pkgdir"
	DESTDIR="$pkgdir" ninja $NINJAFLAGS -C drm-libdrm-${pkgver}/build_64/ install

	# remove bin dir
	rm -rf -v "$pkgdir"/usr/bin

	# installing license
	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
	cp -v "${srcdir}"/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}

package_lib32-libdrm-full() {
	pkgdesc="Userspace interface to kernel DRM services with more options enable (32-bit)"
	depends=("lib32-libpciaccess" "libdrm")
	provides=("lib32-libdrm")
	replaces=("lib32-libdrm" "lib32-libdrm-git")
	conflicts=("lib32-libdrm" "lib32-libdrm-git")

	#Compiling libdrm and installing to "$pkgdir"
	DESTDIR="$pkgdir" ninja $NINJAFLAGS -C drm-libdrm-${pkgver}/build_32/ install

	# remove bin include and share
	rm -rf -v "$pkgdir"/usr/bin
	rm -rf -v "$pkgdir"/usr/include
	rm -rf -v "$pkgdir"/usr/share

	# installing license
	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
	cp -v "${srcdir}"/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}
