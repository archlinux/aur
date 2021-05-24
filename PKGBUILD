# Maintainer: Renato Caldas <renato dat calgera ot com>
pkgname=python-cfonts
pkgver=1.5.0
pkgrel=1
pkgdesc="Python port of cfonts"
arch=('any')
url="https://github.com/frostming/python-cfonts"
license=('MIT')
depends=('python-pdm-pep517' 'python-colorama')
makedepends=('python-build' 'python-pip')
checkdepends=('python-pytest')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/frostming/python-cfonts/archive/refs/tags/v1.4.0.zip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('2e5232dde6fd3706e8bd2618bde015828b4f906aa1b08c23eea5f01818eabd472df818e2ded116a394de847cb9fbbda95c896c4bc9f6badb2585527bdc754321')

build() {
    cd $pkgname-$pkgver
    python -m build --no-isolation --wheel .
}

check() {
    cd $pkgname-$pkgver
    pytest
}

package() {
    cd $pkgname-$pkgver
    PIP_CONFIG_FILE=/dev/null pip install \
        --root="$pkgdir" \
        --isolated \
        --ignore-installed \
        --no-deps \
        --no-compile \
        --no-warn-script-location \
        dist/${pkgname//-/_}-$pkgver-py3-none-any.whl
    python -O -m compileall "${pkgdir}/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
