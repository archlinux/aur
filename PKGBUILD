# Maintainer: robertfoster
pkgbase="local-ai"
_pkgname=LocalAI
pkgname=(
  "${pkgbase}"
  "${pkgbase}-cublas"
  "${pkgbase}-clblas"
  "${pkgbase}-hipblas"
)
pkgver=2.10.1
pkgrel=2
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/conf.d/${pkgname}.conf")
depends=('glibc')
conflicts=("${pkgbase}")
provides=("${pkgbase}")
options=('!strip')
makedepends=(
  'c-ares'
  'clblast'
  'ccache'
  'cmake'
  'cuda'
  'git'
  'go'
  'grpc'
  'make'
  'openmpi'
  'openssl'
  'openblas'
  're2'
  'rocm-hip-sdk'
  'upx'
)
source=("${pkgbase}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgbase}.conf"
  "${pkgbase}.tmpfiles"
  "${pkgbase}.sysusers"
  "${pkgbase}.service"
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make get-sources

  if [ ! -d "${srcdir}/${pkgbase}-cublas" ]; then
    cp -rf "${srcdir}/${_pkgname}-${pkgver}" \
      "${srcdir}/${pkgbase}-cublas"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}" \
      "${srcdir}/${pkgbase}-openblas"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}" \
      "${srcdir}/${pkgbase}-clblas"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}" \
      "${srcdir}/${pkgbase}-hipblas"
  fi

  # disable clang unknown argument
  sed -i 's/-fopt-info-vec-optimized//g' \
    "${srcdir}/${pkgbase}-hipblas/sources/go-tiny-dream/Makefile"
}

build() {
  export GO_TAGS="tinydream"

  echo "Build ${pkgbase} with OPENBlas"
  cd "${srcdir}/${pkgbase}-openblas"
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
}

_package() {
  install -Dm775 "${pkgbase}" -t "${pkgdir}/usr/bin/"

  install -D -m644 "${srcdir}/${pkgbase}.conf" \
    "${pkgdir}/etc/conf.d/${pkgbase}.conf"

  upx "${pkgdir}/usr/bin/${pkgbase}"
  mkdir -p "${pkgdir}/etc/local-ai"

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
  cd "${srcdir}/${pkgbase}-openblas"
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

sha256sums=('abbeb3dc29642ff40bdd360cabea95a8c954197c3b9e5483959cc2bd221bd224'
  '095c6f530c0c2f864d7aa1c22b88e111b1adc54c85e3510156dcc5b6675de00c'
  '90e042d0f5885b63a6aa4db7f87d6b931956f6c9b022407593466f61f6973312'
  '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
  'affefb565e63f19fbdad53032c090fc33c2aa8ce986ba9cf678ccf071c2d67bf')
