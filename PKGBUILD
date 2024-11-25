# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=hiprt-2.3
_pkgname=HIPRT
pkgver=2.3
_extra=bd75b7c.rc7
pkgrel=1
pkgdesc="HIP-RT's a ray tracing library for HIP (2.3)"
arch=('x86_64')
url="https://gpuopen.com/hiprt/"
license=('MIT')
depends=('glibc' 'gcc-libs' 'rocm-hip-runtime')
makedepends=('cmake' 'ninja' 'rocm-hip-sdk')
conflicts=(hiprt)
replaces=(hiprt)
source=("https://github.com/GPUOpen-LibrariesAndSDKs/HIPRT/archive/refs/tags/${pkgver}.${_extra}.tar.gz"
	"disable-cuda.patch")
sha256sums=('2ebbff51ea7e9e5f82b32cdff0ed5c2d5ac6d5061dfe3231a798c8597f436a1a'
            '6e80236b57577e7e8455feb7eb103a184058d7279c2c69a5d513b7341fd57dec')

prepare(){
	cd "$srcdir/$_pkgname-$pkgver.$_extra"
	patch -p1 < "$srcdir/disable-cuda.patch"

	chmod 755 "$srcdir/$_pkgname-$pkgver.$_extra/contrib/easy-encryption/bin/linux/ee64"
}


build() {
	cd "$srcdir"
	export CUDA_PATH=
	cmake -B build -S $_pkgname-$pkgver.$_extra -G Ninja \
	-D BITCODE=ON \
	-D HIP_PATH="/opt/rocm" \
	-D CMAKE_BUILD_TYPE=None \
	-D CMAKE_INSTALL_PREFIX="/opt/rocm" \
	-D PRECOMPILE=ON \
	-D NO_UNITTEST=ON

	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	install -dm755 "$pkgdir/opt/rocm/lib"
	mv "$pkgdir"/opt/rocm/bin/libhiprt*.so "$pkgdir/opt/rocm/lib/."
	rmdir "$pkgdir/opt/rocm/bin/"
	for file in {hiprt02003_6.2_amd.hipfb,hiprt02003_6.2_amd_lib_linux.bc,oro_compiled_kernels.hipfb};
	do
		install -Dm644 "$srcdir/$_pkgname-$pkgver.$_extra/scripts/bitcodes/${file}" "${pkgdir}/opt/rocm/lib/${file}"
	done

	install -Dm644 "$srcdir/$_pkgname-$pkgver.$_extra/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
