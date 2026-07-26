# Maintainer: Martin Vacek <mpvvac at gmail dot com>

pkgname=keyd-mapper
pkgver=0.1.0
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
b2sums=('07f7eb5260709949c5409bd91452cba862bd3cccbf12e1516fc01cdfa5ac400f1be4ce2bd11bd737a85b7531e3d2cb6925dee02a679f5b7c16679b49cbc93dd9')

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
