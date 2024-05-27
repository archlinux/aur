# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.3
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("e4db11ad15c8d498a237d6f62152a5c91e3ae521a4da9386880b01eae8dbec09fcee7619939bf857921560f76c57c0c554591d5f0297eca7e3048df53aabeef6")
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