# Maintainer: Renato Caldas <renato@calgera.com>
_pkgname=pdm
pkgname=python-pdm
pkgver=1.5.3
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
sha512sums=('e61f0e187b29532a56e8d95dc9f066f84ab06f843df6cd10082cf779b993b42b8e185d219e4389a35aa83089cd9ebab550e0af085957af12a59c727b5c5c15a9')

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
