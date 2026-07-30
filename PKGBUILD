# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-akp02
pkgver=1.0.0
pkgrel=1
pkgdesc="Driver library for the Ajazz AKP02 USB secondary display"
arch=('any')
url="https://github.com/deonspengler/akp02"
license=('MPL-2.0')
depends=(
    'python'
    'python-pillow'
    'python-hidapi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
)
checkdepends=(
    'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/deonspengler/akp02/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "akp02-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "akp02-$pkgver"
    python -m pytest
}

package() {
    cd "akp02-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Vendor-provided udev rules belong in /usr/lib/udev/rules.d/ --
    # /etc/udev/rules.d/ is reserved for user-level overrides. Packaging
    # this means users of this PKGBUILD skip the manual "sudo cp" step
    # the README describes for a plain `pip install`.
    install -Dm644 udev/99-akp02.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-akp02.rules"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
