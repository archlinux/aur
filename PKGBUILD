# Maintainer: éclairevoyant
# Contributor: Jasper van Bourgognie <louiecaulfield at gmail dot com>
# Contributor: Andreas Radke <andyrtr at archlinux dot org>

_pkgname=libinput
pkgname="$_pkgname-three-finger-drag"
pkgver=1.27.0
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
        '1e098d55144670cb3232b6bdd6554966412b845b0f53f2e73c8d4d3dfed9825fa96348159126628d5aade3c71bbd1db79251e982c1c8b68ba66175019ad754f0'
        '8901472e7d86bc3fc1936d3309472651a76d2b24098d1692b00febb1ad0c227ad46e2090813207dc5b25e61edccfb4d6cdc54019509436a86f3ab83ceeca8526'
        '49368261c9a893b97a96c22ebb3aa009bb892aeb2011831cc53d22e69b18895301cd1c440c40fedf9f3b3e381c50ad393b39ef4bbf11c851dab5cd80fc18d661'
        'cab9b5f9a37e675d053bd8919a9950d8f573f4dde49e6e673be515ccc5efa48ec86fc4aaf8fb697e230ce7b643439ecba85038b77e9bc46453c5a190e07a8ab1'
        '5bb2c8ca0b1b42cb7421be7a2707aa0c8e0dd0c257ef727dbcf02ef6ed86a70e4d31238c8538015ac5c6bb845be1d0710ba8339b2aa5d09cbea88f9be7d2713e'
        '615fa2dd9941162ae5fafeed37063295198899e811372d06e4e64460f3d236a26e0c33e4b5b83677db9f17d17b796c4472dbc3291306409c39723136ce3a2972'
        'd167d03ac4a72a8439c9dd31cf4b33d8642572decf375f7e9a1d0ad97957527aa7fdfeb8fa683e57078f9dd07d326a60d456ec43d64ae11868060c8e55877b43'
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
