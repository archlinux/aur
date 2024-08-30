# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sphinx_issues"
pkgname="python-${_name}"
pkgver=4.1.0
pkgrel=1
pkgdesc="A Sphinx extension for linking to your project's issue tracker"
arch=('any')
url="https://github.com/sloria/${_name//_/-}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-flit-core')
depends=('python>=3.8' 'python-sphinx' 'python-docutils')
_pkgsrc="${_name//_/-}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c68af6156d1071bfd12398243cb72808d05a1cc812aa5d3f12df8ebe5a70e0ee')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
