# Maintainer: Agil Mammadov <mammadovagil@proton.me>

pkgname=python-tomlrt
_pkgname=tomlrt
pkgver=2.2.5
pkgrel=1
pkgdesc="A format-preserving TOML reader and writer for Python"
url="https://github.com/dimbleby/tomlrt/"
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=(python-pytest python-hypothesis python-tomli)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/dimbleby/tomlrt/v$pkgver/LICENSE")
sha256sums=('f1cdcccd52f94821d464933a86c61f1adfe9906fe21ff5f1cfe02bddee7d1c25'
            'e225a9a6f9cbe6ec24d3ce4fed908c0ea58c0f0a988a95d82525ad643b2d58de')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python -m installer --destdir="$srcdir/tmp" dist/*.whl
    PYTHONPATH="$srcdir/tmp$site_packages:$PYTHONPATH" python -m pytest
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
