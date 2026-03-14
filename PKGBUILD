# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: Ainola
# Contributor: Ethan Schoonover

# shellcheck disable=SC2034

pkgname=gam
pkgver=7.36.01
pkgrel=1
pkgdesc="command line management for Google Workspace"
arch=('any')
url="https://github.com/GAM-team/GAM"
license=('Apache-2.0')
replaces=('gamadv-xtd3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
depends=('python>=3.10')

source=(
    "${pkgname^^}-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    "gam.sh"
)

sha256sums=('39998dd7dadf56552ef0f124f494e4cd8851cc1a9c6dac398c0c39a90284ede0'
            'f8613546b8d4a51f05342d3680553c20a2e0995c3be90e469f1da3bb83ca172e')

prepare() {
    mv "${pkgname^^}-$pkgver" "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    install -d -m 0755 "$pkgdir/usr/share/$pkgname"
    install -d -m 0755 "$pkgdir/usr/share/doc/$pkgname"

    cp -a src/gam src/tools "$pkgdir/usr/share/$pkgname/"
    cp -a wiki "$pkgdir/usr/share/doc/$pkgname/"

    install -Dm755 \
        src/gam.py -t "$pkgdir/usr/share/$pkgname"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 \
        src/gam.spec \
        src/gam.wxs \
        src/GamCommands.txt \
        src/GamUpdate.txt -t "$pkgdir/usr/share/$pkgname"

    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md src/callgam.py "$pkgdir/usr/share/doc/$pkgname"

    install -Dm755 ../gam.sh "$pkgdir/usr/bin/gam"

}
