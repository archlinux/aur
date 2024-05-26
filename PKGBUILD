# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.0
pkgrel=2
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("6360b9684d55bf071bd3ba3185b8b112c0df376950f0054037801c5fef5f12c5cf9b5a95d491987e84125ec55bf8069ab41c2665c672bafe35c88dc4df4923cf")
provides=("$pkgname")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "$pkgdir"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /"${site_packages:1}"/waybar_crypto.py "${pkgdir}/usr/bin/waybar-crypto"
}