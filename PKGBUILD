# Maintainer: RocketDev <ma2014119@outlook.com>

_pkgbase='uefi-firmware-parser'
pkgname=python-uefi-firmware
pkgver=1.12
pkgrel=1
pkgdesc='Parse BIOS/Intel ME/UEFI firmware related structures.'
arch=('x86_64')
url="https://github.com/theopolis/$_pkgbase"
license=('MIT') # the text in LICENSE is MIT, instead of BSD
depends=(
    'python'
    'glibc'
)
makedepends=(
    'python-build'
    'python-setuptools'
    'python-installer'
    'python-wheel'
    'cython'
)
checkdepends=(
    'python-pytest'
)
source=(
    "$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    fix-setup.patch
)
b2sums=('e68cfa8b128f0a094f89275a21da23333ab02d604e07875ec1146c8de829364a2b573582c69f06224a792b96ba1da69c78d2cc67a70632806bf3b7621e0110c2'
        '3bfe9d2e8ac0e825dbca8619bd88ed8d3b875e35b7de43bbe42dffa00122ea589d1cf9864071e02544f1b848e3442a60427372867de7de6a54ff66c88b19d6f6')

prepare() {
    cd "$_pkgbase-$pkgver"
    patch -p1 -i ../fix-setup.patch
}

build() {
    cd "$_pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgbase-$pkgver"
    python -m venv --system-site-packages .venv
    .venv/bin/python -m installer dist/*.whl
    mv uefi_firmware uefi_firmware-src # prevent name confliction (dirname vs pypkgname)
    .venv/bin/python -m pytest tests
    mv uefi_firmware-src uefi_firmware # for debug source extractions
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
