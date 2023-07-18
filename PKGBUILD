#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=llama.cpp
pkgbase=llama-cpp
pkgname=("$pkgbase" "$pkgbase-cuda")
pkgver=b764743
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/ggerganov/llama.cpp
depends=(python openmpi)
makedepends=(cmake)
license=(GPL3)
source=("$url/archive/master-$pkgver.tar.gz")
sha256sums=('659a453f270c33a250464a940782ad000bd13cd14ea3c5b7ac08cc7739e6b39e')

_build() {
	cd "$_pkgname-master-$pkgver" || return 1

	# -DLLAMA_BUILD_TESTS=OFF -DLLAMA_BUILD_EXAMPLES=OFF -DLLAMA_BUILD_SERVER=OFF \
	cmake -B$1 -DCMAKE_INSTALL_PREFIX=/usr -DLLAMA_MPI=ON -DBUILD_SHARED_LIBS=ON \
		${*:2:$#}
	cmake --build $1
}

_package() {
	DESTDIR="$pkgdir" cmake --install $1
	# https://github.com/ggerganov/llama.cpp/pull/2256
	install -D $1/bin/* -t "$pkgdir/usr/bin"
	mv $pkgdir/usr/bin/main $pkgdir/usr/bin/llama
	mv $pkgdir/usr/bin/server $pkgdir/usr/bin/llama-server
	echo "#!/usr/bin/env python" >$pkgdir/usr/bin/convert.py
	cat convert.py >>$pkgdir/usr/bin/convert.py
	chmod +x $pkgdir/usr/bin/convert.py
}

package_llama-cpp() {
	if [[ "$(uname -m)" == x86* ]]; then
		depends+=(intel-oneapi-dpcpp-cpp)
		_build build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=Intel10_64lp -DCMAKE_C_COMPILER=/opt/intel/oneapi/compiler/latest/linux/bin/icx -DCMAKE_CXX_COMPILER=/opt/intel/oneapi/compiler/latest/linux/bin/icpx
	else
		depends+=(openblas)
		_build build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS
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
