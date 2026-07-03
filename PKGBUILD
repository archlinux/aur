# Maintainer: richc <admin+aur@sys.corbet.ch>
pkgname=llama.cpp-intel-bin
pkgver=b9870
pkgrel=1
pkgdesc="llama.cpp with Intel SYCL (Arc GPU) and OpenVINO (NPU/CPU/GPU) — official precompiled binaries, no compilation"
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
provides=('llama.cpp' 'libggml' 'ggml')
conflicts=('llama.cpp' 'llama.cpp-openvino' 'llama.cpp-sycl-f16' 'llama.cpp-vulkan'
           'llama.cpp-cuda' 'llama.cpp-bin' 'llama.cpp-git' 'libggml' 'ggml')
depends=('glibc' 'gcc-libs' 'curl')
makedepends=('patchelf')
optdepends=(
  'intel-oneapi-basekit-2025: required for SYCL backend (Intel Arc GPU)'
  'intel-npu-driver: required for OpenVINO NPU backend'
)
noextract=(
  "llama-${pkgver}-sycl-fp16.tar.gz"
  "llama-${pkgver}-openvino.tar.gz"
)
source=(
  "llama-${pkgver}-sycl-fp16.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-sycl-fp16-x64.tar.gz"
  "llama-${pkgver}-openvino.tar.gz::https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-openvino-2026.2.1-x64.tar.gz"
)
sha256sums=(
  '77194249f0c800c26230c1ce919e282ab59647b75f8c9fc3e3f5ed59ab711d3a'
  'e6892a3531d70d079803075c8cfef9429a9f55510f58e39e8eb10ed84da3e18b'
)

prepare() {
  mkdir -p sycl openvino
  bsdtar -xf "llama-${pkgver}-sycl-fp16.tar.gz" -C sycl
  bsdtar -xf "llama-${pkgver}-openvino.tar.gz" -C openvino
}

build() {
  local sycl="$srcdir/sycl/llama-${pkgver}"
  local ov="$srcdir/openvino/llama-${pkgver}"

  # Detect the active oneAPI lib directory (MKL/DNN/SYCL runtime).
  # intel-oneapi-basekit doesn't add an ldconfig entry, so we bake the path into RPATH.
  local oneapi_lib oneapi_compiler_lib
  oneapi_lib=$(dirname "$(find /opt/intel/oneapi -maxdepth 3 -name "libdnnl.so.3" \
    ! -path "*/dnnl/*/lib/*" | head -1)")
  oneapi_compiler_lib="$(dirname "$oneapi_lib")/opt/compiler/lib"

  # SYCL libs: find siblings ($ORIGIN) + oneAPI runtime (MKL/DNN are deps of libggml-sycl)
  find "$sycl" -maxdepth 1 -name "*.so*" -type f \
    -exec patchelf --set-rpath "\$ORIGIN:${oneapi_lib}:${oneapi_compiler_lib}" {} +

  # OpenVINO libs: self-contained, siblings only
  find "$ov" -maxdepth 1 -name "*.so*" -type f \
    -exec patchelf --set-rpath '$ORIGIN' {} +

  # SYCL executables go to /usr/bin — reach bundle libs + oneAPI runtime
  find "$sycl" -maxdepth 1 -type f -executable ! -name "*.so*" \
    -exec patchelf --set-rpath "/usr/lib/llama-sycl:${oneapi_lib}:${oneapi_compiler_lib}" {} +

  # OpenVINO executables stay in /usr/lib/llama-openvino — $ORIGIN is enough
  find "$ov" -maxdepth 1 -type f -executable ! -name "*.so*" \
    -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
  local sycl="$srcdir/sycl/llama-${pkgver}"
  local ov="$srcdir/openvino/llama-${pkgver}"

  # SYCL: libs → /usr/lib/llama-sycl/, executables → /usr/bin/
  install -d "$pkgdir/usr/lib/llama-sycl"
  find "$sycl" -maxdepth 1 -name "*.so*" -exec cp -dP {} "$pkgdir/usr/lib/llama-sycl/" \;
  install -d "$pkgdir/usr/bin"
  find "$sycl" -maxdepth 1 -type f -executable ! -name "*.so*" \
    -exec install -m755 {} "$pkgdir/usr/bin/" \;

  # OpenVINO: libs + executables → /usr/lib/llama-openvino/ (launchers use this directly)
  install -d "$pkgdir/usr/lib/llama-openvino"
  find "$ov" -maxdepth 1 -name "*.so*" -exec cp -dP {} "$pkgdir/usr/lib/llama-openvino/" \;
  find "$ov" -maxdepth 1 -type f -executable ! -name "*.so*" \
    -exec install -m755 {} "$pkgdir/usr/lib/llama-openvino/" \;

  install -Dm644 "$sycl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
