# Maintainer: Alexis Rouillard <contact@arouillard.fr>

pkgname=waybar-git
pkgver=r235.2d2fb88
pkgrel=1
pkgdesc='Highly customizable wayland bar for sway or wlroots based compositor.'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
depends=('gtkmm3'
         'jsoncpp'
         'libinput'
         'libnl>=3.0'
         'libsigc++>=2.0'
         'wayland'
         'libdbusmenu-gtk3'
         'libappindicator-gtk3'
         'libpulse'
         'wlroots')
makedepends=('meson'
             'git')

# source=("${pkgname}::git://github.com/Alexays/Waybar#commit=28c65c64"
source=("${pkgname}::git://github.com/Alexays/Waybar"
        'meson.build.patch')

sha1sums=('SKIP'
          '48f912d7765d1ecc851254a282215f2981dd5792')

pkgver() {
    cd "${srcdir}/${pkgname}"
    set -o pipefail git describe --long 2>/dev/null | sed 's/([^-]*-g)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch meson.build "${srcdir}/meson.build.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"
    meson --wrap-mode=nofallback --prefix=/usr "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}
