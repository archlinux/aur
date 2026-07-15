# Maintainer: Alex Robinson <alex@ironrobin.net>

pkgname=dtbsync
pkgver=0.2.0
pkgrel=1
pkgdesc='Synchronize the appropriate Device Tree Blob to the EFI System Partition'
arch=('any')
url='https://github.com/theironrobin/dtbsync'
license=('MPL-2.0')
depends=(
    'python'
    'python-colorama'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    '90-dtbsync.hook'
)
sha256sums=(
    'db5a365bbfcd7906bf772381550450559c080299631e80942ef89bfe8d87e8f4'
    'e4083b56ebf8d7fabb1e06aeb3bdc3f8cf81c551c6a72736135eb5f0805a0ea7'
)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 \
        "$srcdir/90-dtbsync.hook" \
        "$pkgdir/usr/share/libalpm/hooks/90-dtbsync.hook"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
