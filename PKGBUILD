# Maintainer: igo95862 <address at domain dot tld>
pkgname=(
    'python-sdbus-git'
    'python-sdbus-notifications-git'
    'python-sdbus-networkmanager-git'
    'python-sdbus-secrets-git'
)
pkgbase='python-sdbus-git'
pkgver=r649.938ca81
pkgrel=1
pkgdesc="Modern Python library for D-Bus"
arch=('x86_64')
url="https://github.com/python-sdbus/python-sdbus"
license=('LGPL2.1')
depends=('python' 'systemd-libs')
makedepends=('git' 'python-setuptools' 'gcc' 'pkgconf')
source=(
    "$pkgbase"::"git+https://github.com/python-sdbus/python-sdbus"
    "python-sdbus-notifications"::"git+https://github.com/python-sdbus/python-sdbus-notifications"
    "python-sdbus-networkmanager"::"git+https://github.com/python-sdbus/python-sdbus-networkmanager"
    "python-sdbus-secrets"::"git+https://github.com/python-sdbus/python-sdbus-secrets"
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgbase"
    python setup.py build

    cd "$srcdir/python-sdbus-notifications"
    python setup.py build

    cd "$srcdir/python-sdbus-networkmanager"
    python setup.py build

    cd "$srcdir/python-sdbus-secrets"
    python setup.py build
}

check () {
    # TODO: After having a meson build system
    cd "$srcdir/$pkgbase"
    local test_lib_dir="./libtest"
    python setup.py build --build-lib "$test_lib_dir"
    env PYTHONPATH="$test_lib_dir" python -m unittest --verbose
}

package_python-sdbus-git() {
    provides=('python-sdbus')
    conflicts=('python-sdbus')
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
    arch=('any')
    cd "$srcdir"/python-sdbus-notifications
    python setup.py install --prefix /usr --root "$pkgdir"
}

package_python-sdbus-networkmanager-git() {
    provides=('python-sdbus-networkmanager')
    pkgdesc='NetworkManager binds for python-sdbus'
    depends=('python-sdbus')
    arch=('any')
    cd "$srcdir"/python-sdbus-networkmanager
    python setup.py install --prefix /usr --root "$pkgdir"
}

package_python-sdbus-secrets-git() {
    provides=('python-sdbus-secrets')
    pkgdesc='Freedesktop secrets binds for python-sdbus'
    depends=('python-sdbus')
    arch=('any')
    cd "$srcdir"/python-sdbus-secrets
    python setup.py install --prefix /usr --root "$pkgdir"
}
