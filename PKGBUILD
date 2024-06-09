# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com> 
# Contributor: Slithery <aur [at] slithery [dot] uk>

pkgname=linode-cli
pkgver=5.50.0
_pkgver=4.176.0
pkgrel=1
pkgdesc="Linode API wrapper"
arch=('any')
url="https://github.com/${pkgname%%-*}/${pkgname}"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${_pkgver}-openapi.yaml::https://www.${pkgname%%-*}.com/docs/api/openapi.yaml")
sha512sums=('c4428f05b62c657b174c385604d47e3204a7355a041de91f17bd4521d1446cf1e84b1e9be5d89131bede23555070f49528b2d756902ea3f7768186788d926c4d'
            '00808e5df21a45cfe3344e20457f7fc75d69ce460d396e549d06ec6695782a249dfcd8c3be6d750e5758997678d7187c6b71886e5e382c3f6d73cbbd7381d95a')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s/\(__version__ = \)\".*\"/\1\"${pkgver}\"/" linodecli/version.py
}

build() {
  cd "${pkgname}-${pkgver}"
  python \
    -m linodecli bake ../${pkgname}-${_pkgver}-openapi.yaml \
    --skip-config
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
