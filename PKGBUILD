# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.65.1
_pkgver=4.215.0-patch.1
pkgrel=2
pkgdesc="Linode API wrapper"
arch=('any')
url="https://techdocs.akamai.com/cloud-computing/docs/cli"
license=('BSD-3-Clause')
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
        "${pkgname%%-*}-api-docs-${_pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname%%-*}-api-docs/archive/refs/tags/${_pkgver}.tar.gz")
noextract=("${pkgname%%-*}-api-docs-${_pkgver}.tar.gz")
sha512sums=('3f721779b8dd16983659ccc5a3ce76a5a146c24cb2322c8ff19e2906f97c49f93c9d35baa683603d577410eb461515d730b43a1693f452e11a4f6e95c08095cf'
            '08f436727e45203ab4c0faf65c77b0450c7c796a6458ef8efcf911cfcccc643ec0afaaca8f807f86a11f5a5f9f41e3f65cfdf06c87cf8a2e4bcc67369aad426f')

prepare() {
  # Extract API spec
  bsdtar -zvxf "${pkgname%%-*}-api-docs-${_pkgver}.tar.gz" "${pkgname%%-*}-api-docs-${_pkgver}/openapi.json"
  mv "${pkgname%%-*}-api-docs-${_pkgver}/openapi.json" "${pkgname}-${pkgver}/openapi.json"

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
