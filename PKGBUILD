pkgname=rocblas-polaris
pkgver=5.1.1
pkgrel=2
pkgdesc='Next generation BLAS implementation for ROCm platform , patched for the Polaris architure'
arch=('x86_64')
url='https://rocblas.readthedocs.io/en/latest'
license=('MIT')
depends=('hip' 'openmp')
provides=('rocblas')
makedepends=('cmake' 'git' 'python' 'python-virtualenv' 'python-pyaml'
             'perl-file-which' 'msgpack-c' 'rocm-cmake' 'gcc-fortran')
_tensile='https://github.com/ROCmSoftwarePlatform/Tensile'
_rocblas='https://github.com/ROCmSoftwarePlatform/rocBLAS'
source=("rocblas-$pkgver.tar.gz::$_rocblas/archive/rocm-$pkgver.tar.gz" 
	"tensile-$pkgver.tar.gz::$_tensile/archive/rocm-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/xuhuisheng/rocm-build/master/patch/22.tensile-gfx803-1.patch")
sha256sums=('8a59c6f1ca36ccaf793bada022641a26da568249c776bd319d0d5bac6a8a809a'
	    'f07111ba2985877fa4c1cc9c7ed40c9e349a68d63a0d799d27cea4f6bb6744a4'
	    '9727f91d074901c7f7c2b7f151c5925cb2f3092953637379872000c7a938f821')
options=(!lto)
_tensile_dir="$(basename "$_tensile")-$(basename "${source[1]}" .tar.gz)"
_dirname="$(basename "$_rocblas")-$(basename "${source[0]}" ".tar.gz")"
prepare() {
	#From xuhuisheng
	#at https://github.com/RadeonOpenCompute/ROCm/issues/1265
	cd "$_tensile_dir"
	patch -p1 -i "$srcdir/22.tensile-gfx803-1.patch"
	
	rm -rf "$_dirname"/library/src/blas3/Tensile/Logic/asm_full/r9nano*
}

build() {
  local cmake_args=(-DCMAKE_INSTALL_PREFIX=/opt/rocm
                    -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm
                    -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr
                    -DBUILD_WITH_TENSILE=ON
                    -DBUILD_WITH_TENSILE_HOST=ON
                    -DTensile_LIBRARY_FORMAT=yaml
                    -DTensile_COMPILER=hipcc
                    -DTensile_LOGIC=asm_full
                    -DTensile_ARCHITECTURE=gfx803
		    -DTensile_CODE_OBJECT_VERSION=V3
                    -DTensile_TEST_LOCAL_PATH="$_tensile_dir"
		    -DBUILD_CLIENTS_TESTS=OFF
                    -DBUILD_CLIENTS_BENCHMARKS=OFF
                    -DBUILD_CLIENTS_SAMPLES=OFF
                    -DBUILD_TESTING=OFF)
  if [[ -n "$AMDGPU_TARGETS" ]]; then
      cmake_args+=(-DAMDGPU_TARGETS="$AMDGPU_TARGETS")
  fi
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md
  PATH="/opt/rocm/llvm/bin:${PATH}" \
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build -Wno-dev \
        -S "$_dirname" \
        "${cmake_args[@]}"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocblas.conf" << EOF
/opt/rocm/rocblas/lib
EOF
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/rocblas/LICENSE"
}

