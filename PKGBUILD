# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.55.0
_pkgver=4.191.2
pkgrel=1
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
optdepends=('python-boto: Object Storage plugin')
replaces=("${pkgname}-dev")
install="${pkgname}".install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname%%-*}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://raw.githubusercontent.com/${pkgname%%-*}/${pkgname%%-*}-api-docs/refs/heads/development/openapi.yaml")
sha512sums=('e2a993003bcd2f4732f0c4636cbc7977b3218e7bcd0533e7d39fcd6f19958f968d05c2bdfd4ce10620d1cc384a914355455356cb23c3dc2fa35268be040bf2b3'
            '16a06b86b80348242932ac1c80e093971922d16766e72fb3a41a18222afd3470672489a60a5b74190c74802ca76493a3c679809ad106b4b217f1709f86cbc2e4')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/\(__version__ = \)\".*\"/\1\"${pkgver}\"/" linodecli/version.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m linodecli bake ../${pkgname}-${_pkgver}-openapi.yaml --skip-config
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
