# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
pkgname=inkscape-paths2openscad
pkgver=0.27_2
pkgrel=1
pkgdesc='Inkscape extension for converting SVG paths to OpenSCAD'
arch=('any')
url='https://github.com/fablabnbg/inkscape-paths2openscad'
license=('GPL2')
depends=('inkscape' 'python' 'python-lxml')
makedepends=('python-future')
optdepends=('cura: default slicer for STL post-processing'
            'openscad: to view .scad files')
source=("https://github.com/fablabnbg/inkscape-paths2openscad/releases/download/v${pkgver%_*}/inkscape-paths2openscad_${pkgver/_/-}_all.deb")
sha256sums=('59a62047512f45616c2c8fa30cb1cc57d591bba36d32c46f009d283535fff389')

prepare() {
  # Extract package data
  mkdir extract
  bsdtar -xf data.tar.xz -C extract

  cd extract/usr/share/inkscape/extensions

  # Make extension Python 3 compatible
  futurize -nw1 --no-diffs paths2openscad.py
  2to3 -x future -nw --no-diffs paths2openscad.py
}

package() {
  cd extract
  install -d "${pkgdir}/usr/share"
  cp -r usr/share/inkscape "${pkgdir}/usr/share"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" usr/share/doc/inkscape-paths2openscad/LICENSE
}
