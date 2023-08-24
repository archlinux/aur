#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=llama.cpp
pkgbase=llama-cpp
pkgname=("$pkgbase" "$pkgbase-cuda" "$pkgbase-opencl")
pkgver=c3e53b4
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/ggerganov/llama.cpp
depends=(openmpi python-numpy python-sentencepiece)
makedepends=(cmake intel-oneapi-dpcpp-cpp cuda intel-oneapi-mkl clblast)
license=(GPL3)
source=("$url/archive/master-$pkgver.tar.gz")
sha256sums=('7bf8a74bd3393b2c96abca17099487dccdd114c6bb5bb59b70daf02efe437606')

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
		depends+=(intel-oneapi-mkl)
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

package_llama-cpp-opencl() {
	pkgdesc="${pkgdesc} (with OpenCL)"
	depends+=(clblast)
	provides=(llama-cpp)
	conflicts=(llama-cpp)

	_build build-opencl -DLLAMA_CLBLAST=ON
	_package build-opencl
}
