# Maintainer: éclairevoyant
# Contributor: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr at archlinux dot org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.27.1
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/$_pkgname/"
arch=(x86_64)
license=(custom:X11)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(libevdev libwacom mtdev systemd)
# upstream doesn't recommend building docs
makedepends=(check git gtk4 meson wayland-protocols)
checkdepends=(python-pytest)
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=("git+https://gitlab.freedesktop.org/$_pkgname/$_pkgname.git?signed#tag=$pkgver"
        0001-Three-finger-dragging-TFD-state-machine.patch
        0002-Cleanup.patch
        0003-TFD-add-debounce-state-for-touch-count-decrease.patch
        0004-Take-hold-gestures-and-clickpad-state-into-account.patch
        0005-Debounce-for-4-fingers-before-drag-starts.patch
        0006-Cancel-hold-gestures-instead-of-finishing-them.patch
        0007-Abort-TFD-within-50-ms-on-detection-of-4-fingers.patch
        )
b2sums=('SKIP'
        '94fb25e198d9a7d8fa05beb398edc0a384d2062c81ca9dc5131c566b97456461eeb5c277873ccf679456ac62bb5432c85ba21e8c5f24ef12d5aa5f05a8ba32f8'
        '1e409a1062464942661002aa4fd1f7603e9e03c70dab182e59e9ea66caf63ee09051fbfadcb71e76068f3b0286ed08abcff8d3678c846ad971705db710e4d071'
        'ca5f43ee91c732807c4a155b3f7f1e128afa875122302264eef8d63f784f0723fe64754f2ece7dd46a35774798698184e7fdb3ab04ef33da7d1ec39b7c4a69d8'
        '89e187b97eb7eb824ef1f65efe0a631663b641a18eadb62ee147dfabea40269311cd2c9e2591648411254a4d665ee41d00357c209d90d10acc7e63e54d6e0c97'
        'd909898f54d516a22c479f8b7ce7a419071172a092311d1d39aade3d430ec95924f30ecead23f94affddbeaf904f12098631b985f98929cd2e44f1c5e9e075b0'
        'fce7d335eed9dce132508d35f04835faedf1a73c3910d6542e7e0e537b3ce5acacdf7fc50ef9975f4815bf224879f9284f884d228abef4297c2b8579d7fa74de'
        'f58be0c19ec9afb087078037f12935526c2a275ce8ce37fdc6c1165a64d3fb4fa78c6458c18f0b51b3cfa21f6260ae21603e13c2d854979a2df58176e2965b1b'
        )
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
    cd $_pkgname
    patch -Np1 -i "$srcdir/0001-Three-finger-dragging-TFD-state-machine.patch"
    patch -Np1 -i "$srcdir/0002-Cleanup.patch"
    patch -Np1 -i "$srcdir/0003-TFD-add-debounce-state-for-touch-count-decrease.patch"
    patch -Np1 -i "$srcdir/0004-Take-hold-gestures-and-clickpad-state-into-account.patch"
    patch -Np1 -i "$srcdir/0005-Debounce-for-4-fingers-before-drag-starts.patch"
    patch -Np1 -i "$srcdir/0006-Cancel-hold-gestures-instead-of-finishing-them.patch"
    patch -Np1 -i "$srcdir/0007-Abort-TFD-within-50-ms-on-detection-of-4-fingers.patch"
}

build() {
    arch-meson $_pkgname build \
        -D udev-dir=/usr/lib/udev \
        -D documentation=false
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    install -vDm644 $_pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
