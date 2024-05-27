# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.1
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("a8a955fd66cca2dea91170c74522a666bab664606ba926ff038f280b2b7d64219c899f74d7df5d4bcf7962547a9fac1f4f15e4b3b5aabe30d5f606d40aa0d65c")
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