# Maintainer: Alexis BRENON <brenon.alexis+aur@gmail.com>

pkgname=libinput-accel-profile-git
_commit=6e66324d
pkgver=1.15.3.r30.g6e66324d
pkgrel=1
pkgdesc="libinput library with acceleration profiles for touchpad"
url="https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/264"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
provides=("libinput=$pkgver")
conflicts=('libinput')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson' 'git') # 'doxygen' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=("git+https://gitlab.freedesktop.org/libinput/libinput.git#commit=$_commit")
sha512sums=('SKIP')
validpgpkeys=('SKIP')

pkgver() {
	cd libinput
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson libinput build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 libinput/COPYING \
    "$pkgdir/usr/share/licenses/libinput/LICENSE"
}
