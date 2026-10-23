# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-tomlrt
_pkgname=tomlrt
pkgver=2.3.2
pkgrel=1
pkgdesc="A format-preserving TOML reader and writer for Python"
url="https://github.com/dimbleby/tomlrt/"
depends=(python)
makedepends=(python-build python-installer 'python-flit-core>=4.1')
checkdepends=(python-pytest python-hypothesis python-tomli)
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimbleby/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('427d312438b957387d0786a6c42db75daafd740c1f0f960935219bd6afba09d5')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "$srcdir/tmp"
    python -m installer --destdir="$srcdir/tmp" dist/*.whl
    PYTHONPATH="$srcdir/tmp$site_packages:$PYTHONPATH" python -m pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
