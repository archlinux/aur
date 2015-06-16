# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-rift-git
pkgver=1.8.90.4701.6e605c5
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with Oculus Rift support'
arch=(i686 x86_64)
url='https://github.com/Nealefelaen/weston-rift'
license=('MIT')
makedepends=('git')
depends=('libxkbcommon' 'wayland' 'mesa' 'poppler-glib' 'mtdev' 'libva' 'libinput>=0.4'
         'libxcursor' 'glu' 'cairo' 'pixman' 'libunwind' 'pango' 'colord' 'libwebp' 'oculus-rift-sdk-jherico-git')
conflicts=('weston' 'weston-git')
provides=('weston')

source=('weston::git+https://github.com/ChristophHaag/weston-rift.git')
sha1sums=('SKIP')

prepare() {
        cd weston
}

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
	make DESTDIR="${pkgdir}" install

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	install -Dm644 "shared/zalloc.h" "$pkgdir/usr/include/weston/zalloc.h"
	install -Dm644 "config.h" "$pkgdir/usr/include/weston/config.h"
}

