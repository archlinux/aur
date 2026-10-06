# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=pyznap
pkgver=1.6.0
pkgrel=3
pkgdesc="ZFS snapshot tool written in Python"
url="https://github.com/yboetz/pyznap"
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
license=('GPLv3')
arch=('any')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/yboetz/pyznap/archive/v${pkgver}.tar.gz"
)

sha256sums=('0668308132fecc7e37626490f683ebfaf2ffb89a462162cd112951178150bb1f')

prepare() {
  cd "$srcdir/pyznap-${pkgver}"
  sed -i \
    -e 's/^from pkg_resources import resource_string$/from importlib.resources import files/' \
    -e "s/resource_string(__name__, 'config\/pyznap.conf').decode(\"utf-8\")/files(__package__).joinpath('config', 'pyznap.conf').read_text(encoding='utf-8')/" \
    pyznap/utils.py
}

build() {
  cd "$srcdir/pyznap-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/pyznap-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
