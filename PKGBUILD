#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>

#Choice for compiler are :
#clang
#gcc

_compiler=clang

pkgname=libdrm-bin
pkgver=2.4.103
pkgrel=1
arch=(x86_64)
pkgdesc="Userspace interface to kernel DRM services with more options enable (binary)"
url="https://dri.freedesktop.org/"
license=('custom')
depends=("libpciaccess")
makedepends=("valgrind" "meson" "libxslt" "docbook-xsl" "ninja" "clang" "gcc" "gcc-libs")
checkdepends=("cairo" "cunit")
provides=("libdrm-bin")
conflicts=("libdrm-proptest")
replaces=("libdrm-proptest")
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

	if dir build; then
	rm -rf -v build
	fi

	# create build_64 dir
	mkdir -p -v build

	# build
	meson build/ \
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
}

check() {
	meson test -C drm-libdrm-${pkgver}/build
}

package() {
	#Compiling libdrm and installing to "$pkgdir"
	DESTDIR="$pkgdir" ninja $NINJAFLAGS -C drm-libdrm-${pkgver}/build/ install

	# remove include lib share
	rm -rf -v "$pkgdir"/usr/include
	rm -rf -v "$pkgdir"/usr/lib
	rm -rf -v "$pkgdir"/usr/share

	# installing license
	install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
	cp -v "${srcdir}"/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}-${pkgver}/
}
