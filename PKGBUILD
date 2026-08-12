# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=python-jkey
pkgver=0.3.2
pkgrel=3
pkgdesc="Python library for password management and TOTP verification"
arch=('any')
url="https://github.com/imjiaoyuan/jkey"
license=('MIT')
depends=('python>=3.10')
optdepends=('python-opencv: QR code scanning for jkey 2fa add')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0' 'uv')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3b5af006ed4b8a6e6bab51569a4074eb5d58a23ab2ff4a129c051d080ba707da')

build() {
    cd "jkey-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jkey-$pkgver"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="$pkgdir" dist/*.whl

    uv pip install --target "$pkgdir/$site_packages" portalocker
    rm -f "$pkgdir/$site_packages/.lock"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
