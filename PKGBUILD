# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=python-awesomeversion-git
pkgver=21.10.1.r1.g7121d5e
pkgrel=2
pkgdesc="One version package to rule them all."
arch=('any')
url="https://github.com/ludeeus/awesomeversion"
license=('MIT')
depends=(python)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd awesomeversion
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd awesomeversion

    # replace version "main" with correct version
    sed -e "s|version=\"main\"|version=\"${pkgver/.r*}\"|" -i setup.py
}

check() {
    cd awesomeversion
    PYTHONPATH=. pytest tests
}

build() {
    cd awesomeversion

    python setup.py build
}

package() {
    cd awesomeversion

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
