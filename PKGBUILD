# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=4.0.1
pkgrel=1
arch=('x86_64')
url='https://github.com/dftd4/dftd4'
depends=('blas'
         'lapack')
makedepends=('meson'
             'ninja'
             'gcc-fortran'
             'asciidoctor')
license=('LGPL-3.0')
pkgdesc='A Generally Applicable Atomic-Charge Dependent London Dispersion Correction'
source=("https://github.com/dftd4/dftd4/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.xz")
sha256sums=('d3781763390c349794d70663e4e54e368d19a5869c98fe939b32e9069432201b')

build() {
  local options=(
    --buildtype=release
    --prefix=/usr
    -Db_pie=true
    -Dwarning_level=0  # avoid comilation error due to -Wall, see https://github.com/dftd4/dftd4/issues/294
  )
  meson setup _build_${CARCH} "${srcdir}/${pkgname}-${pkgver}" "${options[@]}"
  meson compile -C _build_${CARCH}
}

check() {
  meson test -C _build_${CARCH} --num-processes=1
}

package() {
  DESTDIR="$pkgdir" \
  meson install -C _build_${CARCH}
}
