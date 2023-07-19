#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=llama.cpp
pkgbase=llama-cpp
pkgname=("$pkgbase" "$pkgbase-cuda")
pkgver=294f424
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/ggerganov/llama.cpp
depends=(openmpi python-numpy python-sentencepiece)
makedepends=(cmake)
license=(GPL3)
source=("$url/archive/master-$pkgver.tar.gz")
sha256sums=('95effaa75fdf1e7fb4819500f3aa6a9c970dbe36392a51a4ead904660841cd93')

_build() {
	cd "$_pkgname-master-$pkgver" || return 1

	# https://github.com/ggerganov/llama.cpp/pull/2277
	sed -i 's/NOT DepBLAS/NOT DepBLAS_FOUND/' CMakeLists.txt
	cmake -B$1 -DCMAKE_INSTALL_PREFIX=/usr -DLLAMA_MPI=ON -DBUILD_SHARED_LIBS=ON \
		${*:2:$#}
	cmake --build $1
}

_package() {
	DESTDIR="$pkgdir" cmake --install $1
	mv $pkgdir/usr/bin/main $pkgdir/usr/bin/llama
	mv $pkgdir/usr/bin/server $pkgdir/usr/bin/llama-server
}

package_llama-cpp() {
	local _arch data_type_model
	_arch="$(uname -m)"
	if [[ "$_arch" != x86* ]]; then
		depends+=(openblas)
		_build build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS
	else
		if [[ "$_arch" == x86_64 ]]; then
			data_type_model=64lp
		else
			data_type_model=32
		fi
		depends+=(intel-oneapi-dpcpp-cpp intel-oneapi-mkl)
		_build build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=Intel10_"$data_type_model" -DCMAKE_C_COMPILER=/opt/intel/oneapi/compiler/latest/linux/bin/icx -DCMAKE_CXX_COMPILER=/opt/intel/oneapi/compiler/latest/linux/bin/icpx
	fi
	_package build
}

package_llama-cpp-cuda() {
	pkgdesc="${pkgdesc} (with CUDA)"
	depends+=(cuda)
	provides=(llama-cpp)
	conflicts=(llama-cpp)

	_build build-cuda -DLLAMA_CUBLAS=ON
	_package build-cuda
}
