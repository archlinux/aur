# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: devome <evinedeng@hotmail.com>

pkgname=python-oxmsg
pkgver=0.0.2
pkgrel=2
pkgdesc="Extract attachments from Outlook .msg files."
arch=(any)
url="https://github.com/scanny/python-oxmsg"
license=(MIT)
depends=(python python-click python-olefile python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bdc2c1fe12bbd900a00362c7ca33fec82a398da0fb97bdb578ecde6092e5c6e3')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$site_packages/python_oxmsg-$pkgver.dist-info/licenses/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
