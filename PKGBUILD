# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-packageurl
_gitpkgname=packageurl-python
pkgver=0.17.6

# git fetch https://github.com/package-url/packageurl-python.git "v${pkgver?}" && git rev-parse FETCH_HEAD:spec
_spec_commit=c398646bb2d642ccdd43bfbf5923cf650d69dc6a

pkgrel=1
pkgdesc='A purl aka. Package URL parser and builder'
arch=('any')
url='https://github.com/package-url/packageurl-python'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
optdepends=(
  'python-django-filter: for included contrib scripts'
  'python-sqlalchemy: for included contrib scripts'
)
conflicts=('python-packageurl-git')
options=('!debug' '!strip')
source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/package-url/packageurl-python/archive/v${pkgver}.tar.gz"
  "purl-spec-${_spec_commit}.tar.gz::https://github.com/package-url/purl-spec/archive/${_spec_commit}.tar.gz"
)
sha512sums=(
  '78027b3a6b9eeeb5e1f1bb222cf1b3d94c7edd1b84c96181823f70a6b660eeef73cdfc69a08f7379bd02665bacaee2b875b3c82fd23dee49e525d6256531cd14'
  '7b136a62149eb6f08a5581b5c315dff4aee4f84635c58c61a66530ba6918a46ec529c87f06266249ffec0932ad50eee2aaad871bc91a91f54f8870a94fc60161'
)

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  echo >&2 'Linking spec source directory'
  rm -rfv spec
  ln -fnsv ../"purl-spec-${_spec_commit}" spec

  echo >&2 'Running unit tests'
  test-env/bin/python -m pytest tests
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 mit.LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
