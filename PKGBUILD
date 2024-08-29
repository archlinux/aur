# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="img2unicode"
pkgname="python-${_name}"
pkgver=0.1a11
_commit="3356b0cd46ddaa55e9ee1854d056f817d89b99f3"
pkgrel=1
pkgdesc="A tool to display images as Unicode in your terminal"
arch=('any')
url="https://github.com/matrach/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('python>=3.7' 'python-numpy1>=1.19' 'python-scikit-image>=0.19'
         'python-pillow' 'python-scikit-learn' 'python-click' 'python-six'
         'python-matplotlib')
optdepends=('python-n2: for FastGammaRenderer'
            'python-urwid: for termview')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('5d8ff1a1846a9c16088565c64e47c303ded8c133410b115dabc4fe8293c3224e')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
