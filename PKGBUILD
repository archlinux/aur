# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.22.1
_mover=1
_pkgtag="${_pkgver}-mo${_mover}"
pkgname="xmrig-mo-cuda"
pkgver="${_pkgver}mo${_mover}"
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.17.0' 'cuda>=11.8' 'nvidia-utils')
makedepends=('cmake' 'openssl')
optdepends=('monero: wallet')
license=('GPL-3.0-only')
source=("${url}/archive/v${_pkgtag}.tar.gz"
        "fix-cryptonight.patch"
        "patch-cuda13.patch")
sha256sums=('cb876f936dc1d10e4b84877290db6bee39dca12ab777354b01a2d5b915a63a0d'
            '668a954c1c127652cf693c96d05b928bd0e3c1126afcff26e1168d59b19543d2'
            'b43d0d5b576c288e15186d511688ca05c181866cd29b7cdc6764e36ade65e6ed')
# Small flexible block for switching GCC
_gccver=""
if [ -n "$_gccver" ]; then
  depends+=("gcc${_gccver}-libs")
  makedepends+=("gcc${_gccver}")
fi

prepare () {
  cd "${_pkgname}-${_pkgtag}"

  patch -Np1 -i "${srcdir}/fix-cryptonight.patch"
  # Fix CUDA 13.x: clockRate/memoryClockRate members removed from cudaDeviceProp
  # Use cudaDeviceGetAttribute instead
  patch -Np1 -i "${srcdir}/patch-cuda13.patch"

  _extra_cmake_flags=""
  if [ -n "$_gccver" ]; then
    _extra_cmake_flags="-DCMAKE_C_COMPILER=gcc-${_gccver} -DCMAKE_CXX_COMPILER=g++-${_gccver}"
  fi

  # Current CUDA detection mechanism add CUDA targets that may be unsupported.
  # See `src/cmake/CUDA.cmake`.
  # This command overrides its detection and sets the CUDA architecture to be the one supported by nvcc.
  _cuda_archs=$(nvcc -arch-ls 2>/dev/null | sed 's/compute_//g' | grep -E '^[7-9][0-9]$|^1[0-3][0-9]$' | tr '\n' ';' | sed 's/;$//')
  _extra_cmake_flags="${_extra_cmake_flags} -DCUDA_ARCH=${_cuda_archs}"

  cmake -S . -B build -Wno-author ${_extra_cmake_flags}
}

build() {
  cd "${_pkgname}-${_pkgtag}"

  cmake --build build
}

package() {
  cd "${_pkgname}-${_pkgtag}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
