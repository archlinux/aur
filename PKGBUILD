# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

pkgname=remarshal
pkgver=0.14.0
pkgrel=1
pkgdesc="Convert between TOML, YAML and JSON"
arch=('any')
url="https://github.com/dbohdan/remarshal"
license=('MIT')
depends=('python-cbor2' 'python-dateutil' 'python-pytoml' 'python-yaml' 'python-u-msgpack' 'python-setuptools')
makedepends=('python-poetry' 'python-pip')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dbohdan/remarshal/archive/v${pkgver}.tar.gz")
sha256sums=('25567516f4b1befdd6603b7aaa2a98cd5e6a429bb6138b485cc1c4a0ee6c7dc7')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  export HOME=$(mktemp -d) # Don't create a virtual environment inside the user's home dir
  poetry build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  INSTALL_PATH="${srcdir}/${pkgname#python-}-${pkgver}/dist/remarshal-${pkgver}-*.whl"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location $INSTALL_PATH

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
