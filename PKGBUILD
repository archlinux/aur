# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-tomlrt
_pkgname=tomlrt
pkgver=2.2.14
pkgrel=1
pkgdesc="A format-preserving TOML reader and writer for Python"
url="https://github.com/dimbleby/tomlrt/"
depends=(python)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-hypothesis python-tomli)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5544d9bf229eba6dc8737c18de28b06b222c6f0992f0e5cd042c8b2e9e397ec2')

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
