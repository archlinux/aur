# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-pdf-viewer
pkgname=python-$_name
pkgver=0.0.30
pkgrel=1
pkgdesc='Embed and annotate PDF documents in Streamlit apps'
arch=(any)
url='https://github.com/ScienciaLAB/streamlit-pdf-viewer'
license=(Apache-2.0)
depends=(
  python
  python-streamlit
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# The sdist ships NO licence file -- upstream's setup.cfg sets `license-files = []`
# -- so it is fetched separately from the matching git tag. Without this there is
# nothing to install into /usr/share/licenses.
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz
        LICENSE::https://raw.githubusercontent.com/lfoppiano/streamlit-pdf-viewer/v$pkgver/LICENSE)
sha256sums=('316ac73e123652e1afc8ae4a7fa78a9f08c7999cc9c46cb1e3890b34305f770e'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Upstream's find_packages() sweeps in the test suite, which installs a
  # TOP-LEVEL `tests` module into site-packages (95 files). That is a generic name
  # and would shadow or collide with any other package doing the same, so drop it
  # and prune it from RECORD so the metadata stays truthful.
  local _site
  _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  rm -rf "$pkgdir$_site/tests"
  sed -i '/^tests\//d' "$pkgdir$_site/${_name//-/_}-$pkgver.dist-info/RECORD"
  sed -i '/^tests$/d' "$pkgdir$_site/${_name//-/_}-$pkgver.dist-info/top_level.txt"

  install -vDm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
