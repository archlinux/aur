# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.2
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("25f69a8eb164235704de82d87b0d02c876187fed8004ea8a4cf6e89d4ac5f9d4a42b384fa6cc3cc37979c3d5932dff57bd3172ac083438934bb50595d4c8612e")
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