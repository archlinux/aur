# Maintainer: Renato Caldas <renato@calgera.com>
_pkgname=pdm
pkgname=python-pdm
pkgver=1.5.2
pkgrel=1
pkgdesc="A modern Python package manager with PEP 582 support."
arch=('any')
url="https://pdm.fming.dev/"
license=('MIT')
# 'python-pycomplete' is needed for auto-completion, but missing from aur
depends=(
    'python-appdirs'
    'python-click'
    'python-cfonts'
    'python-distlib'
    'python-dotenv'
    'python-keyring'
    'python-pdm-pep517'
    'python-pep517'
    'python-pythonfinder'
    'python-resolvelib'
    'python-shellingham'
    'python-tomlkit'
    'python-wheel'
)
makedepends=('python-build' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('e9cc62a2782fa79e36ea738a7ef8afbdb52ecb432f3cff68779a492606dc6ebf3f664afc356033a34baaf6c5747e46eebe43d29f67b4740b5ca59f1c0051c3da')

prepare() {
    cd $_pkgname-$pkgver
    sed -i "s/version = {use_scm = true}/version = '$pkgver'/" pyproject.toml
}

build() {
    cd $_pkgname-$pkgver
    python -m build --no-isolation --wheel .
}

package() {
    cd $_pkgname-$pkgver
    PIP_CONFIG_FILE=/dev/null pip install \
        --root="$pkgdir" \
        --isolated \
        --ignore-installed \
        --no-deps \
        --no-compile \
        --no-warn-script-location \
        dist/$_pkgname-$pkgver-py3-none-any.whl
    python -O -m compileall "${pkgdir}/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
