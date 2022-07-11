# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexey Andreyev aa13q at ya.ru

pkgname='python-pymantic'
_module="${pkgname#python-}"
_repo_commit='43125e320076ca86074a41c0f02bce943a760c80'   # untagged 0.3.0 release version
pkgver=0.3.0
pkgrel=1
pkgdesc='Semantic Web and RDF library for Python'
arch=('any')
url="https://pypi.org/project/${_module}/${pkgver}"
_repo_owner='norcalrdf' # Need GitHub tarball for tests; PyPI source lacks some test files
_repo_url_api="https://api.github.com/repos/${_repo_owner}/${_module}"
license=('BSD')
depends=(
  'python'
  'python-requests'
  'python-lark-parser'
  'python-lxml'
  'python-pyld'
  'python-pytz'
  'python-rdflib'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-betamax'
  'python-nose'
)
_tarname="${_repo_owner}-${_module}-${_repo_commit::7}"
source=("${_tarname}.tar.gz::${_repo_url_api}/tarball/${_repo_commit}")
b2sums=('ead17a726aa661035c72f4e738a3c338fcf2058803ef0eefbe7d1aad7793e94b8a445dc5eab3961a1e4edefccbaade526476e7946c4b985eeb26559f6346b044')

build() {
  cd "${_tarname}"
  python setup.py build --executable='/usr/bin/env python'
}

check() {
  cd "${_tarname}"
    (
    export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
    nosetests \
      --detailed-errors \
      --no-byte-compile \
      --verbose \
      --with-id
  )
}

package() {
  cd "${_tarname}"
  python setup.py install --force --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"

  echo "Removing tests from package..."
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${_site_packages}/${_module}/tests/"
}
