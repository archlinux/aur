# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=ydata-profiling
pkgname=python-ydata-profiling
pkgver=4.17.0
pkgrel=1
pkgdesc='Create HTML profiling reports from pandas DataFrame objects'
arch=(any)
url='https://github.com/ydataai/ydata-profiling'
license=(MIT)
depends=(
  ipython
  python
  python-dacite
  python-dateutil
  python-htmlmin
  python-imagehash
  python-ipywidgets
  python-jinja
  python-matplotlib
  python-markupsafe
  python-multimethod
  python-networkx
  python-numba
  python-numpy
  python-packaging
  python-pandas
  python-phik
  python-pillow
  python-pydantic
  python-requests
  python-seaborn
  python-scipy
  python-statsmodels
  python-tangled-up-in-unicode
  python-tqdm
  python-typeguard
  python-visions
  python-wordcloud
  python-yaml
)
conflicts=(python-pandas-profiling)
replaces=(python-pandas-profiling)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('f6c9ec97bb51035d65c102f68b29abfe7a177aee176fe65d2f6bfa89690b09ad9f82f7905bad01b4e77b56cc8d3e7a37cf43aec8bfbd547fb10f1e120c9e02c0')

prepare() {
  # fix version fallback (the git snapshot does not contain the VERSION file)
  sed -i 's|version = "0.0.dev0"|version = "'$pkgver'"|' $_name-$pkgver/setup.py

  # drop version constraints for setuptools
  sed -i 's|"setuptools>=72.0.0,<80.0.0"|"setuptools"|' $_name-$pkgver/pyproject.toml
  sed -i 's|"setuptools-scm>=8.0.0,<9.0.0"|"setuptools-scm"|' $_name-$pkgver/pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
