# Maintainer: Darkfish Tech <arch at darkfish dot com dot au>

_pyname=oauthenticator

pkgname="python-jupyterhub-${_pyname}"
pkgdesc="JupyterHub Authenticator for OAuth providers"
pkgver=17.5.0
pkgrel=1
url="https://github.com/jupyterhub/oauthenticator"
arch=('any')
license=('BSD-3-Clause')

depends=(
  'jupyterhub>2.2'
  'python'
  'python-jsonschema'
  'python-pyjwt'
  'python-requests'
  'python-ruamel-yaml'
  'python-tornado'
  'python-traitlets'
)
optdepends=(
  'python-google-auth-oauthlib: for use of GoogleOAuthenticator configured with either admin_google_groups and/or allowed_google_groups'
  'python-mwoauth: for use of MWOAuthenticator for mediawiki'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-hatch-requirements-txt'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-requests-mock'
  'python-google-auth-oauthlib'
  'python-mwoauth'
)

source=("${_pyname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('c85f40d1a98562787d8b4c13f9d011c2316c33be61825cf238b61d68e0021a46622dcd0668ce6f87659c5b9deaa7588bd12a91f1219ea2dd442cb95fd8b0e1a2')

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation -v
}

check() {
  cd "$_pyname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pyname-$pkgver"-*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$_pyname-$pkgver"

  python -m installer --destdir="$pkgdir" "dist/$_pyname-$pkgver"-*.whl

  # Install license and documentation files
  install -vDm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -vDm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  find examples -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  # Don't package tests
  rm -rfv "$pkgdir"/usr/lib/python*/site-packages/"$_pyname"/tests

  # Remove unit tests from the final package.
  #local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #rm -rfv "${pkgdir}/${site_packages}/$_pyname/tests/"
}

# vim:set ts=2 sw=2 et:
