# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="febio"
pkgver=4.12
pkgrel=1
pkgdesc="Nonlinear finite element (FE) solver that is specifically designed for biomechanical applications"
arch=(
  'x86_64'
)
url="https://febio.org"
_url="https://github.com/febiosoftware/FEBio"
license=(
  'MIT'
)
depends=(
  'fftw'
  'glibc'
  'hypre'
  # 'intel-oneapi-mkl'
  'levmar'
  'libgomp'
  'mmg'
  'zlib'
)
makedepends=(
  'cmake>=3.10'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}_gcc15_include_cstring.patch::${_url}/pull/92.patch?full_index=1"
  "${pkgname}_cmake.patch"
)
sha256sums=('4f21454e2c3c497c7cf85263b0eb080329039297eeb21265121ae67cdb4f64af'
            'c4d712939b57bb37d77f49fb36e6bb903ab21a0c2b1f805ed1b38865f6765dd5'
            '4c9e330c92c53792025fd0cc68afd3fbbcf22cb56853cedda59347f39b16c732')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_include_cstring.patch"
  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/fe/febio/fix-cmake.patch
  patch -Np1 -i "${srcdir}/${pkgname}_cmake.patch"
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
	  -D USE_FFTW:BOOL=ON
	  -D USE_HYPRE:BOOL=ON
	  -D USE_LEVMAR:BOOL=ON
	  -D USE_MKL:BOOL=OFF
	  -D USE_MMG:BOOL=ON
	  -D USE_ZLIB:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
