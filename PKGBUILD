# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>
# Contributor: Sebastian Ehlert  <awvwgk at gmail dot com>

pkgname=dftd4
pkgver=4.3.1
pkgrel=1
arch=('x86_64')
url='https://github.com/dftd4/dftd4'
depends=('blas'
         'lapack')
makedepends=('asciidoctor'
             'gcc-fortran'
             'git'
             'meson'
             'ninja'
             'python-cffi'
             'python-setuptools')
license=('LGPL-3.0')
pkgdesc='A Generally Applicable Atomic-Charge Dependent London Dispersion Correction'
source=("dftd4-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01651dd3df06f0875ed4e710ee82f7dcb621edb262d6d22068dea818b915f5da')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson subprojects download --sourcedir=.
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local options=(
    --buildtype=plain
    --prefix=/usr
    # --wrap-mode=nodownload
    --auto-features=enabled
    -Db_pie=true
    -Dwarning_level=0  # avoid comilation error due to -Wall, see https://github.com/dftd4/dftd4/issues/294
  )
  meson setup _build_${CARCH} . "${options[@]}"
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
