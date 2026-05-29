# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.68.0
_pkgver=release-20260527
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://techdocs.akamai.com/cloud-computing/docs/cli"
license=('BSD-3-Clause'
         'Apache-2.0')
depends=('python-openapi3'
         'python-requests' 
         'python-rich'
         'python-setuptools'
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-boto3: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname%%-*}-api-openapi/archive/refs/tags/${_pkgver}.tar.gz")
noextract=("${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz")
sha512sums=('78a5edb6de7bc0544169e657c505542a307571256befc3a070ac04874c4213e9c84a2556be6d894409719bd6fa8edf52edefa42a679bc226207669e261a9bf1c'
            '8e8fa299edee74a67afb015fa605d77919849fc8802ef139e0162bfb04d72f64ee3bd561250d5a53d2dd5a280c879ba38e7ff50c3c5f1da186c36b48d82aaeb9')

prepare() {
  # Extract API spec
  bsdtar -zvxf "${pkgname%%-*}-api-openapi-${_pkgver}.tar.gz" "${pkgname%%-*}-api-openapi-${_pkgver}/openapi.json"
  mv "${pkgname%%-*}-api-openapi-${_pkgver}/openapi.json" "${pkgname}-${pkgver}/openapi.json"

  # Fix version number
  cd "${pkgname}-${pkgver}"
  sed -i "s/\(__version__ = \)\".*\"/\1\"${pkgver}\"/" linodecli/version.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m linodecli bake openapi.json --skip-config
  cp data-3 linodecli/
  python -m linodecli completion bash > "${pkgname}.sh"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm0644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.sh" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
