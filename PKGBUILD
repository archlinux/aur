# Maintainer: Nikos Toutoutzoglou <nikos dot toutou at protonmail dot com>

pkgname=python-iptvtools
_name=iptvtools
pkgver=0.3.1
pkgrel=2
pkgdesc="Provides iptv-filter script tool to maintain IPTV lists."
arch=('any')
url="https://github.com/huxuan/iptvtools"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-pydantic-settings'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pytest'
  'python-setuptools'
  'python-sphinx'
  'python-sphinxcontrib-programoutput'
  'python-wheel'
)
optdepends=('ffmpeg: Additional stream filtering')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/huxuan/iptvtools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('793cd8fa256dfd229dded6865798ac01d4904ffad2212c63d538ad302bbc783a')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
