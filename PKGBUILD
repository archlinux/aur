# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="leptonica"
_so="5"
pkgname="${_basename}${_so}"
pkgver=1.82.0
pkgrel=2
pkgdesc="Software that is broadly useful for image processing and image analysis applications (so-version ${_so})"
arch=('i686' 'x86_64')
url="https://www.leptonica.com"
_url="https://github.com/DanBloomberg/${_basename}"
license=('custom')
depends=('giflib>=5.1' 'glibc' 'libjpeg' 'libpng' 'libtiff' 'libwebp>=0.5'
         'openjpeg2' 'zlib')
provides=("lib${_basename}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('40fa9ac1e815b91e0fa73f0737e60c9eec433a95fa123f95f2573dd3127dd669')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name 'Makefile.am' -exec \
    sed -e 's/liblept_/libleptonica_/g' \
        -e 's/liblept\./libleptonica\./g' \
        -i "{}" +
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="${_so}" \
    --includedir="/usr/include/${pkgname}" \
    --libdir="/usr/lib/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  install -vDm644 "leptonica-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/lib/${pkgname}"
  for lib in "lib${_basename}.so".*; do
    ln -vsf "/usr/lib/${pkgname}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
  for lib in "lib${_basename}.so"*; do
    ln -vsf "/usr/lib/${pkgname}/${lib}" "${pkgdir}/usr/lib/${lib//leptonica/lept}"
  done
}
