# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: xduugu
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Vesa Kaihlavirta
# Upstream: https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/awesome

_pkgbase=awesome
_pkgname=$_pkgbase-way-cooler
pkgname=$_pkgname-git
pkgver=4.3.r333.g3b4f3640
pkgrel=1
pkgdesc='Highly configurable framework window manager (wayland compatible fork using way-cooler)'
arch=('x86_64' 'i686')
url="https://github.com/way-cooler/$_pkgbase"
license=('GPL2')
depends=('cairo'
         'dbus'
         'gdk-pixbuf2'
         'libxdg-basedir'
         'libxkbcommon-x11'
         'lua'
         'lua-lgi'
         'pango'
         'startup-notification'
         'xcb-util-cursor'
         'xcb-util-keysyms'
         'xcb-util-wm'
         'xcb-util-xrm'
         'libxfixes'
         'way-cooler')
makedepends=('asciidoc'
             'cmake'
             'docbook-xsl'
             'git'
             'imagemagick'
             'ldoc'
             'xmlto')
optdepends=('rlwrap: readline support for awesome-client'
            'dex: autostart your desktop files'
            'xcb-util-errors: for pretty-printing of X11 errors'
            'librsvg: for displaying SVG files without scaling artifacts')
provides=('notification-daemon' "$_pkgbase" "$_pkgname")
conflicts=("$_pkgbase")
backup=("etc/xdg/$_pkgbase/rc.lua")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abrev=7 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONFDIR=/etc \
        -DLUA_LIBRARY=/usr/lib/liblua.so.5.3
    make -C build
}

package() {
    cd "$pkgname"
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 -t "$srcdir/$pkgname/" "$pkgdir/usr/share/xsessions/awesome.desktop"
}
