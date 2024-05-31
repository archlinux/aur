# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.4
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("d1bf0d298720c3b8dc098aef3ca54f47a008231cc64d46d0c690d1cc8f8d9c1a0de33b125d3f1fe038dbea2da863e490e2997d7a92260d199b7dde5fc5ff78e3")
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