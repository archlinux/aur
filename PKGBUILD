# Maintainer: igo95862 <address at domain dot tld>
pkgname=('python-sdbus-git' 'python-sdbus-notifications-git')
pkgbase='python-sdbus-git'
pkgver=r396.6e72fc4
pkgrel=1
pkgdesc="Modern Python library for D-Bus"
arch=('x86_64')
url="https://github.com/igo95862/python-sdbus"
license=('LGPL-2.1-or-later')
depends=('python' 'systemd-libs')
makedepends=('git' 'python-setuptools' 'gcc')
source=("$pkgbase"::"git+https://github.com/igo95862/python-sdbus")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgbase"
    python setup.py build

    cd interfaces/notifications
    python setup.py build
}

check () {
    # TODO: After having a meson build system
    cd "$srcdir/$pkgbase"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    env PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python -m unittest --verbose
}

package_python-sdbus-git() {
    provides=('python-sdbus')
    optdepends=(
        'python-jinja: Code generator for dbus XML introspection'
        'python-sphinx: Autodoc for dbus members'
    )
    cd "$srcdir/$pkgbase"
    python setup.py install --prefix /usr --root "$pkgdir"
}

package_python-sdbus-notifications-git() {
    provides=('python-sdbus-notifications')
    pkgdesc='Freedesktop Notifications binds for python-sdbus'
    depends=('python-sdbus')
    cd "$srcdir/$pkgbase"/interfaces/notifications
    python setup.py install --prefix /usr --root "$pkgdir"
}
