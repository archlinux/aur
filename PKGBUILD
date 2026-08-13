# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-folium
pkgname=python-$_name
pkgver=0.27.4
pkgrel=1
pkgdesc='Render Folium/Leaflet maps in Streamlit apps'
arch=(any)
url='https://github.com/randyzwitch/streamlit-folium'
license=(MIT)
depends=(
  python
  python-branca
  python-folium
  python-jinja
  python-streamlit
)
# Upstream builds with the uv backend, not setuptools; python-uv-build provides it.
makedepends=(
  python-build
  python-installer
  python-uv-build
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('ff9572ed74d04164b391f59caad4ab022cbca99f27bbafe88dbd7251e4679598')

build() {
  cd ${_name//-/_}-$pkgver
  # --skip-dependency-check: upstream pins uv_build>=0.8.4,<0.9 while Arch ships
  # python-uv-build 0.12.x. The pin is upstream's own conservatism, not a real
  # incompatibility -- the PEP 517 backend interface is unchanged across that
  # range -- so the check is skipped rather than patching pyproject.toml.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
