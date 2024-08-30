# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ftsell <aur@finn-thorben.me>

_name="exhale"
pkgname="python-${_name}"
pkgver=0.3.7
pkgrel=1
pkgdesc="A sphinx extension which integrates breathe to enable parsing of doxygen documentation"
arch=('any')
url="https://github.com/svenevs/${_name}"
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools>=42')
depends=('python>=3.8' 'python-breathe>=4.33.1' 'python-sphinx>=4.3.2'
         'python-beautifulsoup4' 'python-lxml' 'python-six' 'python-pygments')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8493720652da6fead6aa91893a024ea727f72f68b8ccaa17a6fa9b6d489efa38')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
