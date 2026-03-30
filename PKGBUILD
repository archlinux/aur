# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="spm"
pkgname="matlab-${_name}"
pkgver=25.01.02
pkgrel=3
pkgdesc="Suite of MATLAB functions, scripts, and data files, implementing Statistical Parametric Mapping"
arch=(
  'x86_64'
)
url="https://www.fil.ion.ucl.ac.uk/spm/"
_url="https://github.com/${_name}/${_name}"
license=(
  'GPL-2.0-only'
)
depends=(
  'bash'
  'glibc'
  'libgcc'
  'libstdc++'
  'matlab'
)
makedepends=(
  'matlab-gcc'
)
_pkgsrc="${_url##*/}_${pkgver}"
source=(
  "${_url}/releases/download/${pkgver}/${_pkgsrc}.zip"
)
noextract=(
  "${source[0]##*/}"
)
sha256sums=('562c8036aa11c0d2cfe0fbff123f482c3ec8cb5ef56be521af26caae5481db2a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}"
  bsdtar -xf "${_pkgsrc}.zip" --strip-components=1 -C "${_pkgsrc}"

  cd "${_pkgsrc}"
  find . -type f -name '*.mex*' ! -name '*.mexa64' -delete

  cd "src"
  sed -e "s^largeArrayDims$^& CFLAGS=\"${CFLAGS} -fPIC\" CXXFLAGS=\"${CXXFLAGS} -fPIC\" LDFLAGS=\"${LDFLAGS}\"^g" \
      -i 'Makefile.var'
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  # make clean
  make MEXBIN="matlab-mex"
  make install

  cd "${srcdir}/${_pkgsrc}/external"
  # make clean
  make MEXBIN="matlab-mex"
  make install
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vd "${pkgdir}/usr/lib/${pkgname}"
  find . -type d -name src -prune -o \
         -type f -name 'Makefile*' -prune -o \
         -type f -exec cp -a --parents -t "${pkgdir}/usr/lib/${pkgname}" {} +

  install -vd "${pkgdir}/usr/bin"
  # ln -vsf "/usr/lib/${pkgname}/bin/spm" "${pkgdir}/usr/bin/spm"
  ln -vsf "/usr/lib/${pkgname}/bin/spm-matlab" "${pkgdir}/usr/bin/spm-matlab"
}
