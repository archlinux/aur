# Maintainer: Christoph Haag <christoph.haag@collabora.com>

_pkgname=onnxruntime
pkgname=onnxruntime-git
pkgver=orttraining_rc2.r5085.g432a9912a3
pkgrel=1
pkgdesc="cross-platform inference and training machine-learning accelerator."
arch=('x86_64')
url="https://onnxruntime.ai/"
license=('MIT')
depends=('gcc-libs' 'python' 'protobuf')
makedepends=('git' 'cmake' 'ninja' 'clang')
checkdepends=()
optdepends=()
provides=('onnxruntime')
conflicts=('onnxruntime' 'flatbuffers')
replaces=()
options=()
source=("git+https://github.com/microsoft/onnxruntime.git#branch=main")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	git submodule update --init --recursive
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	# ./build.sh --config RelWithDebInfo --build_shared_lib --parallel
	# export PKG_CONFIG_PATH=/usr/lib/pkgconfig
	# rm -rf $srcdir/$_pkgname-build


	export CC=clang
	export CXX=clang++

	cmake -S "$srcdir"/$_pkgname/cmake \
		-B "$srcdir"/$_pkgname-build \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr/ \
		-DCMAKE_PREFIX_PATH=/usr/ \
		-DCMAKE_BUILD_TYPE=Release \
		-Donnxruntime_BUILD_SHARED_LIB=ON \
		-DONNX_USE_PROTOBUF_SHARED_LIBS=ON \
		-DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
		-DPYTHON_LIBRARY=$(python -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))") \
		-DPYTHON_EXECUTABLE:FILEPATH=$(which python) \

	sed -i 's/-Werror //g' "$srcdir"/$_pkgname-build/_deps/flatbuffers-src/CMakeLists.txt

	# Fix build with gcc. See also
	# * https://github.com/pytorch/pytorch/issues/77939
	# * https://github.com/opencv/opencv/pull/22512
	sed -i 's/\"-mavx512f\"/\"-mavx512f -Wno-error\"/g' "$srcdir"/$_pkgname/cmake/onnxruntime_mlas.cmake

	ninja -C "$srcdir"/$_pkgname-build
}

check() {
	cd "$_pkgname"
	#make -k check
}

package() {
	cd "$srcdir"/$_pkgname
	DESTDIR="$pkgdir/" ninja -C "$srcdir"/$_pkgname-build install
}
