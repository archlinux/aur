# Maintainer: martiuk <me at martinke dot mp>

_pkgname=wayland-protocols
pkgname="${_pkgname}-explicit-sync-git"
pkgver=1.32.r18.gc4f5598
pkgrel=1
pkgdesc='Wayland protocols with explicit sync patch'
arch=('any')
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('git' 'wayland' 'meson' 'ninja')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=(
	"git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
	"https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/90.patch"
)
sha1sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    mkdir -p build
		patch -Np1 -i "${srcdir}/90.patch"
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

