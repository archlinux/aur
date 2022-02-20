# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pdm-pep517
pkgname=python-pdm-pep517
pkgver=0.10.2
pkgrel=4
pkgdesc="A PEP 517 backend for PDM that supports PEP 621 metadata"
arch=(any)
url="https://github.com/pdm-project/pdm-pep517"
license=(MIT)
depends=(python-cerberus python-packaging python-toml)
makedepends=(python-build python-installer)
checkdepends=(git python-pytest python-setuptools)
optdepends=(
  'python-setuptools: for setuptools support'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "${pkgname}-0.10.2-devendor.patch"
)
sha512sums=('e5fc0b0c61a0bdf07fc276222e121c5bdbc1288b01e43d133bd2ed7c0d5402322de748dd7202ecb9a6795058abfcc6a7b959a9f7c99e3010b6e3c21c3dbc7e6e'
            '25cea84fbb999190ddc2ca99d3550fb18f589aca13c75be39579f757ddbc7e9458a9707cb8164af9363d4ecccf4c5fe72d6b60ca53a94c061b222664a184fa11')
b2sums=('e539408432132a28b6ed9dfe89ed9599a6cf315626090298b7ad5e13f0d94b3f81b7e37eddcb9187748ae8cf34024b9281ef9976a1a44dbee19980d98bcc987a'
        '43d088928cb4bb4c1eb5cc780955fb41420912fbcaa302bba1935606f4a3f65720ce4ad8583be02e4e08b494fc857779e4790f0ed6ce82cdead85ab65de55bc5')

prepare() {
  cd "$_name-$pkgver"
  # remove vendoring of python-cerberus, python-packaging and python-toml
  patch -Np1 -i ../"${pkgname}-0.10.2-devendor.patch"
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
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
