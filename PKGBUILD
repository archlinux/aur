# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefano Facchini <stefano.facchini@gmail.com>
# Contributor: Jonathan Lestrelin <zanko@daemontux.org>
# Contributor: Lucio Zara <pennega@gmail.com>

pkgname=spice-gtk
pkgver=0.39
pkgrel=3
pkgdesc="GTK+ client library for SPICE"
arch=('x86_64')
url="https://www.spice-space.org/"
license=('LGPL2.1')
depends=('gtk3' 'libcacard' 'libjpeg-turbo' 'opus' 'phodav' 'usbredir' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('gobject-introspection' 'meson' 'spice-protocol' 'usbutils'  'vala')
provides=("spice-glib=$pkgver" "spice-gtk3=$pkgver")
replaces=('spice-glib' 'spice-gtk3')
source=("https://www.spice-space.org/download/gtk/$pkgname-$pkgver.tar.xz"{,.sig})
install=spice-gtk.install
sha256sums=('23acbee197eaaec9bce6e6bfd885bd8f79708332639243ff04833020865713cd'
            'SKIP')
validpgpkeys=('206D3B352F566F3B0E6572E997D9123DE37A484F') # Victor Toso de Carvalho <me@victortoso.com>

build() {
  arch-meson $pkgname-$pkgver build -D celt051=disabled
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# Support for extra mouse buttons (typically "Back" and "Forward" in e.g. Firefox) by Kevin Pouget:
# https://lists.freedesktop.org/archives/spice-devel/2020-May/051651.html
# His patches have been rebased on top of this commit to spice-protocol:
# https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/cbe7b2c28543f4c5e57d1db1b753b73a64104162
provides+=(spice-gtk)
conflicts+=(spice-gtk)

source+=("spice-extra-mouse-buttons.patch")
sha256sums+=('864a19a1b86e7472c39f7f0cb25da7ca65b5b12cfba941f4835d9cc64bebccd6')

_pkgname=$pkgname
pkgname+="-extra-mouse-buttons"
pkgrel="$pkgrel.1"
pkgdesc+=" (with support for extra mouse buttons)"
eval "$(declare -f build | sed 's/$pkgname/$_pkgname/g')"

prepare() {
  patch -d"$_pkgname-$pkgver" -Np1 -i "${srcdir}"/spice-extra-mouse-buttons.patch
}
