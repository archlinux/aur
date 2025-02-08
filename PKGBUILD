
pkgname=python-dateutil-git
pkgver=2.9.0.post0.r3.g9eaa5de
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD-3-Clause' 'Apache-2.0')
url="https://github.com/dateutil/dateutil"
depends=('python-six')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        "0001-fix-many-deprecation-errors.patch")
sha256sums=('SKIP'
            '84732fd631d4a562e477026ae2963a258551bf4aebc11a4e60966710d059436d')

pkgver() {
    cd dateutil
    git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
    cd dateutil
    git apply ../0001-fix-many-deprecation-errors.patch
    PYTHONPATH=src python updatezinfo.py
}

build() {
    cd dateutil
    python -m build --wheel --no-isolation
}

package() {
    cd dateutil
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
