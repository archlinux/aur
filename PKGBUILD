# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=25.7
pkgrel=2
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=(python-pytest python-pytest-benchmark ruff)
depends=(
    docformatter
    python
    python-click
    python-click-default-group
    python-jinja
    python-lxml
    python-requests
    python-toposort
    python-typing_extensions
)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=(ruff)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "python3.14.patch::https://github.com/tefra/xsdata/commit/28f63e8ffe912341e5622dfb7c0973d920c1fd05.patch")
sha256sums=('1291ef759f4663baadb86562be4c25ebfc0003ca0debae3042b0067663f0c548'
            '5bd5592c4e87bd26c1bc2b329fd2fd8cf143251ea6a90c60a3791f2ae5e82bcc')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -f -p1 < ../python3.14.patch || return 0
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests/
}

