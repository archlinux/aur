# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.70.0
_pkgver=release-20261028
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
sha512sums=('2a0cc05c212316ce744064d893460eba04cc86d63f148fccdfcbecbecec146b1ad275e43007dffa731e52a219f21b3162cc5e289f61592a4422cce9af4516ed2'
            '7abb5b53d96409fae5aabda6b38d9b3ee4d801e6fdafdde56863bd61e8e01a11089c17d2931e52a83eaa1fb2ca28b110bafc045efeb8886131568c15d61bf219')

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
