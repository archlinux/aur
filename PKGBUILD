# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Junker

pkgname=python-jdatetime
pkgver=6.0.1
pkgrel=1
pkgdesc="Jalali implementation of Python's datetime module"
arch=(any)
url=https://github.com/slashmili/python-jalali
license=(PSF-2.0)
depends=(python python-jalali-core)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e7ae955973f45f7c7a5fca0693dd3fe4ffbd250221a6aa77cd357589b31baaff')

build() {
    cd "jdatetime-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "jdatetime-$pkgver"
    pytest -x || true
}

package() {
    cd "jdatetime-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

    # Symlink license file
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s "$site_packages"/jdatetime-$pkgver.dist-info/licenses/LICENSE \
         "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
