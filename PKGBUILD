# Maintainer: Junyi Xu <junyixu0@gmail.com>

pkgname=lua51-ldbus
pkgver=r135.6d4909c
pkgrel=1
pkgdesc="Lua Bindings to dbus."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/daurnimator/ldbus"
license=('MIT')
groups=()
provides=()
depends=('lua51' 'libdbus')
makedepends=('luarocks' 'git')

_commit="6d4909c983c8a0e2c7384bac8055c628aa524ea2"

source=("git+https://github.com/daurnimator/ldbus.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/ldbus"
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/ldbus"
    luarocks --lua-version 5.1 make --pack-binary-rock ldbus-scm-0.rockspec \
        DBUS_INCDIR=/usr/include/dbus-1.0/ \
        DBUS_ARCH_INCDIR=/usr/lib/dbus-1.0/include
}

package() {
    cd "${srcdir}/ldbus"
    install -Dvsm444 "ldbus.so" "${pkgdir}/usr/lib/lua/5.1/ldbus.so"
}
