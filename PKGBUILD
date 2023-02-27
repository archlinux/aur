_name=libinput
pkgname=${_name}-light
pkgver=1.22.1
pkgrel=1
pkgdesc="Input device management and event handling library (stripped from unnecessary dependencies)"
url="https://gitlab.freedesktop.org/libinput"
arch=('x86_64')
license=('custom:X11')
conflicts=("${_name}")
provides=("${_name}")
depends=('mtdev' 'systemd' 'libevdev')
makedepends=('meson' 'wayland-protocols')

optdepends=(
    'python-pyudev: libinput measure'
    'python-libevdev: libinput measure'
)

_snapshot="${_name}-${pkgver}"
source=("https://gitlab.freedesktop.org/libinput/libinput/-/archive/${pkgver}/${_snapshot}.tar.bz2")
sha256sums=('e13f6f118cfbbdc0b6e0edd5e3504abd96a8d0e33dc67cba31c6942c449f77af')

_buildflags=(
    'udev-dir=/usr/lib/udev'
    'libwacom=false'
    'debug-gui=false'
    'tests=false'
)

_buildflags=("${_buildflags[@]/#/"-D"}")

build() {
    arch-meson "${_buildflags[@]}" \
        "build" "${_snapshot}"

    meson compile -C "build"
}

package() {
    DESTDIR="${pkgdir}" meson install -C "build"

    install -Dm644 "${_snapshot}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
