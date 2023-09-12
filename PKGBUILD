# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python-jsonschema4.17
_pyname=jsonschema
pkgver=4.17.3
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=('any')
url='https://github.com/python-jsonschema/jsonschema'
license=('MIT')
depends=(
  'python'
  'python-attrs'
  'python-pyrsistent'
  'python-typing_extensions'
)
makedepends=(
# 'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
  'python-hatch-fancy-pypi-readme'
)
checkdepends=(
  'python-pip'
  'python-twisted'
  'python-isoduration'
  'python-fqdn'
  'python-idna'
  'python-jsonpointer'
  'python-rfc3339-validator'
  'python-rfc3987'
  'python-uri-template'
  'python-webcolors'
)
optdepends=(
  'python-isoduration: for duration format'
  'python-fqdn: for hostname format'
  'python-idna: for idn-hostname format'
  'python-jsonpointer: for json-pointer & relative-json-pointer format'
  'python-rfc3339-validator: for date-time format'
  'python-rfc3987: for iri, iri-reference, uri & uri-reference format'
  'python-uri-template: for uri-template format'
  'python-webcolors: for color format'
)
provides=("python-jsonschema=${pkgver}")
conflicts=('python-jsonschema')
#_commit='dbc398245a583cb2366795dc529ae042d10c1577'
#source=("$pkgname-$pkgver::https://github.com/python-jsonschema/jsonschema/archive/refs/tags/v$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
b2sums=('a0383bf5612ae50e94c95dbc1774d796b62c74a7aae3056a40edb7e042ad07fd7885e61d86220120a906a4017afe30d8ee8edbbf0cf01a6dec1f212984ff1c1e')

#pkgver() {
#    cd "$pkgname-$pkgver"
#
#    git describe --tags | sed 's/^v//'
#}

build() {
    cd "$_pyname-$pkgver"

    python -m build --wheel --no-isolation
}

check() {
    cd "$_pyname-$pkgver"


    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    # install to temporary directory
    python -m installer --destdir="$PWD/tmp_install" dist/*.whl

    PYTHONPATH="$PWD/tmp_install$site_packages" \
        JSON_SCHEMA_TEST_SUITE=json trial jsonschema
}

package() {
    cd "$_pyname-$pkgver"


    python -m installer --destdir="$pkgdir" dist/*.whl

    # license
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" json/LICENSE
}
