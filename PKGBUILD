# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=weston
pkgname=$_pkgname-orbital-git
pkgver=1.7.90.4484.1b06292
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor modified for use with orbital'
arch=(i686 x86_64)
url='https://github.com/giucam/weston/tree/libweston'
license=('MIT')
depends=('libxkbcommon' 'wayland-git>=1.7.0' 'mesa' 'poppler-glib' 'mtdev' 'libva' 'libinput-git'
         'libxcursor' 'glu' 'cairo' 'pixman' 'libunwind' 'pango' 'colord' 'libwebp')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=('git://github.com/giucam/weston#branch=libweston')
sha1sums=('SKIP')

pkgver() {
    cd weston

    for i in major_version minor_version micro_version; do
        local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
    done

    echo $_major_version.$_minor_version.$_micro_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd weston
	./autogen.sh --prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-demo-clients-install \
		--with-cairo=gl \
		--enable-libinput-backend
	make
}

package() {
	cd weston
	make DESTDIR="${pkgdir}" -j1 install

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	install -Dm644 "shared/zalloc.h" "$pkgdir/usr/include/weston/zalloc.h"
	install -Dm644 "config.h" "$pkgdir/usr/include/weston/config.h"
}

