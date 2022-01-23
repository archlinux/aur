# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=0.10.1
pkgrel=4
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python-cerberus python-packaging python-pyparsing python-toml)
makedepends=(python-build python-install)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${pkgname}-0.10.1-devendor.patch"
)
sha512sums=('a02d3d3262ec62dbe44fdd66b6f08c911f1760814da275ffb9f6a6356371738cff85d3917525752e2d174ec4f00ba235ecc5c27f41af8230b2522ce9b033c31f'
            'ac065d7ce661dec7c1f0e506539a3829f80183742178704fe71a476d72b9f48ff81083fb9c83fbf044063686bf321abdc3de830ff1d320f30c14c04cb3da7894')
b2sums=('954338341652557b2baa1415d9274c8c7c204b3a65211b40316ec09d7b824a63038f30e620bca2d8bb38d70e68b7e4c9bd7ce06432e987923665f3a88de373a9'
        '1b6f12f0da26ad96afd40a9cad000bba2cf191ff801e81868db861e1d3723f02644f97b4289ca89d605083cb1663590a62fe93b5e789dcd8472876b0caa14db8')

prepare() {
  cd "$_name-$pkgver"
  # remove vendoring of python-cerberus, python-packaging, python-pyparsing and python-toml
  patch -Np1 -i ../"${pkgname}-0.10.1-devendor.patch"
  rm -frv pdm/pep517/_vendor
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # set default git config for test
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
  PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd "$_name-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
