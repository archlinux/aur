# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=hiprt
_pkgname=HIPRT
pkgver=2.5
_extra=cfa5e2a
pkgrel=1
pkgdesc="HIP-RT's a ray tracing library for HIP"
arch=('x86_64')
url="https://gpuopen.com/hiprt/"
license=('MIT')
depends=('glibc' 'gcc-libs' 'rocm-hip-runtime')
makedepends=('cmake' 'ninja' 'rocm-hip-sdk')
source=("https://github.com/GPUOpen-LibrariesAndSDKs/HIPRT/archive/refs/tags/${pkgver}.${_extra}.tar.gz"
	"disable-cuda.patch")
sha256sums=('5634034378e6056d7c0a9cc3c7c7593bbf74f1ebcf234573d79f8fe989ca36e8'
            '5c14b42ce6d59e2028bdbafea03aa7259ba78668c630e79015d1c0c3ed03ef67')

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
	for file in {hiprt02005_6.2_amd.hipfb,hiprt02005_6.2_amd_lib_linux.bc,oro_compiled_kernels.hipfb};
	do
		install -Dm644 "$srcdir/$_pkgname-$pkgver.$_extra/scripts/bitcodes/${file}" "${pkgdir}/opt/rocm/lib/${file}"
	done

	install -Dm644 "$srcdir/$_pkgname-$pkgver.$_extra/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
