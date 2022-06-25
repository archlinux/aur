# Maintainer: Gleb Liutsko <gleb@liutsko.ru>

pkgname=mssql-scripter
pkgver=1.0.0a23
pkgrel=2
pkgdesc='Command line equivalent of the widely used Generate Scripts Wizard experience in SSMS'
url='https://github.com/microsoft/mssql-scripter'
license=('MIT')

arch=('any')
depends=('python' 'openssl-1.0' 'python-future' 'dotnet-runtime' 'sqltoolsservice')
makedepends=('python-setuptools')

source=("https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.zip"
        'sqltoolsservice-path-patch.patch')
sha256sums=('7e673e01442b39a06b3ccb9f72eb7659549f0a822b0927451ce610102382c83a'
            '50c9f3f66f27b604a92110919b9b99f74acab81a1651035a2bf31a6ab9ab9d9c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --forward --strip=1 --input='../sqltoolsservice-path-patch.patch'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    rm -v "$pkgdir/usr/bin/mssql-scripter.bat"
}
