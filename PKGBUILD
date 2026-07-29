# Maintainer: Martin Vacek <mpvvac at gmail dot com>

pkgname=keyd-mapper
pkgver=0.2.2
pkgrel=1
pkgdesc="Visual editor for keyd configuration files"
arch=('any')
url="https://github.com/Martin3225/KeydMapper"
license=('MIT')
depends=('keyd' 'pyside6' 'polkit' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
install=keyd-mapper.install
source=("git+$url.git#tag=v$pkgver")
b2sums=('903fb186d9fff66657af58e05582f9cc2059b719b19e0005742e7124a32f2c810a54306983005fa059fae9bf0dc3fe44821282e20f0b8aebab426195814ec08b')

build() {
    cd KeydMapper
    python -m build --wheel --no-isolation
}

check() {
    cd KeydMapper
    PYTHONPATH="$srcdir/KeydMapper/KeydMapper/src" \
        QT_QPA_PLATFORM=offscreen \
        pytest -q -o addopts="" \
        --ignore=KeydMapper/tests/test_pylint.py \
        KeydMapper/tests
}

package() {
    cd KeydMapper
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm755 system/keyd-mapper-helper.py \
        "$pkgdir/usr/lib/keyd-mapper/keyd-mapper-helper"
    install -Dm644 system/io.github.keydmapper.apply-config.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.keydmapper.apply-config.policy"
    install -Dm644 data/keyd-mapper.desktop \
        "$pkgdir/usr/share/applications/keyd-mapper.desktop"
    install -Dm644 data/keyd-mapper.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/keyd-mapper.svg"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
