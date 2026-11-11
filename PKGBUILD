# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/Mesh-LLM/mesh-llm/releases/tag/v0.79.0
pkgname=mesh-llm-rocm
pkgdesc="Mesh LLM lets you pool spare GPU capacity across machines and expose the result as one OpenAI-compatible API."
pkgver=0.79.0
_pkgver=0.79.0
pkgrel=1
arch=('x86_64')
url='https://github.com/Mesh-LLM/mesh-llm'
license=('Apache-2.0')
makedepends=('just' 'cmake' 'mold' 'pnpm' 'cargo' 'sccache')
depends=('rocm-hip-sdk' 'patchelf')
provides=('mesh-llm' 'mesh-llm-rocm')
conflicts=('mesh-llm-cuda' 'mesh-llm-vulkan')
options=('!debug' '!lto')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/Mesh-LLM/mesh-llm/archive/refs/tags/v${_pkgver}.tar.gz"
)

sha256sums=(
'60666ab66e50844a658ac0dbbdd9ad206ef7927275e6050619f1634ba96ab569'
)

build() {
  # export ROCM_PATH=/opt/rocm/core
  # export HIP_PATH=/opt/rocm/core
  # export CMAKE_PREFIX_PATH=/opt/rocm/core
  export RUSTUP_TOOLCHAIN=stable
  cd $srcdir/mesh-llm-${_pkgver}
  just release-build-rocm
}

package() {  
  cd $srcdir/mesh-llm-${_pkgver}
  install -Dm0755 target/release/mesh-llm "$pkgdir/usr/bin/mesh-llm"
  # install -Dm0755 target/debug/mesh-llm "$pkgdir/usr/bin/mesh-llm"
}
