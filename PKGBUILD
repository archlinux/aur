# Maintainer: robertfoster
pkgbase="local-ai"
_pkgname=LocalAI
pkgname=(
  "${pkgbase}"
  "${pkgbase}-cublas"
  "${pkgbase}-clblas"
  "${pkgbase}-hipblas"
  "${pkgbase}-sycl-f16"
  "${pkgbase}-sycl-f32"
)
pkgver=2.17.1
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${pkgbase}/${pkgbase}.conf")
depends=('glibc')
conflicts=("${pkgbase}")
provides=("${pkgbase}")
options=('!strip')
makedepends=(
  'c-ares'
  'clblast'
  'cmake'
  'cuda'
  'git'
  'go'
  'grpc'
  'intel-oneapi-basekit'
  'make'
  'openblas'
  'openmpi'
  'openssl'
  're2'
  'rocm-hip-sdk'
  'upx'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgbase}.conf"
  "${pkgbase}.tmpfiles"
  "${pkgbase}.sysusers"
  "${pkgbase}.service"
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make get-sources

  for _pkg in "${pkgname[@]}"; do
    if [ ! -d "${srcdir}/${_pkg}" ]; then
      cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkg}"
    fi
  done
}

build() {
  export GO_TAGS="tinydream"

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${pkgbase}"
  BUILD_TYPE=openblas make build -j"$(nproc)"

  echo "Build ${pkgbase} with OpenCL"
  cd "${srcdir}/${pkgbase}-clblas"
  BUILD_TYPE=clblas make build -j"$(nproc)"

  echo "Build ${pkgbase} with CUBlas (NVIDIA CUDA)"
  cd "${srcdir}/${pkgbase}-cublas"
  export CUDA_HOME="/opt/cuda"
  export PATH="$CUDA_HOME/bin:$PATH"
  BUILD_TYPE=cublas CUDA_LIBPATH=/opt/cuda/targets/x86_64-linux/lib \
    make build -j"$(nproc)"

  echo "Build ${pkgbase} with HIPBlas (AMD ROCm)"
  cd "${srcdir}/${pkgbase}-hipblas"
  export CXXFLAGS+="$CXXFLAGS -fcf-protection=none"
  BUILD_TYPE=hipblas make build -j"$(nproc)"

  echo "Build ${pkgbase} with Intel SYCL (f16)"
  source /opt/intel/oneapi/setvars.sh
  cd "${srcdir}/${pkgbase}-sycl-f16"
  BUILD_TYPE=sycl_f16 make build -j"$(nproc)"

  echo "Build ${pkgbase} with Intel SYCL (f32)"
  source /opt/intel/oneapi/setvars.sh
  cd "${srcdir}/${pkgbase}-sycl-f32"
  BUILD_TYPE=sycl_f32 make build -j"$(nproc)"
}

_package() {
  install -Dm775 "${pkgbase}" -t "${pkgdir}/usr/bin/"

  install -D -m644 "${srcdir}/${pkgbase}.conf" \
    "${pkgdir}/etc/${pkgbase}/${pkgbase}.conf"

  upx "${pkgdir}/usr/bin/${pkgbase}"

  # systemd
  install -D -m644 "${srcdir}/${pkgbase}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgbase}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
  install -D -m644 "${srcdir}/${pkgbase}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
}

package_local-ai() {
  pkgdesc="$pkgdesc (with OPENBlas CPU optimizations)"
  depends+=('openblas')
  provides=("${pkgbase}=${pkgver}")
  cd "${srcdir}/${pkgbase}"
  _package
}

package_local-ai-clblas() {
  pkgdesc="$pkgdesc (with OpenCL optimizations)"
  depends+=('clblast')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}-clblas"
  _package
}

package_local-ai-cublas() {
  pkgdesc="$pkgdesc (with NVIDIA CUDA optimizations)"
  depends+=('cuda')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}-cublas"
  _package
}

package_local-ai-hipblas() {
  pkgdesc="$pkgdesc (with AMD ROCm optimizations)"
  depends+=('rocm-hip-runtime')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}-hipblas"
  _package
}

package_local-ai-sycl-f16() {
  pkgdesc="$pkgdesc (with Intel SYCL GPU optimizations and F16)"
  depends+=('intel-oneapi-basekit')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}-sycl-f16"
  _package
}

package_local-ai-sycl-f32() {
  pkgdesc="$pkgdesc (with Intel SYCL GPU optimizations and F32)"
  depends+=('intel-oneapi-basekit')
  provides=("${pkgbase}=${pkgver}")
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}-sycl-f32"
  _package
}

sha256sums=('b5b091d9c5c948923310b6dd518b5629249548ad34df7dc189fd88262635f258'
  '095c6f530c0c2f864d7aa1c22b88e111b1adc54c85e3510156dcc5b6675de00c'
  '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
  '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
  'bd420ec530cbfdb7f29b309e3c0c8cd72de6346b7c8e9882e917a071c65b344c')
