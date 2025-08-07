# Maintainer: ThePirate42 <aur at thepirate42 dot org>

pkgname=datamodel-code-generator
pkgver=0.32.0
pkgrel=1
pkgdesc="Pydantic model and dataclasses.dataclass generator for easy conversion of JSON, OpenAPI, JSON Schema, and YAML data sources"
arch=('any')
url="https://github.com/koxudaxi/${pkgname}"
license=('MIT')
provides=(python-${pkgname})
conflicts=(python-${pkgname})
depends=(python python-argcomplete python-black python-genson python-inflect python-isort python-packaging python-jinja python-pydantic python-yaml python-tomli python-typing_extensions python-pydantic-core)
makedepends=(python-build python-installer python-hatchling python-hatch-vcs)
source=(${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('fd25c39baa343320352fd04480674aa221b5fec479b94fdafdb6e93535a26fa8c2b81f9ece248ec2bb7739e3ef29161f54f509ac9c831fc0867d84e061bf68d4')

build(){
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/datamodel_code_generator-${pkgver}.dist-info/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
