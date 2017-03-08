# Maintainer: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-git
pkgver=2.0.90.5742.11ae2a30
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=('i686' 'x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
makedepends=('git')
depends=('libxkbcommon' 'wayland-git' 'wayland-protocols-git' 'mesa'
         'poppler-glib' 'mtdev' 'libva' 'libinput' 'libxcursor' 'glu' 'cairo'
         'pixman' 'libunwind' 'pango' 'colord' 'libwebp')
conflicts=('weston')
provides=('weston')

source=('git://anongit.freedesktop.org/wayland/weston')
sha1sums=('SKIP')

pkgver() {
    cd weston

    for i in major_version minor_version micro_version; do
        local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
    done

    echo $_major_version.$_minor_version.$_micro_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    mkdir -p weston/build
}

build() {
    cd weston/build
    ../autogen.sh --prefix=/usr \
        --libexecdir=/usr/lib/weston \
        --enable-demo-clients-install \
        --with-cairo=image
    make
}

package() {
    cd weston/build
    make DESTDIR="${pkgdir}" install
    install -Dm644 "config.h" "$pkgdir/usr/include/weston/config.h"

    cd ..
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "shared/zalloc.h" "$pkgdir/usr/include/weston/zalloc.h"
}
