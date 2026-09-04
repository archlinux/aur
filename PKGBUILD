# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

pkgname=vectorscan-docs
_name=${pkgname%%-docs}
pkgver=5.4.13
pkgrel=2
pkgdesc='API and developer documentation for vectorscan, a portable hyperscan fork'
arch=('any')
url='https://github.com/VectorCamp/vectorscan'
license=('BSD-3-Clause')

makedepends=(
  'boost'
  'cmake'
  'doxygen'
  'ninja'
  'python'
  'python-breathe'
  'python-sphinx'
  'ragel'
  'simde'
)

source=(
  "${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_name}/${pkgver}.tar.gz"
  "fix-makefile-for-documentation.patch"
)
b2sums=('7d229b100e99d1b4dae0d62d5449074f0a0b7166e2c183db0641adaec38fad4f216dea22b550802e203afc065175d0a4656c770d9405a03363a2586776da9ff8'
        'b9d0fb1559a050ca0d4210b9587618e469303dc0044c6ccf289c5bfecb8ab03b268de6d3b8005eb042ceaaab1335ed1dbe3b2434a4b8409b58782080193dd382')

prepare() {
  cd "${srcdir}/${_name}-${_name}-${pkgver}"
  echo "Patching Makefile (see https://github.com/VectorCamp/vectorscan/issues/411)"
  patch -p1 < ../fix-makefile-for-documentation.patch
}

build() {
  cd "${srcdir}/${_name}-${_name}-${pkgver}"

  cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOCS=ON \
    -Wno-author

  cmake --build build --target dev-reference dev-reference-man 
}

package() {
  cd "${srcdir}/${_name}-${_name}-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm 644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  cd "build/doc/dev-reference/"

  mkdir -p "${pkgdir}/usr/share/man/man7/"
  install -v -Dm644 "./man/${_name}.7" -t "${pkgdir}/usr/share/man/man7/$_name"
  mkdir -p "${pkgdir}/usr/share/doc/$_name/html"
  find html -maxdepth 1 -type f -name "*.html" |
    while IFS="" read -r html_file; do
      install -v -Dm644 "$html_file" -t "${pkgdir}/usr/share/doc/$_name/html/" 
    done
  find html -maxdepth 1 -type f -name "*.js" |
    while IFS="" read -r html_file; do
      install -v -Dm644 "$html_file" -t "${pkgdir}/usr/share/doc/$_name/html/" 
    done
  cp -r "html/_static" "${pkgdir}/usr/share/doc/$_name/html/"
}
