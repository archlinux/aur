# Maintainer: amateurece <ethan.twardy at gmail dot com>

pkgname=sdbusplus-git
pkgver=r598.a8a092c0
pkgrel=3
pkgdesc="C++ bindings for systemd dbus APIs"
url="https://github.com/openbmc/sdbusplus"
arch=('i686' 'x86_64' 'aarch64')
license=('Apache')
depends=('systemd-libs' 'python-mako' 'python-inflection' 'python-yaml')
makedepends=('git' 'meson' 'python-setuptools')
source=("${pkgname}::git+https://github.com/openbmc/sdbusplus.git")
sha256sums=('SKIP')

_meson_setup() {
    arch-meson -Dtests=disabled -Dexamples=disabled "${pkgname}" build
}

prepare() {
    _meson_setup
}

pkgver() {
    cd "${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    _meson_setup
    meson compile -C build

    # Python tools
    cd "${pkgname}/tools"
    python setup.py build
}

package() {
    meson install -C build --destdir "$pkgdir"
    cd "${pkgname}/tools"
    python setup.py install --root="$pkgdir" --optimize=1
}
