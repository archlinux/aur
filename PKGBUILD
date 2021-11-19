# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=wayland-protocols
pkgname="${_pkgname}-git"
pkgver=1.23.r7.ge5d63e9
pkgrel=1
pkgdesc='Wayland protocols that add functionalities not available in the core protocol'
arch=('any')
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('git' 'wayland' 'meson' 'ninja')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git")
sha1sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "${_pkgname}/build"
}

build() {
    meson build "${_pkgname}" --buildtype=release --prefix=/usr
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dt "$pkgdir/usr/share/licenses/${_pkgname}" -m 644 "$_pkgname/COPYING"
}
