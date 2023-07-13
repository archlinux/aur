# Maintainer:  Campbell Jones <arch at serebit dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=magpie-wm-git
_pkgname=magpie
pkgver=0.9.2.r8.g6c7d9d020
pkgrel=1
pkgdesc="Budgie's X11 window manager and compositor library forked from Mutter - latest git"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/BuddiesOfBudgie/$_pkgname"
license=(GPL)
depends=(colord dconf gnome-desktop gnome-settings-daemon graphene gsettings-desktop-schemas
         lcms2 libcanberra libgudev libinput libsm libxkbcommon-x11 libxkbfile mutter pipewire 
         startup-notification)
makedepends=(git gobject-introspection meson sysprof xorg-server)
provides=('magpie-wm')
conflicts=('magpie-wm')
source=("$_pkgname"::"git+https://github.com/BuddiesOfBudgie/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

build() {
    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson "${_pkgname}" build -Degl_device=true
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
