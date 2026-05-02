# Maintainer: Philipp Joram <mail [at] phijor [dot] me>
# Contributor: bittin

pkgname=mopidy-soundcloud
pkgver=4.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from SoundCloud"
arch=('any')
url="https://github.com/mopidy/mopidy-soundcloud"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-requests'
  'python-pykka'
  'python-beautifulsoup4'
  'mopidy>=4.0'
)
# checkdepends=(
#   'python-tox'
#   'python-vcrpy'
# )
source=(
  "${pkgname}-${pkgver}::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz"
)
sha512sums=('f6132bee74b65d39908c4140a2fc608137fb2c139b2a4c03bf73e95ec049be012b402c1aa947c35e8cf859fb1125cadf4974aab28b0d6f74657e404ae3e7303c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

# XXX: Tests are useless.
# * pytests imports `mopidy_soundcloud` directly, which might refer to a globally installed instance.
# * tox creates an isolated environment but doesn't forward SETUPTOOLS_SCM_PRETEND_VERSION, thus imports fail.
# check() {
#   cd "$srcdir/$pkgname-$pkgver"
#   export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
#   tox --skip-env "pyright|ruff.*"
# }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
