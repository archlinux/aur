# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="prompt-toolkit"
pkgname="python-${_name}"
pkgver=3.0.47
pkgrel=1
pkgdesc="Library for building powerful interactive command line applications in Python"
arch=('any')
url="https://${pkgname}.readthedocs.io"
_url="https://github.com/prompt-toolkit/${pkgname}"
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
depends=('python>=3.7.0' 'python-pygments' 'python-typing_extensions'
         'python-wcwidth' 'python-pyperclip' 'python-asyncssh')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${pkgver}.tar.gz")
sha256sums=('c272136b184e313191a4f3cbc497ed5f3a29ebea3df1aae4eb8619e3d2654aaa')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH="src" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name//-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "${pkgdir}${site_packages}/${_name//-/_}-${pkgver}.dist-info/AUTHORS.rst" \
    "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS.rst"
}
