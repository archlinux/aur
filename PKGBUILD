# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python38-jsonschema
pkgver=4.17.0
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=('any')
url='https://github.com/python-jsonschema/jsonschema'
license=('MIT')
depends=(
  'python38'
  'python38-attrs'
  'python38-pyrsistent'
  'python38-typing_extensions'
)
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-hatchling'
  'python38-hatch-vcs'
  'python38-hatch-fancy-pypi-readme'
)
checkdepends=(
  'python38-pip'
  'python38-twisted'
  'python38-isoduration'
  'python38-fqdn'
  'python38-idna'
  'python38-jsonpointer'
  'python38-rfc3339-validator'
  'python38-rfc3987'
  'python38-uri-template'
  'python38-webcolors'
)
optdepends=(
  'python38-isoduration: for duration format'
  'python38-fqdn: for hostname format'
  'python38-idna: for idn-hostname format'
  'python38-jsonpointer: for json-pointer & relative-json-pointer format'
  'python38-rfc3339-validator: for date-time format'
  'python38-rfc3987: for iri, iri-reference, uri & uri-reference format'
  'python38-uri-template: for uri-template format'
  'python38-webcolors: for color format'
)
_commit='7448523b98dcc8498a5add4bea34a8c89109b885'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python3.8 -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" \
    JSON_SCHEMA_TEST_SUITE=json trial jsonschema
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" json/LICENSE
}
