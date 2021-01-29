# Maintainer: igo95862 <address at domain dot tld>
pkgname=python-sdbus-git
pkgver=r307.9eaeaa5
pkgrel=1
pkgdesc="Modern Python library for D-Bus"
arch=('any')
url="https://github.com/igo95862/python-sdbus"
license=('LGPL-2.1-or-later')
provides=('python-sdbus')
depends=('python' 'systemd-libs')
makedepends=('git' 'python-setuptools' 'gcc')
source=("$pkgname"::"git+https://github.com/igo95862/python-sdbus")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check () {
    # TODO: After having a meson build system
    cd "$srcdir/$pkgname"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    local python_package="$PWD/build/lib.linux-$CARCH-${python_version}"
    cp "$python_package"/sdbus/*.so ./sdbus/
    python -m unittest --verbose
}

build () {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix /usr --root "$pkgdir"
}
