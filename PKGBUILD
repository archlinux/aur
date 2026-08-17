# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>

pkgname=openscad-gridfinity-rebuilt
pkgver=2.0.0
pkgrel=2
pkgdesc='Ground-up rebuild of the stock Gridfinity bins in OpenSCAD'
arch=('any')
url='https://github.com/kennetek/gridfinity-rebuilt-openscad'
license=('MIT')

depends=(
  # For the rationale behind the -git dependency, see:
  # https://github.com/kennetek/gridfinity-rebuilt-openscad/issues/319#issuecomment-3708139416
  'openscad-git'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kennetek/gridfinity-rebuilt-openscad/archive/${pkgver}.tar.gz"
)

sha512sums=(
  '15cbe4aa7974a456ab08d55d86136b44086b2061eada51e53c9cb92d91fe0e33c6100cb9dc2db16ebd590714139d66604f2b2fea17693f70fec0ee3d84ffec58'
)

prepare() {
  cd "gridfinity-rebuilt-openscad-${pkgver}"

  echo >&2 'Fixing paths in example scripts'
  sed -i -E -e 's#^((include|use) <)src/#\1gridfinity-rebuilt/#' -- \
    *.scad
}

package() {
  cd "gridfinity-rebuilt-openscad-${pkgver}"

  echo >&2 'Packaging the scripts'
  mkdir -p "${pkgdir}/usr/share/openscad"/{examples,libraries}
  cp -R --preserve=mode -T src \
    "${pkgdir}/usr/share/openscad/libraries/gridfinity-rebuilt"

  echo >&2 'Packaging examples'
  install -D -m 644 \
    -t "${pkgdir}/usr/share/openscad/examples/Gridfinity Rebuilt" -- \
    *.scad
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  ln -ns /usr/share/openscad/examples/'Gridfinity Rebuilt' \
    "${pkgdir}/usr/share/${pkgname}/examples"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
