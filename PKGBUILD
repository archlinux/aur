# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-tomlrt
_pkgname=tomlrt
pkgver=2.3.1
pkgrel=1
pkgdesc="A format-preserving TOML reader and writer for Python"
url="https://github.com/dimbleby/tomlrt/"
depends=(python)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-hypothesis python-tomli)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0be2fdc2fe920be471452a2d01acc9e7e24eedbdd850c8e1d9f5abf9f998df44')

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
