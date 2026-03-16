# AUR Maintainer: Adam Chovanec <git@adamchovanec.cz>
# AUR Ex-Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# Maintainer: Campbell Jones <serebit at archlinux dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgbase=ibus-git
pkgname=(ibus-git libibus-git)
pkgver=1.5.34.beta1.r39.g29bc7de
pkgrel=1
pkgdesc="Intelligent input bus for Linux/Unix"
arch=('x86_64')
url="https://github.com/ibus/ibus/wiki"
license=('LGPL-2.1-or-later')
depends=(
    'at-spi2-core'
    'cairo'
    'dconf'
    'gdk-pixbuf2'
    'glib2'
    'graphene'
    'gtk3'
    'gtk4'
    'hicolor-icon-theme'
    'libdbusmenu-glib'
    'libdbusmenu-gtk3'
    'libnotify'
    'libx11'
    'libxkbcommon'
    'libxfixes'
    'libxi'
    'pango'
    'python'
    'python-gobject'
    'wayland'
)
makedepends=(
    'glib2-devel'
    'gobject-introspection'
    'gtk-doc'
    'qt5-base'
    'unicode-character-database'
    'unicode-cldr'
    'unicode-emoji'
    'vala'
    'wayland-protocols'
    'git'
)
options=('!emptydirs')
source=(
  'git+https://github.com/fujiwarat/ibus.git'
)
b2sums=(
  'SKIP'
)

pkgver() {
  cd ibus
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ibus
    ./autogen.sh \
        --prefix=/usr \
        --libexecdir=/usr/lib/ibus \
        --sysconfdir=/etc \
        --enable-dconf \
        --enable-wayland \
        --enable-gtk-doc \
        --disable-gtk2 \
        --enable-gtk4 \
        --disable-memconf \
        --enable-ui \
        --disable-python2 \
        --with-python=python3 \
        --with-ucd-dir=/usr/share/unicode/
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package_ibus-git() {
    depends+=("libibus-git=$pkgver")
    conflicts+=("ibus")

    cd ibus

    make DESTDIR="$pkgdir" install
    make -C src DESTDIR="$pkgdir" uninstall
    make -C src DESTDIR="$pkgdir" install-dictDATA install-unicodeDATA
    make -C bindings DESTDIR="$pkgdir" uninstall
    make DESTDIR="$pkgdir" uninstall-pkgconfigDATA
}

package_libibus-git() {
    pkgdesc="IBus support library"
    depends=(libg{lib,object,io}-2.0.so)
    optdepends=('python-gobject: for Python integration')
    provides=('libibus-1.0.so')
    conflicts+=("libibus")

    cd ibus

    make -C src DESTDIR="$pkgdir" install
    make -C src DESTDIR="$pkgdir" uninstall-dictDATA uninstall-unicodeDATA
    make -C bindings DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-pkgconfigDATA
}
