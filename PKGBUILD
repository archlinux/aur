# Maintainer: monsoon235 <29970829+monsoon235@users.noreply.github.com>
# Contributor: richc <admin+aur@sys.corbet.ch>
# Repackages the official upstream SYCL FP16 binaries together with the Intel
# oneAPI 2026.2 runtime libraries they were built against (taken from Intel's apt
# repository). Arch's own intel-oneapi-* packages are still on 2026.0, whose libsycl
# lacks symbols the current upstream binaries need, so the runtime is bundled in a
# private directory instead and no system oneAPI installation is required.
pkgname=llama.cpp-sycl-bin
pkgver=b12380
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the SYCL backend (bundled oneAPI runtime)'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
# The bundled Intel runtime libraries are under Intel's own license terms.
license=('MIT' 'Apache-2.0' 'LicenseRef-Intel')
# Upstream binaries link OpenSSL 3 (libssl.so.3), while Arch's openssl is 4.x.
depends=('glibc' 'gcc-libs' 'openssl-3' 'curl' 'intel-compute-runtime' 'level-zero-loader' 'ocl-icd')
makedepends=('patchelf' 'libarchive' 'binutils' 'xz')
provides=('llama.cpp-sycl')
options=('!strip' '!debug')
_syclprec=fp16
_oneapi=2026.2
_llamasrc="llama-${pkgver}-sycl-fp16.tar.gz"
_inteldebs=(
  'intel-oneapi-compiler-dpcpp-cpp-runtime-2026.2-2026.2.0-863_amd64.deb'
  'intel-oneapi-compiler-shared-runtime-2026.2-2026.2.0-863_amd64.deb'
  'intel-oneapi-openmp-2026.2-2026.2.0-863_amd64.deb'
  'intel-oneapi-mkl-core-2026.2-2026.2.0-881_amd64.deb'
  'intel-oneapi-mkl-sycl-blas-2026.2-2026.2.0-881_amd64.deb'
  'intel-oneapi-tbb-2023.2-2023.2.0-492_amd64.deb'
  'intel-oneapi-umf-1.2-1.2.0-116_amd64.deb'
  'intel-oneapi-tcm-1.6-1.6.0-178_amd64.deb'
  'intel-oneapi-dnnl-2026.1-2026.1.0-617_amd64.deb'
)
source=(
  "${_llamasrc}::https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-sycl-${_syclprec}-x64.tar.gz"
  "${_inteldebs[@]/#/https://apt.repos.intel.com/oneapi/pool/main/}"
  'llama-sycl'
)
noextract=("${_llamasrc}" "${_inteldebs[@]}")
sha256sums=(
  'dffdca8bd148d0d1445fff5f18baef9c5425a4fb56213c4d33151adcaaf922e8'
  '4dd258b182f137080f95bb9aef0df32c3569d0ce405f409cffef5a6d2ad9f495'
  'fdb13eb410afec2214b20bc8b9296ec4e9e61c41d5aeda268de40e9b37354b87'
  '1b687b71bb33048ef40886b0c3b10224460d3c35e0226e6358ef283d2ecb1601'
  'a482957e8c7e93ba8ad454c5f901e240ce30fb091cd8b17e094021cfba79f7a2'
  '32cc91bc6fe3f60cb816af48ef47ed38a267c0c49d57dc66e8c42e394763e17a'
  'c7f46ffe15bfe2312804c0fff1c99cba0ddbaf9d19cbfaf07d83ee131904c33d'
  '30c0d5d41814098882ce0e8ce5173d6f32bf159b6593aebf76db2f05b65b25a2'
  'c5daf94c0a1147e472fad8ce301008d9336179f1565ac94de9f2ea94268c19b5'
  'cd424899e1b4476274cb8cb8421acf00220cba6501f4d9b896fca4dec582cad7'
  'SKIP'
)

prepare() {
  mkdir -p sycl oneapi
  bsdtar -xf "${_llamasrc}" -C sycl
  local deb
  for deb in "${_inteldebs[@]}"; do
    ar p "$deb" data.tar.xz | tar -xJf - -C oneapi
  done
}

build() {
  local d="$srcdir/sycl/llama-${pkgver}"
  # Resolve all bundled libraries from the private directory.
  find "$d" -maxdepth 1 -name '*.so*' -type f -exec patchelf --set-rpath '$ORIGIN' {} +
  find "$d" -maxdepth 1 -type f -executable ! -name '*.so*' -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
  local d="$srcdir/sycl/llama-${pkgver}"
  local o="$srcdir/oneapi/opt/intel/oneapi"
  local libdir="$pkgdir/usr/lib/llama-sycl"
  install -d "$libdir" "$pkgdir/usr/bin"
  cp -a "$d"/lib*.so* "$libdir/"
  local executable
  for executable in "$d"/llama-*; do
    [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
    install -m755 "$executable" "$libdir/${executable##*/}"
  done
  install -Dm755 "$srcdir/llama-sycl" "$pkgdir/usr/bin/llama-sycl"

  # Only the runtime libraries the SYCL backend loads, installed under their sonames.
  local lib
  for lib in \
    compiler/$_oneapi/lib/{libimf.so,libintlc.so.5,libirng.so,libsvml.so,libiomp5.so,libsycl.so.9} \
    compiler/$_oneapi/lib/{libur_loader.so.0,libur_adapter_level_zero.so.0,libur_adapter_level_zero_v2.so.0} \
    mkl/$_oneapi/lib/{libmkl_core.so.3,libmkl_intel_ilp64.so.3,libmkl_intel_thread.so.3,libmkl_sycl_blas.so.6} \
    tbb/2023.2/lib/libtbb.so.12 umf/1.2/lib/libumf.so.1 tcm/1.6/lib/libhwloc.so.15 dnnl/2026.1/lib/libdnnl.so.3; do
    test -e "$o/$lib"
    install -Dm755 "$(readlink -f "$o/$lib")" "$libdir/${lib##*/}"
  done

  install -Dm644 "$d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$o/dnnl/2026.1/share/doc/dnnl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/oneDNN-LICENSE"
  install -Dm644 "$o/dnnl/2026.1/share/doc/dnnl/THIRD-PARTY-PROGRAMS" "$pkgdir/usr/share/licenses/$pkgname/oneDNN-THIRD-PARTY-PROGRAMS"
  install -Dm644 "$o/mkl/$_oneapi/share/doc/mkl/licensing/license.txt" "$pkgdir/usr/share/licenses/$pkgname/Intel-oneAPI-LICENSE.txt"
  install -Dm644 "$o/mkl/$_oneapi/share/doc/mkl/licensing/third-party-programs.txt" "$pkgdir/usr/share/licenses/$pkgname/Intel-oneAPI-THIRD-PARTY-PROGRAMS.txt"
}
