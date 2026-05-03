# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Maintainer: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=4.1.0
pkgrel=2
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
sha256sums=('a61bc0c8e8a7db5302ef4f4f1ebc834bb9dcf2896b0e2af746f25a0d4177d8d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local options=(
    --buildtype=release
    --prefix=/usr
    -Db_pie=true
    -Dwarning_level=0  # avoid comilation error due to -Wall, see https://github.com/dftd4/dftd4/issues/294
  )
  meson setup _build_${CARCH} . "${options[@]}" --wipe
  meson compile -C _build_${CARCH}
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson test -C _build_${CARCH} --num-processes=1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" \
  meson install -C _build_${CARCH}
}
