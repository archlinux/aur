# Maintainer: Renato Caldas <renato@calgera.com>
_pkgname=pdm
pkgname=python-pdm
pkgver=1.4.5
pkgrel=2
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
#checkdepends=('python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pdm-project/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('da1ac59d6e6b74e6e8f8860125b04056c9087c0a36dd943da439b03916fa3aea619bd832f1d1444ad635b00d6a9f6a25cd037cbc4662129b47ddbcb19ff3a792')

prepare() {
    cd $_pkgname-$pkgver
    sed -i "s/version = {use_scm = true}/version = '$pkgver'/" pyproject.toml
}

build() {
    cd $_pkgname-$pkgver
    python -m build --no-isolation --wheel .
}

# This seems to be broken upstream
# check() {
#     cd $_pkgname-$pkgver
#     pytest
# }

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
