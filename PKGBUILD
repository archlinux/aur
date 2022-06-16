# Maintainer: Christoph Haag <christoph.haag@collabora.com>

_pkgname=onnxruntime
pkgname=onnxruntime-git
pkgver=orttraining_rc2.r3930.g3d99f16e98
pkgrel=1
pkgdesc="cross-platform inference and training machine-learning accelerator."
arch=('x86_64')
url="https://onnxruntime.ai/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'ninja')
checkdepends=()
optdepends=()
provides=('onnxruntime')
conflicts=('onnxruntime')
replaces=()
options=()
# install=
# changelog=
source=("git+https://github.com/microsoft/onnxruntime.git")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	git submodule update --init --recursive
	sed -i s'/-Werror //g' "$srcdir"/onnxruntime/cmake/external/flatbuffers/CMakeLists.txt
}

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	# ./build.sh --config RelWithDebInfo --build_shared_lib --parallel

	#export PKG_CONFIG_PATH=/usr/lib/pkgconfig
	# rm -rf $srcdir/$_pkgname-build
	cmake -S $srcdir/$_pkgname/cmake \
		-B $srcdir/$_pkgname-build \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr/ \
		-DCMAKE_PREFIX_PATH=/usr/ \
		-DCMAKE_BUILD_TYPE=Release \
		-Donnxruntime_BUILD_SHARED_LIB=ON \
		-DONNX_USE_PROTOBUF_SHARED_LIBS=ON \
		.
	ninja -C $srcdir/$_pkgname-build
}

check() {
	cd "$_pkgname"
	#make -k check
}

package() {
	cd "$srcdir"/$_pkgname
	DESTDIR="$pkgdir/" ninja -C "$srcdir"/$_pkgname-build install
}
